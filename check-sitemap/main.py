#!/usr/bin/env python3
import datetime as dt
import http.server
import os
import re
import requests as r
import time
import socketserver
import sys
import tempfile as tf
import xml.etree.ElementTree as ET
import threading
import logging
from croniter import croniter

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

# -------------------
# Logging setup
# -------------------
log_level = os.environ.get("LOG_LEVEL", "INFO").upper()
logging.basicConfig(
    level=log_level,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)]
)
logger = logging.getLogger(__name__)

# -------------------
# Global config
# -------------------
input = os.environ.get('TARGET', '')
if not input:
    logger.error("❌ TARGET environment variable is not set")
    sys.exit(1)

cron_expr = os.environ.get("CRON_SCHEDULE", "0 * * * *")  # default: top of every hour

outdir = "/app/metrics/"
os.makedirs(outdir, exist_ok=True)

def get_output_filename(url):
    regex = re.compile(r'^https?:\/\/([^\/]+)')
    match = re.match(regex, url)
    if not match:
        logger.error(f"❌ Could not extract hostname from URL: {url}")
        sys.exit(1)
    return match[1]

outfile = os.path.join(outdir, f"sitemap_{get_output_filename(input)}.prom")
version = "1.0"

# -------------------
# HTTP handler
# -------------------
class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=outdir, **kwargs)
    def do_GET(self):
        if self.path == '/metrics':
            try:
                with open(outfile, 'r') as f:
                    content = f.read()
                self.send_response(200)
                self.send_header('Content-type', f'text/plain; version={version}')
                self.end_headers()
                self.wfile.write(content.encode('utf-8'))
            except FileNotFoundError:
                self.send_response(404)
                self.end_headers()
                self.wfile.write(b'Metrics file not found.\n')
        elif self.path == '/healthz':
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b'OK\n')
        else:
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b'Not found.\n')

def is_port_in_use(port: int) -> bool:
    import socket
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        return s.connect_ex(('localhost', int(port))) == 0

# -------------------
# Sitemap fetch & analysis
# -------------------
def get_sitemap(url):
    global filesize
    headers = {"User-Agent": f"check-sitemap/{version}"}
    try:
        resp = r.get(url, headers=headers, timeout=30)
        resp.raise_for_status()
    except Exception:
        logger.exception(f"Error fetching sitemap from {url}")
        raise

    with tf.NamedTemporaryFile(delete=False) as f:
        f.write(resp.content)
    filesize = os.path.getsize(f.name)
    logger.info(f"Downloaded sitemap ({filesize} bytes) -> {f.name}")
    return f.name

def analyze_xml_sitemap(file):
    global sm_age_newest, sm_age_oldest, sm_item_count
    try:
        tree = ET.parse(file)
        root = tree.getroot()
        ns = {'object': 'http://www.sitemaps.org/schemas/sitemap/0.9'}
        sm_lastmod_items = root.findall('.//object:lastmod', ns)
        sm_newest = dt.datetime.fromisoformat("1970-01-01T00:00:00+00:00")
        sm_oldest = dt.datetime.now(dt.timezone.utc)
        sm_item_count = 0

        for sm_item in sm_lastmod_items:
            try:
                sm_timestamp = dt.datetime.fromisoformat(sm_item.text)
                sm_item_count += 1
                if sm_timestamp > sm_newest:
                    sm_newest = sm_timestamp
                if sm_timestamp < sm_oldest:
                    sm_oldest = sm_timestamp
            except Exception:
                logger.warning(f"Invalid timestamp in sitemap: {sm_item.text}")

        sm_age_newest = int((dt.datetime.now(dt.timezone.utc) - sm_newest).total_seconds())
        sm_age_oldest = int((dt.datetime.now(dt.timezone.utc) - sm_oldest).total_seconds())

        logger.info(f"Sitemap analysis: {sm_item_count} items, newest={sm_age_newest}s, oldest={sm_age_oldest}s")
        return sm_age_newest, sm_age_oldest, sm_item_count

    except Exception:
        logger.exception("Error analyzing sitemap XML")
        raise

# -------------------
# Metrics writer
# -------------------
def write_prom_metrics():
    try:
        analyze_xml_sitemap(get_sitemap(input))
        with open(outfile, "w") as f:
            f.write(f"# HELP sitemap_newest_item_age_seconds Age in seconds of the sitemaps newest object\n")
            f.write(f"# TYPE sitemap_newest_item_age_seconds gauge\n")
            f.write(f"sitemap_newest_item_age_seconds{{target=\"{get_output_filename(input)}\"}} {sm_age_newest}\n")
            f.write(f"# HELP sitemap_oldest_item_age_seconds Age in seconds of the sitemaps oldest object\n")
            f.write(f"# TYPE sitemap_oldest_item_age_seconds gauge\n")
            f.write(f"sitemap_oldest_item_age_seconds{{target=\"{get_output_filename(input)}\"}} {sm_age_oldest}\n")
            f.write(f"# HELP sitemap_item_count Number of lastmod items in sitemap\n")
            f.write(f"# TYPE sitemap_item_count gauge\n")
            f.write(f"sitemap_item_count{{target=\"{get_output_filename(input)}\"}} {sm_item_count}\n")
            f.write(f"# HELP sitemap_file_size_bytes Size of the downloaded sitemap file in bytes\n")
            f.write(f"# TYPE sitemap_file_size_bytes gauge\n")
            f.write(f"sitemap_file_size_bytes{{target=\"{get_output_filename(input)}\"}} {filesize}\n")

        logger.info("✅ Metrics file updated")
    except Exception:
        logger.exception("❌ Failed to update metrics")

# -------------------
# HTTP server thread
# -------------------
def start_http_server():
    host = "0.0.0.0"
    port = 8080
    if not is_port_in_use(port):
        with socketserver.TCPServer((host, port), Handler) as httpd:
            logger.info(f"HTTP server started at {host}:{port}")
            httpd.serve_forever()
    else:
        logger.error(f"Port {port} is already in use, cannot start server")

# -------------------
# Cron scheduler loop
# -------------------
def cron_scheduler():
    base = dt.datetime.now(dt.timezone.utc)
    iter = croniter(cron_expr, base)
    next_run = iter.get_next(dt.datetime)

    while True:
        now = dt.datetime.now(dt.timezone.utc)
        if now >= next_run:
            logger.info(f"⏰ Running job scheduled at {next_run}")
            write_prom_metrics()
            next_run = iter.get_next(dt.datetime)
            logger.info(f"Next run scheduled at {next_run}")
        time.sleep(1)

# -------------------
# Main loop
# -------------------
if __name__ == "__main__":
    logger.info(f"Starting sitemap checker for {input}")
    logger.info(f"Using CRON_SCHEDULE='{cron_expr}'")

    # Start server in background
    threading.Thread(target=start_http_server, daemon=True).start()

    # Start cron scheduler (blocking loop)
    cron_scheduler()
