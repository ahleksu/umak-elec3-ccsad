#!/bin/bash
# Lab 2 launch template User-Data. Students paste this into Advanced details > User data. Fill in nothing.
# It starts a tiny web page on port 80. The page shows the instance ID and Availability Zone.
# Opening /burn on an instance uses both vCPUs for 8 minutes. Opening /stop ends the burn early.
# Amazon Linux 2023 already includes python3, so nothing is installed.
cat > /opt/labapp.py <<'PY'
import http.server, socketserver, subprocess, urllib.request, time

START = time.time()
BURN = None

def imds(path):
    token_req = urllib.request.Request(
        "http://169.254.169.254/latest/api/token", method="PUT",
        headers={"X-aws-ec2-metadata-token-ttl-seconds": "300"})
    token = urllib.request.urlopen(token_req, timeout=2).read().decode()
    req = urllib.request.Request(
        "http://169.254.169.254/latest/meta-data/" + path,
        headers={"X-aws-ec2-metadata-token": token})
    return urllib.request.urlopen(req, timeout=2).read().decode()

def burning():
    return BURN is not None and BURN.poll() is None

class Handler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        global BURN
        if self.path == "/health":
            body = "ok"
        elif self.path == "/burn":
            if not burning():
                BURN = subprocess.Popen(
                    ["timeout", "480", "sh", "-c",
                     "for i in 1 2; do (while :; do :; done) & done; wait"])
            body = "Burning both vCPUs for up to 8 minutes. Watch CloudWatch and the Auto Scaling Activity tab."
        elif self.path == "/stop":
            if burning():
                subprocess.call(["pkill", "-f", "while :"])
            body = "Burn stopped."
        else:
            body = (
                "UMak Cloud Computing Lab 2\n"
                "instance-id: %s\navailability-zone: %s\ninstance-type: %s\n"
                "uptime-seconds: %d\nburning: %s\n"
                "Try /burn, /stop, /health\n"
            ) % (imds("instance-id"), imds("placement/availability-zone"),
                 imds("instance-type"), time.time() - START, burning())
        data = body.encode()
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

socketserver.TCPServer.allow_reuse_address = True
socketserver.ThreadingTCPServer(("", 80), Handler).serve_forever()
PY

cat > /etc/systemd/system/labapp.service <<'UNIT'
[Unit]
Description=UMak Lab 2 web page
After=network-online.target

[Service]
ExecStart=/usr/bin/python3 /opt/labapp.py
Restart=always

[Install]
WantedBy=multi-user.target
UNIT

systemctl daemon-reload
systemctl enable --now labapp.service
