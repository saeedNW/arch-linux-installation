# sshuttle – VPN over SSH Tunnel

sshuttle is a transparent proxy VPN that tunnels traffic over an SSH connection. It does not require administrative privileges on the remote server (only a normal SSH login) and works as a lightweight, quick alternative to OpenVPN or WireGuard for protecting your internet traffic while on untrusted networks.

> **ℹ️ Note:** sshuttle is **not** a full VPN; it forwards TCP and DNS traffic (and optionally UDP) over SSH. It is perfect for bypassing firewalls, protecting unencrypted connections, or accessing internal network resources.

---

## Table of Contents

- [sshuttle – VPN over SSH Tunnel](#sshuttle--vpn-over-ssh-tunnel)
  - [Table of Contents](#table-of-contents)
  - [1. Prerequisites](#1-prerequisites)
  - [2. Installation](#2-installation)
  - [3. Basic Usage](#3-basic-usage)
  - [4. Common Options](#4-common-options)
  - [5. Use Cases \& Examples](#5-use-cases--examples)
    - [Route all traffic (full VPN mode)](#route-all-traffic-full-vpn-mode)
    - [Route only specific subnets (split tunnelling)](#route-only-specific-subnets-split-tunnelling)
    - [Exclude a subnet (e.g., local network)](#exclude-a-subnet-eg-local-network)
    - [Use a non‑standard SSH port](#use-a-nonstandard-ssh-port)
    - [Run as a background daemon with logging](#run-as-a-background-daemon-with-logging)
    - [Use with SSH key (no password prompt)](#use-with-ssh-key-no-password-prompt)
  - [6. Stopping sshuttle](#6-stopping-sshuttle)
  - [7. Troubleshooting](#7-troubleshooting)
  - [8. Uninstalling](#8-uninstalling)

---

## 1. Prerequisites

- **Remote SSH server** with a standard user account (no root required).
- **Local machine** with `ssh` client (OpenSSH).
- **Python** on both ends (sshuttle is written in Python, but the server only needs a Python interpreter – version 2.7 or 3.x – which most Linux systems have).

> **💡 Tip:** No special configuration on the remote server is needed. The `sshd` daemon must be running and accessible.

---

## 2. Installation

Both OpenSSH (client) and sshuttle are available in the official Arch Linux `extra` repository.

```bash
sudo pacman -S openssh sshuttle
```

> **✅ Verification:** After installation, run `sshuttle --version` to confirm.

---

## 3. Basic Usage

The simplest command routes **all** IPv4 traffic through the remote server:

```bash
sshuttle --dns -r username@server-ip 0/0
```

**Explanation:**

| Option / Argument   | Purpose                                                                     |
| ------------------- | --------------------------------------------------------------------------- |
| `--dns`             | Forward DNS requests through the VPN (prevents DNS leaks).                  |
| `-r user@server-ip` | Remote SSH server. Optionally specify a port with `-r user@server-ip:port`. |
| `0/0`               | The subnet to route (in CIDR notation). `0/0` means all IPv4 traffic.       |

> **⚠️ Note:** The SSH user must have a normal shell. No special privileges are required – sshuttle uses SSH port forwarding internally.

After running the command, you will be prompted for the SSH user's password (or use SSH key authentication). Then all your traffic will be tunnelled through the remote server.

---

## 4. Common Options

| Option          | Description                                                       |
| --------------- | ----------------------------------------------------------------- |
| `-r, --remote`  | Remote SSH server (e.g., `user@host:port`).                       |
| `--dns`         | Forward DNS queries over the tunnel.                              |
| `--no-dns`      | Do not forward DNS (use local DNS).                               |
| `-v, --verbose` | Increase verbosity (use twice for more detail).                   |
| `--syslog`      | Log output to syslog (run as daemon).                             |
| `--pidfile`     | Write PID to a file for easy management.                          |
| `--method`      | Tunnelling method (auto, ssh, pf, or ipfw). Default `auto`.       |
| `--to-ns`       | Specify DNS server (e.g., `8.8.8.8`). Used with `--dns`.          |
| `--exclude`     | Exclude a subnet from routing (e.g., `--exclude 192.168.1.0/24`). |
| `--auto-hosts`  | Automatically update local `/etc/hosts` from the remote side.     |

---

## 5. Use Cases & Examples

### Route all traffic (full VPN mode)

```bash
sshuttle --dns -r user@server 0/0
```

### Route only specific subnets (split tunnelling)

```bash
sshuttle -r user@server 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16
```

### Exclude a subnet (e.g., local network)

```bash
sshuttle --dns -r user@server 0/0 --exclude 192.168.1.0/24
```

### Use a non‑standard SSH port

```bash
sshuttle --dns -r user@server:2222 0/0
```

### Run as a background daemon with logging

```bash
sshuttle --dns -r user@server 0/0 --daemon --syslog --pidfile /tmp/sshuttle.pid
```

### Use with SSH key (no password prompt)

Make sure your SSH key is added to the agent (`ssh-add`). sshuttle will reuse the agent.

---

## 6. Stopping sshuttle

- If run in the **foreground**, press `Ctrl+C`.
- If run as a **daemon**, find the PID and kill it:

  ```bash
  kill $(cat /tmp/sshuttle.pid)
  ```

- Or use `pkill sshuttle`.

---

## 7. Troubleshooting

| Problem                                        | Solution                                                                                                                                                                      |
| ---------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`sshuttle` command not found**               | Install `sshuttle` (`sudo pacman -S sshuttle`).                                                                                                                               |
| **`ssh: Could not resolve hostname`**          | Check the server address and port. Ensure SSH is reachable.                                                                                                                   |
| **Permission denied (publickey, password)**    | Verify your SSH credentials. Add your public key to the server’s `~/.ssh/authorized_keys` for passwordless login.                                                             |
| **`fatal: server died with error`**            | The remote server may lack a compatible Python interpreter. Install `python` on the server (`sudo apt install python3` on Debian/Ubuntu, or `sudo pacman -S python` on Arch). |
| **DNS still leaks**                            | Use `--dns` and ensure local resolvers are not bypassing the tunnel. Check with `dig +short myip.opendns.com @resolver1.opendns.com`.                                         |
| **Traffic not going through the tunnel**       | Run `traceroute 8.8.8.8` to see the route. The second hop should be the remote server’s IP.                                                                                   |
| **Performance is slow**                        | sshuttle uses TCP over TCP, which can cause performance issues. For high‑bandwidth or low‑latency critical applications, consider OpenVPN or WireGuard instead.               |
| **`--dns` doesn’t work with systemd‑resolved** | Configure `systemd-resolved` to use the tunnel’s DNS. Alternatively, use `--to-ns 1.1.1.1` and temporarily change `/etc/resolv.conf`.                                         |

---

## 8. Uninstalling

```bash
sudo pacman -Rns openssh sshuttle
```

Remove configuration files (sshuttle has no persistent config; all settings are passed on the command line).

---

Your sshuttle VPN is now ready. It’s a quick, no‑hassle way to secure your internet traffic over any SSH‑capable server. Enjoy the simplicity!
