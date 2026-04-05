# Linux Auto Firewall


## Features

* Real-time SSH brute-force detection
* Automatic IP blocking using UFW
* Live connection monitoring
* Centralized logging system
* Configurable thresholds and rules
* Manual block and unblock support
* Whitelisting support
* Optional threat intelligence integration (VirusTotal)

---

## Project Structure

```
MyFirewall
├── logs/
│   └── firewall.log
├── rules/
│   ├── blocked_ips.txt
│   └── blocked_apps.txt
├── scripts/
│   ├── auto_block.sh
│   ├── block_ip.sh
│   ├── monitor.sh
│   ├── start_firewall.sh
│   ├── stop_firewall.sh
│   ├── view_logs.sh
│   ├── unblock_ip.sh
│   └── intel_check.sh
```

---

## Technologies Used

* Linux (Ubuntu)
* UFW (Uncomplicated Firewall)
* Bash scripting
* SSH logs (/var/log/auth.log)
* Threat intelligence API (VirusTotal)

---

## Setup and Installation

```
git clone https://github.com/machphy/linux-auto-firewall.git
cd linux-auto-firewall

chmod +x scripts/*.sh
```

---

## Usage

Start firewall:

```
./scripts/start_firewall.sh
```

Stop firewall:

```
./scripts/stop_firewall.sh
```

View logs:

```
./scripts/view_logs.sh
```

Manual block IP:

```
./scripts/block_ip.sh
```

Unblock IP:

```
./scripts/unblock_ip.sh
```

---

## Testing

Simulate brute-force attempts:

```
ssh fakeuser@localhost
```

Enter incorrect passwords multiple times to trigger blocking.

---

## Example Log

```
[2026-04-05 20:15:01] BLOCKED IP: 192.168.1.100 | Attempts: 5
```

---

## Important Notes

* Avoid blocking localhost (127.0.0.1)
* Always whitelist trusted IPs
* Run scripts with appropriate permissions

---

## Use Cases

* Security Operations Center (SOC) training
* Blue Team practice
* Intrusion detection and prevention labs
* Cybersecurity portfolio projects

---

## Future Improvements

* Web dashboard using Flask
* Telegram alert integration
* GeoIP-based blocking
* AI-based anomaly detection
* Containerization using Docker

---

## Author

Rajeev

---

## Support

If you find this project useful, consider starring the repository.
