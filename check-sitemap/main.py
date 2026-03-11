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
import traceback
import xml.etree.ElementTree as ET
import logging
import threading
import time

from croniter import croniter
from datetime import datetime

"""
This script fetches a sitemap from a given URL and checks
* the validity of the XML and
* the min and max age of its elements.

It prints out metrics in Prometheus format:
  * sitemap_newest_item_age_seconds
  * sitemap_oldest_item_age_seconds
  * sitemap_item_count
  * sitemap_file_size_bytes
"""

# ---------------------- Logging ----------------------
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)]
)
logger = logging.getLogger(__name__)

# ---------------------- Config ----------------------
input_url = os.environ.get('TARGET', '')
cron_expr = os.environ.get('CRON_SCHEDULE', '0 * * * *')  # default: every hour
outdir = "/app/metrics/"
os.makedirs(outdir, exist_ok=True)
outfile = outdir + "sitemap_" + re.sub(r'[^a-zA-Z0-9._-]', '_', input_url) + ".prom"
version = "1.0"

# ---------------------- HTTP Handler ----------------------
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
        else:
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b'Not found.\n')

def is_port_in_use(port: int) -> bool:
    import socket
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        return s.connect_ex(('localhost', int(port))) == 0

# ---------------------- Sitemap Functions ----------------------
def get_output_filename(url):
    regex = re.compile(r'^https?:\/\/([^\/]+)')
    match = re.match(regex, url)
    if match:
        return match[1]
    return "unknown"

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
        temp_path = f.name

    filesize = os.path.getsize(temp_path)
    logger.info(f"Downloaded sitemap ({filesize} bytes) -> {temp_path}")
    return temp_path

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

def write_prom_metrics():
    temp_file = None
    try:
        temp_file = get_sitemap(input_url)
        analyze_xml_sitemap(temp_file)
        with open(outfile, "w") as f:
            f.write(f"# HELP sitemap_newest_item_age_seconds Age in seconds of the sitemaps newest object\n")
            f.write(f"# TYPE sitemap_newest_item_age_seconds gauge\n")
            f.write(f"sitemap_newest_item_age_seconds{{target=\"{get_output_filename(input_url)}\"}} {sm_age_newest}\n")
            f.write(f"# HELP sitemap_oldest_item_age_seconds Age in seconds of the sitemaps oldest object\n")
            f.write(f"# TYPE sitemap_oldest_item_age_seconds gauge\n")
            f.write(f"sitemap_oldest_item_age_seconds{{target=\"{get_output_filename(input_url)}\"}} {sm_age_oldest}\n")
            f.write(f"# HELP sitemap_item_count Number of lastmod items in sitemap\n")
            f.write(f"# TYPE sitemap_item_count gauge\n")
            f.write(f"sitemap_item_count{{target=\"{get_output_filename(input_url)}\"}} {sm_item_count}\n")
            f.write(f"# HELP sitemap_file_size_bytes Size of the downloaded sitemap file in bytes\n")
            f.write(f"# TYPE sitemap_file_size_bytes gauge\n")
            f.write(f"sitemap_file_size_bytes{{target=\"{get_output_filename(input_url)}\"}} {filesize}\n")

        logger.info("✅ Metrics file updated")
    except Exception:
        logger.exception("❌ Failed to update metrics")
    finally:
        if temp_file and os.path.exists(temp_file):
            try:
                os.remove(temp_file)
                logger.debug(f"Cleaned up temp file {temp_file}")
            except Exception as e:
                logger.warning(f"Failed to delete temp file {temp_file}: {e}")

# ---------------------- HTTP Server ----------------------
def start_http_server():
    host = "0.0.0.0"
    port = 8080
    if not is_port_in_use(port):
        with socketserver.TCPServer((host, port), Handler) as httpd:
            logger.info(f"Server started at {host}:{port}")
            httpd.serve_forever()

# ---------------------- Cron Scheduler ----------------------
def scheduler_loop():
    base_time = datetime.now()
    cron = croniter(cron_expr, base_time)
    next_run = cron.get_next(datetime)

    logger.info(f"Scheduler started with CRON '{cron_expr}', first run at {next_run}")

    while True:
        now = datetime.now()
        if now >= next_run:
            logger.info("⏰ Running scheduled job: write_prom_metrics()")
            write_prom_metrics()
            next_run = cron.get_next(datetime)
            logger.info(f"Next run scheduled at {next_run}")
        time.sleep(1)

# ---------------------- Main ----------------------
if __name__ == "__main__":
    if not input_url:
        logger.error("❌ No TARGET environment variable set. Exiting.")
        sys.exit(1)

    logger.info(f"Input URL: {input_url}")
    logger.info(f"CRON schedule: {cron_expr}")

    # Start HTTP server in background
    threading.Thread(target=start_http_server, daemon=True).start()

    # Run once immediately at startup
    logger.info("🚀 Running initial metrics scrape at startup")
    write_prom_metrics()

    # Start scheduler loop (blocking)
    scheduler_loop()
