# v2rayN – Cross‑Platform Proxy GUI Client

v2rayN is a cross‑platform graphical client for managing proxy connections. It supports multiple proxy cores (Xray, sing‑box, v2fly) and protocols (VMess, VLESS, Shadowsocks, Trojan, SOCKS5, etc.), making it a versatile tool for bypassing internet censorship and protecting online privacy.

> **ℹ️ Note:** v2rayN is available in the Arch User Repository (AUR). This guide uses `yay` as the AUR helper.

---

## Table of Contents

- [v2rayN – Cross‑Platform Proxy GUI Client](#v2rayn--crossplatform-proxy-gui-client)
  - [Table of Contents](#table-of-contents)
  - [1. Features Overview](#1-features-overview)
  - [2. Installation](#2-installation)
  - [3. Launching v2rayN](#3-launching-v2rayn)
  - [4. Basic Configuration](#4-basic-configuration)
    - [4.1. First Run \& Core Setup](#41-first-run--core-setup)
    - [4.2. Adding a Server / Importing Subscription](#42-adding-a-server--importing-subscription)
      - [Via Subscription URL (Recommended)](#via-subscription-url-recommended)
      - [Manually Adding a Server](#manually-adding-a-server)
    - [4.3. Setting System Proxy](#43-setting-system-proxy)
    - [4.4. Enabling TUN Mode (Global Proxy)](#44-enabling-tun-mode-global-proxy)
  - [5. Updating v2rayN](#5-updating-v2rayn)
  - [6. Uninstalling v2rayN](#6-uninstalling-v2rayn)
  - [7. Troubleshooting](#7-troubleshooting)
  - [8. References](#8-references)

---

## 1. Features Overview

| Feature                      | Description                                                    |
| ---------------------------- | -------------------------------------------------------------- |
| **Multi‑Core Support**       | Supports Xray, sing‑box, v2fly, and other cores (selectable).  |
| **Protocol Support**         | VMess, VLESS, Shadowsocks, Trojan, SOCKS5, HTTP, and more.     |
| **TUN Mode**                 | One‑click global transparent proxy (system‑wide).              |
| **Routing**                  | Flexible rule‑based routing (bypass LAN, CN IP, custom rules). |
| **Subscription Management**  | Import/update server lists via subscription URLs.              |
| **System Proxy Integration** | Auto‑configure system proxy settings (PAC or global).          |
| **Cross‑Platform**           | Works on Windows, Linux, and macOS.                            |

---

## 2. Installation

The AUR provides two main packages: `v2rayn` (builds from source) and `v2rayn-bin` (pre‑compiled binary). This guide uses the binary package for faster installation.

```bash
yay -S v2rayn-bin
```

> **💡 Tip:** The AUR page recommends the `-bin` version for Arch Linux systems. If you prefer building from source, use `yay -S v2rayn` instead.

---

## 3. Launching v2rayN

- **From the application menu** – look for “v2rayN” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  v2rayN
  ```

> **ℹ️ Note:** On first launch, v2rayN may need to download the selected core (Xray, sing‑box, etc.). Ensure you have an internet connection.

---

## 4. Basic Configuration

### 4.1. First Run & Core Setup

1. Launch v2rayN.
2. If a “Core not found” warning appears, click **Settings → Core Setting**.
3. Select a core (e.g., **Xray** or **sing‑box**) and click **Download Core**. Wait for the download to complete.

### 4.2. Adding a Server / Importing Subscription

#### Via Subscription URL (Recommended)

1. Right‑click the system tray icon → **Subscription Settings** → **Add**.
2. Paste your subscription URL (provided by your proxy service).
3. Click **OK**, then right‑click the tray icon and select **Update Subscription**.
4. The server list will populate with available nodes.

#### Manually Adding a Server

1. Right‑click the tray icon → **Add Server** → choose protocol (VMess, VLESS, Shadowsocks, etc.).
2. Fill in the server address, port, UUID, encryption, etc.
3. Click **Save**.

### 4.3. Setting System Proxy

After adding a server, select a node from the list, then right‑click the tray icon and choose one of the proxy modes:

- **System Proxy** – uses system‑wide proxy settings (set automatically).
- **PAC Mode** – uses Proxy Auto‑Configuration (default behaviour for most browsers).
- **TUN Mode** – global transparent proxy (requires root privileges and may need extra setup on Linux; see Section 4.4).

### 4.4. Enabling TUN Mode (Global Proxy)

TUN Mode allows all system traffic (including terminal, games, and non‑HTTP applications) to be routed through the proxy.

1. Ensure you have selected a server node.
2. Right‑click the tray icon → **TUN Mode** → **Enable TUN Mode**.
3. You may be prompted for your **sudo password** (TUN mode requires root privileges on Linux).
4. Once enabled, the tray icon should turn **blue**.

> **⚠️ Important:** TUN Mode is not stable on all Linux distributions, and some users report network issues after enabling/disabling it. To revert, right‑click the tray icon → **TUN Mode** → **Disable TUN Mode**. If your network remains down, restart your network manager:
>
> ```bash
> sudo systemctl restart NetworkManager
> ```

---

## 5. Updating v2rayN

```bash
yay -Syu v2rayn-bin
```

To update the proxy core (e.g., Xray) itself, use **Settings → Core Setting → Check Core Updates** inside the application.

---

## 6. Uninstalling v2rayN

```bash
yay -Rns v2rayn-bin
```

Remove configuration files and cores:

```bash
rm -rf ~/.config/v2rayN
rm -rf ~/.local/share/v2rayN
```

---

## 7. Troubleshooting

| Problem                                                 | Solution                                                                                                               |
| ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| **`v2rayN: command not found`**                         | v2rayN is not installed. Run `yay -S v2rayn-bin`.                                                                      |
| **Core not found / “The Xray core file was not found”** | Go to **Settings → Core Setting**, select a core, and click **Download Core**.                                         |
| **TUN Mode does not work / network goes down**          | TUN mode is not fully stable on Linux. Try running v2rayN as root: `sudo v2rayN` or use **System Proxy** mode instead. |
| **No internet after disabling TUN mode**                | Restart your network manager: `sudo systemctl restart NetworkManager`.                                                 |
| **Subscription fails to update**                        | Check your subscription URL. If it uses HTTPS, ensure your system time is correct.                                     |
| **Unable to connect (proxy not working)**               | Verify that the server node is online (right‑click → **Test Real Ping**). Ensure the correct proxy mode is enabled.    |
| **GUI not appearing after launch**                      | v2rayN runs in the system tray. Look for its icon in your desktop’s notification area.                                 |

---

## 8. References

- **Official GitHub repository:** [2dust/v2rayN](https://github.com/2dust/v2rayN)
- **AUR package:** [v2rayn-bin](https://aur.archlinux.org/packages/v2rayn-bin)
- **Documentation:** [v2rayN Wiki](https://github.com/2dust/v2rayN/wiki)

---

Your v2rayN setup is now ready to manage your proxy connections with a user‑friendly GUI. Enjoy safer and more open access to the web!
