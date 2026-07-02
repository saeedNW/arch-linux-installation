# Windscribe VPN – Official Desktop Client (v2)

Windscribe is a privacy‑focused VPN service that provides strong encryption, ad blocking, and a generous free tier (10 GB/month, or 15 GB after email confirmation). The AUR package `windscribe-v2-bin` delivers the **official Windscribe 2.0 desktop client** for Linux, which offers both a **modern graphical user interface (GUI)** and a **command‑line interface** for advanced users.

> **ℹ️ Note:** This is the **official** Windscribe client, not a third‑party wrapper. The package name `windscribe-v2-bin` provides the complete GUI application. The underlying CLI command is `windscribe-cli`, which can control the GUI service even when the window is closed.

---

## Table of Contents

- [Windscribe VPN – Official Desktop Client (v2)](#windscribe-vpn--official-desktop-client-v2)
  - [Table of Contents](#table-of-contents)
  - [1. Features Overview](#1-features-overview)
  - [2. Installation](#2-installation)
    - [2.1. Dependencies \& Prerequisites](#21-dependencies--prerequisites)
    - [2.2. Installing the AUR Package](#22-installing-the-aur-package)
    - [2.3. First‑Run Configuration](#23-firstrun-configuration)
  - [3. Graphical User Interface (GUI)](#3-graphical-user-interface-gui)
    - [3.1. Launching the GUI](#31-launching-the-gui)
    - [3.2. Connecting to a VPN Server](#32-connecting-to-a-vpn-server)
  - [4. Command‑Line Interface (`windscribe-cli`)](#4-commandline-interface-windscribe-cli)
    - [4.1. Authentication](#41-authentication)
    - [4.2. Basic CLI Commands](#42-basic-cli-commands)
    - [4.3. Advanced CLI Options](#43-advanced-cli-options)
  - [5. Firewall / Kill Switch](#5-firewall--kill-switch)
  - [6. Updating Windscribe](#6-updating-windscribe)
  - [7. Uninstalling Windscribe](#7-uninstalling-windscribe)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Features Overview

| Feature                    | Description                                                                                       |
| -------------------------- | ------------------------------------------------------------------------------------------------- |
| **GUI + CLI**              | Full graphical interface for everyday use, plus a powerful CLI (`windscribe-cli`) for automation. |
| **Free tier**              | 10 GB/month (15 GB after email verification) – enough for occasional browsing.                    |
| **Ad & tracker blocking**  | Built‑in **R.O.B.E.R.T.** custom filtering at the DNS level.                                      |
| **Firewall / Kill switch** | Proactive firewall that blocks all non‑VPN traffic if the connection drops (see §5).              |
| **Port forwarding**        | Request an open incoming port (requires a paid plan).                                             |
| **Split tunnelling**       | Exclude specific IP ranges or entire applications from the VPN tunnel.                            |
| **Multiple protocols**     | Supports WireGuard, OpenVPN (TCP/UDP), and IKEv2.                                                 |
| **Autoconnect**            | Connect automatically on system startup.                                                          |

---

## 2. Installation

### 2.1. Dependencies & Prerequisites

The AUR package requires `systemd-resolved` for proper DNS handling. The client may fail silently without it. Also, **Firewalld must be disabled** because it conflicts with Windscribe’s iptables‑based firewall.

Install the necessary components:

```bash
sudo pacman -S systemd-resolved
sudo systemctl enable --now systemd-resolved
```

If you have `firewalld` running, stop and disable it:

```bash
sudo systemctl stop firewalld
sudo systemctl disable firewalld
```

### 2.2. Installing the AUR Package

Use your preferred AUR helper. This guide uses `yay`:

```bash
yay -S windscribe-v2-bin
```

The package is actively maintained (last updated **2026‑03‑30**).

### 2.3. First‑Run Configuration

After installation, start the Windscribe helper service:

```bash
sudo systemctl start windscribe-helper.service
sudo systemctl enable windscribe-helper.service
```

Launch the GUI to complete the initial setup (see §3.1). The service will then run in the background and can be controlled either via the graphical window or the CLI.

---

## 3. Graphical User Interface (GUI)

### 3.1. Launching the GUI

- **From the application menu** – look for “Windscribe 2.0” or simply “Windscribe”.
- **From the terminal**:

```bash
windscribe
```

A system tray icon appears. Click it to open the main window.

### 3.2. Connecting to a VPN Server

1. Click the tray icon → **Log In** (use your Windscribe credentials).
2. After authentication, the server list loads automatically.
3. Select a location (e.g., “US East”, “Canada Toronto”).
4. Click the large **Connect** button.

Once connected, the system tray icon turns green. The GUI displays your new IP address, data usage, and the current protocol.

> **💡 Tip:** Right‑click the tray icon to quickly enable/disable the firewall, set autoconnect, or show the connection status.

---

## 4. Command‑Line Interface (`windscribe-cli`)

Even when the GUI is closed, the background service can be managed with `windscribe-cli`. This is ideal for scripting, key bindings, or headless setups.

### 4.1. Authentication

Log in using the CLI:

```bash
windscribe-cli login
```

You will be prompted for your username and password. To avoid typing credentials each time, generate a static token from your [Windscribe account page](https://windscribe.com/account) and use:

```bash
windscribe-cli login <token>
```

### 4.2. Basic CLI Commands

| Command                          | Action                                     |
| -------------------------------- | ------------------------------------------ |
| `windscribe-cli connect`         | Connect to the best available server       |
| `windscribe-cli connect us-east` | Connect to a specific region               |
| `windscribe-cli disconnect`      | Disconnect the VPN                         |
| `windscribe-cli status`          | Show connection status, IP, and data usage |
| `windscribe-cli locations`       | List all available regions                 |
| `windscribe-cli account`         | Display account details (used data, plan)  |

### 4.3. Advanced CLI Options

| Command                                        | Description                                                     |
| ---------------------------------------------- | --------------------------------------------------------------- |
| `windscribe-cli firewall on\|off`              | Enable/disable the proactive firewall (kill switch)             |
| `windscribe-cli protocol [wireguard\|openvpn]` | Switch between WireGuard (faster) and OpenVPN (more compatible) |
| `windscribe-cli port forward`                  | Request a forwarded port (paid plan)                            |
| `windscribe-cli autoconnect on\|off`           | Automatically reconnect on system startup                       |
| `windscribe-cli lan enable\|disable`           | Allow access to local network devices while VPN is active       |

---

## 5. Firewall / Kill Switch

Windscribe’s built‑in **firewall** (often called a “kill switch”) is **proactive** – it blocks all non‑VPN traffic before the connection is established. If the VPN tunnel drops, not a single packet can leak through your real IP address.

- **Enable the firewall**:

```bash
windscribe-cli firewall on
```

- **Disable the firewall** (only do this when you are certain you want unprotected traffic):

```bash
windscribe-cli firewall off
```

> **⚠️ Warning:** With the firewall enabled, you will have **no internet** if the VPN is disconnected. Always turn it off before troubleshooting network issues.

---

## 6. Updating Windscribe

Update the package through your AUR helper:

```bash
yay -Syu windscribe-v2-bin
```

After updating, restart the helper service:

```bash
sudo systemctl restart windscribe-helper.service
```

---

## 7. Uninstalling Windscribe

```bash
yay -Rns windscribe-v2-bin
```

Remove configuration files and logs (optional):

```bash
rm -rf ~/.config/windscribe
sudo rm -rf /var/log/windscribe
```

Stop and disable the service before removal:

```bash
sudo systemctl stop windscribe-helper.service
sudo systemctl disable windscribe-helper.service
```

---

## 8. Troubleshooting

| Problem                                                   | Solution                                                                                                                                                                                                                                             |
| --------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`windscribe: command not found`**                       | The package is not installed. Run `yay -S windscribe-v2-bin`.                                                                                                                                                                                        |
| **`systemd-resolved` not detected / DNS leaks**           | Ensure `systemd-resolved` is enabled and running (`sudo systemctl enable --now systemd-resolved`). Set `127.0.0.53` as your DNS server in `/etc/resolv.conf`.                                                                                        |
| **Service fails to start (iptables errors)**              | You may have a kernel module missing or a conflicting firewall. Disable `firewalld` and try again: `sudo systemctl stop firewalld && sudo systemctl disable firewalld`.                                                                              |
| **Firewall blocks everything (even after disconnecting)** | Disable the firewall explicitly: `windscribe-cli firewall off`. If the network stays down, restart NetworkManager: `sudo systemctl restart NetworkManager`.                                                                                          |
| **CLI commands have no effect**                           | The GUI must be **closed** for the CLI to take full control? In practice, both can coexist; however, if the GUI is actively managing the connection, the CLI may be less responsive. Try quitting the GUI from the tray icon, then use CLI commands. |
| **Free tier data limit exceeded**                         | Windscribe disconnects automatically. Upgrade to a paid plan or wait for the monthly reset.                                                                                                                                                          |
| **Windscribe asks for a token after reboot**              | Generate a static token on the Windscribe website and use `windscribe-cli login <token>`. The token survives reboots.                                                                                                                                |
| **Connection unstable / high latency**                    | Switch protocols: `windscribe-cli protocol wireguard` or `windscribe-cli protocol openvpn`. WireGuard is generally faster but may be blocked on restrictive networks.                                                                                |

---

Your Windscribe VPN client is now ready to protect your privacy, unblock content, and keep your internet traffic secure – with both a modern GUI and a powerful CLI. Enjoy!
