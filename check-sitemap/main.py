#!/usr/bin/env python3
import datetime as dt
import grp
import http.server
import os
import pwd
import re
import requests as r
import socketserver
import sys
import tempfile as tf
import xml.etree.ElementTree as ET
import traceback

"""
This script fetches a sitemap from a given URL and checks
* the validity of the XML and
* the min and max age of its elements.

It prints out
  * sitemap_newest_item_age_seconds
  * sitemap_oldest_item_age_seconds
  * sitemap_item_count
  * sitemap_file_size_bytes
in a way that prometheus should handle it.
"""

def get_output_filename(url):
  global hostname
  regex = re.compile('^https?:\/\/([^\/]+)')
  match = re.match(regex, url)
  hostname = match[1]
  return hostname

input = os.environ.get('TARGET', '')
outdir = "/app/metrics/"
outfile = outdir + "sitemap_" + get_output_filename(input) + ".prom"

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=outdir, **kwargs)
    def do_GET(self):
        if self.path == '/metrics':
          try:
            with open(outfile, 'r') as f:
                content = f.read()
            self.send_response(200)
            self.send_header('Content-type', 'text/plain; version=0.0.4')
            self.end_headers()
            self.wfile.write(content.encode('utf-8'))
          except FileNotFoundError:
              self.send_response(404)
              self.end_headers()
              self.wfile.write(b'Metrics file not found.\n')
        else:
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b'Not found.\n')

def is_port_in_use(port: int) -> bool:
    import socket
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        return s.connect_ex(('localhost', int(port))) == 0

print(f"Input URL: {input}")

def cleanup(file):
  # Delete temporary file
  os.remove(file)

def get_sitemap(url):
  # Fetches a sitemap and saves it to a file
  # Returns file name (str)
  global filename
  global filesize
  try:
    resp = r.get(url)
  except Exception as e:
    print(e)
  with tf.NamedTemporaryFile(delete=False) as f:
    f.write(resp.content)
  filename = f.name
  filesize = os.path.getsize(f.name)
  return filename

def analyze_xml_sitemap(file):
  # Function expects file to be a (str) path to an XML sitemap.
  # It will check the tree to validate the xml, than count the items and gather
  # newest and oldest from lastmod tag.
  # Returns
  #   sm_newest: age of the newest item from now in secs (int)
  #   sm_oldest: age of the oldest item from now in secs (int)
  #   sm_item_count: number of lastmod items in the parsed xml
  try:
    with open(file, "r") as f:
      try:
        tree = ET.parse(file)
      except Exception as e:
        print(f"Error parsing the xml file: {e}")

      global sm_age_newest
      global sm_age_oldest
      global sm_item_count

      root = tree.getroot()
      ns = {'object': 'http://www.sitemaps.org/schemas/sitemap/0.9'}
      sm_lastmod_items = root.findall('.//object:lastmod', ns)
      sm_newest = dt.datetime.fromisoformat("1970-01-01T00:00:00+00:00")
      sm_oldest = dt.datetime.now(dt.timezone.utc)
      sm_item_count = 0

      # Get min/max timestamps and count
      for sm_item in sm_lastmod_items:
        sm_timestamp = dt.datetime.fromisoformat(sm_item.text)
        sm_item_count += 1
        if sm_timestamp > sm_newest:
          sm_newest = sm_timestamp
        if sm_timestamp < sm_oldest:
          sm_oldest = sm_timestamp

      # Calculate time delta from now
      sm_age_newest = int(dt.timedelta.total_seconds(dt.datetime.now(dt.timezone.utc) - sm_newest))
      sm_age_oldest = int(dt.timedelta.total_seconds(dt.datetime.now(dt.timezone.utc) - sm_oldest))

      return sm_age_newest, sm_age_oldest, sm_item_count

  except Exception as e:
    print(f"Exception: {e}")

try:
  analyze_xml_sitemap(get_sitemap(input))
  hostname = "0.0.0.0"
  serverPort = 8080
  with open(outfile, "w") as f:
    f.write(f"# HELP sitemap_newest_item_age_seconds Age in seconds of the sitemaps newest object\n")
    f.write(f"# TYPE sitemap_newest_item_age_seconds gauge\n")
    f.write(f"sitemap_newest_item_age_seconds{{hostname=\"{hostname}\"}} {sm_age_newest}\n")
    f.write(f"# HELP sitemap_oldest_item_age_seconds Age in seconds of the sitemaps oldest object\n")
    f.write(f"# TYPE sitemap_oldest_item_age_seconds gauge\n")
    f.write(f"sitemap_oldest_item_age_seconds{{hostname=\"{hostname}\"}} {sm_age_oldest}\n")
    f.write(f"# HELP sitemap_item_count Number of lastmod items in sitemap\n")
    f.write(f"# TYPE sitemap_item_count gauge\n")
    f.write(f"sitemap_item_count{{hostname=\"{hostname}\"}} {sm_item_count}\n")
    f.write(f"# HELP sitemap_file_size_bytes Size of the downloaded sitemap file in bytes\n")
    f.write(f"# TYPE sitemap_file_size_bytes gauge\n")
    f.write(f"sitemap_file_size_bytes{{hostname=\"{hostname}\"}} {filesize}\n")

  if not is_port_in_use(serverPort):
    with socketserver.TCPServer((hostname, serverPort), Handler) as httpd:
        print(f"Server started at {hostname}:{serverPort}")
        httpd.serve_forever()
except Exception as e:
  print(f"❌ Exception: {type(e).__name__} - {e}")
  traceback.print_exc()
