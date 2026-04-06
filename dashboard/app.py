from flask import Flask, render_template, request, redirect
import os

app = Flask(__name__)

LOG_FILE = os.path.expanduser("~/MyFirewall/logs/firewall.log")
BLOCK_LIST = os.path.expanduser("~/MyFirewall/rules/blocked_ips.txt")

def get_logs():
    if not os.path.exists(LOG_FILE):
        return []
    with open(LOG_FILE, "r") as f:
        return f.readlines()[-50:]

def get_blocked_ips():
    if not os.path.exists(BLOCK_LIST):
        return []
    with open(BLOCK_LIST, "r") as f:
        return f.read().splitlines()

@app.route("/")
def index():
    logs = get_logs()
    ips = get_blocked_ips()
    return render_template("index.html", logs=logs, ips=ips)

@app.route("/unblock", methods=["POST"])
def unblock():
    ip = request.form.get("ip")
    if ip:
        os.system(f"sudo ufw delete deny from {ip}")
        with open(BLOCK_LIST, "r") as f:
            lines = f.readlines()
        with open(BLOCK_LIST, "w") as f:
            for line in lines:
                if ip not in line:
                    f.write(line)
    return redirect("/")

if __name__ == "__main__":
    app.run(debug=True)