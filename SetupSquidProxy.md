# Squid Proxy Server (Basic Auth) — Setup Steps

The following steps set up a Squid proxy that listens on **0.0.0.0:8080** and requires **Basic Auth** via `htpasswd`.

---

## Install Squid Proxy If Needed

```bash
sudo apt update
sudo apt install -y squid apache2-utils

# create password file with first user (you'll be prompted for a password)
sudo htpasswd -c /etc/squid/passwd proxyuser
# add more users later without -c
sudo htpasswd /etc/squid/passwd anotheruser
# lock down permissions
sudo chown proxy:proxy /etc/squid/passwd 2>/dev/null || true
sudo chmod 640 /etc/squid/passwd
```

---

## Backup Original Configuration

```bash
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak
```

---

## Create Minimal Config File

```bash
sudo tee /etc/squid/squid.conf >/dev/null <<'EOF'
# ==== Listener ====
http_port 0.0.0.0:8080

# ==== Auth (Basic over htpasswd) ====
# Helper path differs by distro:
#   Debian/Ubuntu: /usr/lib/squid/basic_ncsa_auth
#   RHEL-family:   /usr/lib64/squid/basic_ncsa_auth
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
# uncomment the next line on RHEL-based systems:
#auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic realm "Authenticated Proxy"
auth_param basic credentialsttl 2 hours
acl auth_users proxy_auth REQUIRED

# ==== Allow CONNECT to any port (be deliberate; this is wide-open) ====
acl Safe_ports port 1-65535
acl SSL_ports  port 1-65535
acl CONNECT method CONNECT

# Default safety checks (must appear before allow)
http_access deny !Safe_ports
http_access deny CONNECT !SSL_ports

# ==== Access policy ====
# Only authenticated users may use the proxy
http_access allow auth_users
http_access deny all

# Optional: privacy-lean
via off
forwarded_for off
request_header_access X-Forwarded-For deny all
EOF
```

---

## Start Service

```bash
sudo systemctl enable squid
sudo systemctl restart squid
sudo systemctl status squid --no-pager
ss -ltnp | grep 8080
```

---

## Open Firewall if Needed

```bash
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
```

---

## Test Connections

```bash
curl -v -x http://proxyuser:YOURPASS@<proxy-ip>:8080 http://example.com/
curl -v -x http://proxyuser:YOURPASS@<proxy-ip>:8080 https://example.com/
```
