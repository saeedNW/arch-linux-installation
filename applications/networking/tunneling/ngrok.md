# ngrok – Secure Tunnels to Localhost

ngrok is a lightweight command‑line tool that creates secure, public URLs for your local development servers. It exposes local endpoints (web apps, APIs, SSH, databases, etc.) to the internet without touching your firewall or router.

> **ℹ️ Note:** ngrok is proprietary software. The free tier gives you a random `*.ngrok-free.app` URL, limited connection hours, and TCP tunnel support. For custom domains and longer sessions you need a paid plan.

---

## Table of Contents

- [ngrok – Secure Tunnels to Localhost](#ngrok--secure-tunnels-to-localhost)
  - [Table of Contents](#table-of-contents)
  - [1. Features Overview](#1-features-overview)
  - [2. Installation](#2-installation)
    - [Method A: AUR (Recommended)](#method-a-aur-recommended)
    - [Method B: Direct Download (Manual)](#method-b-direct-download-manual)
    - [Method C: npm (Node.js Package Manager)](#method-c-npm-nodejs-package-manager)
  - [3. Configuration](#3-configuration)
    - [3.1. Sign Up and Get Your Authtoken](#31-sign-up-and-get-your-authtoken)
    - [3.2. Add the Authtoken](#32-add-the-authtoken)
  - [4. Shell Completion (Optional)](#4-shell-completion-optional)
  - [5. Basic Usage](#5-basic-usage)
    - [HTTP/HTTPS Tunnel](#httphttps-tunnel)
    - [TCP Tunnel](#tcp-tunnel)
    - [TLS Tunnel](#tls-tunnel)
    - [Forward to a Non‑localhost Service](#forward-to-a-nonlocalhost-service)
    - [Run with a Pre‑defined URL](#run-with-a-predefined-url)
  - [6. Configuration File (YAML)](#6-configuration-file-yaml)
  - [7. Running as a Background Service](#7-running-as-a-background-service)
  - [8. Updating ngrok](#8-updating-ngrok)
    - [AUR installation](#aur-installation)
    - [Direct download](#direct-download)
    - [Self‑update (built‑in)](#selfupdate-builtin)
  - [9. Uninstalling ngrok](#9-uninstalling-ngrok)
  - [10. Troubleshooting](#10-troubleshooting)

---

## 1. Features Overview

| Feature                       | Description                                                     |
| ----------------------------- | --------------------------------------------------------------- |
| **Public URLs for localhost** | Expose a web server on port 8080 via a randomly generated URL.  |
| **TCP tunnels**               | Forward any TCP port (e.g., SSH on port 22, database on 3306).  |
| **TLS tunnels**               | Accept raw TLS‑wrapped traffic on a public endpoint.            |
| **Traffic inspection**        | Replay and inspect every request/response in the web inspector. |
| **Basic authentication**      | Password‑protect your tunnel with a YAML traffic policy.        |
| **Reserved domains**          | Use a custom subdomain (e.g., `myapp.ngrok.io` – paid feature). |
| **Background service**        | Install ngrok as a systemd service to survive reboots.          |
| **Multi‑endpoint**            | Start several tunnels simultaneously from a config file.        |
| **Cross‑platform**            | Works on Linux, Windows, macOS, FreeBSD, and ARM devices.       |

---

## 2. Installation

### Method A: AUR (Recommended)

ngrok is available in the Arch User Repository. This guide uses `yay`:

```bash
yay -S ngrok
```

The package installs the `ngrok` binary and provides a systemd service file.
After installation, verify that it works:

```bash
ngrok version
```

Expected output: `ngrok version 3.x.x`

### Method B: Direct Download (Manual)

If you prefer to manage the binary yourself:

1. Visit the [ngrok download page](https://ngrok.com/download) and select the Linux archive for your architecture (`amd64`, `arm64`, etc.).
2. Download and extract the ZIP file:

   ```bash
   cd ~/Downloads
   unzip ngrok-stable-linux-amd64.zip
   ```

3. Move the binary to a directory in your `$PATH`:

   ```bash
   sudo mv ngrok /usr/local/bin/
   ```

4. Set execute permissions:

   ```bash
   sudo chmod +x /usr/local/bin/ngrok
   ```

### Method C: npm (Node.js Package Manager)

```bash
sudo npm install -g ngrok
```

> **⚠️ Note:** The npm package often lags behind the official release. The AUR or direct download methods are preferred.

---

## 3. Configuration

### 3.1. Sign Up and Get Your Authtoken

1. Go to [ngrok.com/signup](https://ngrok.com/signup) and create a free account.
2. After logging in, navigate to the [**Your Authtoken**](https://dashboard.ngrok.com/get-started/your-authtoken) page.
3. Copy the token string (a long alphanumeric key).

### 3.2. Add the Authtoken

Add the token to your ngrok configuration:

```bash
ngrok config add-authtoken YOUR_AUTH_TOKEN
```

This command creates or updates the configuration file at `~/.config/ngrok/ngrok.yml` (or `~/.ngrok2/ngrok.yml` on older versions).

---

## 4. Shell Completion (Optional)

ngrok includes a built‑in subcommand to generate shell‑specific completion scripts.

```bash
# For Bash
ngrok completion bash
# For Zsh
ngrok completion zsh
```

To make the completions permanent, redirect the output to your shell’s completion directory. For example, for Zsh:

```bash
ngrok completion zsh > ~/.zsh/completions/_ngrok
```

(You may need to adjust the path to your Zsh completion folder.)

---

## 5. Basic Usage

All commands assume you are already in the directory of your local service. Replace the port number with the one your application listens on (e.g., `3000`, `8000`, `8080`).

### HTTP/HTTPS Tunnel

Expose a web server listening on port 8080:

```bash
ngrok http 8080
```

ngrok responds with a public URL (e.g., `https://abc123.ngrok-free.app`). Open that URL in your browser – it shows your local site.

### TCP Tunnel

Forward any TCP port (e.g., SSH on port 22):

```bash
ngrok tcp 22
```

You receive a public address like `0.tcp.ngrok.io:12345`. Connect with:

```bash
ssh user@0.tcp.ngrok.io -p 12345
```

### TLS Tunnel

Accept TLS‑wrapped traffic on a public endpoint:

```bash
ngrok tls 443
```

This is useful for services that use protocols other than HTTP (e.g., custom TCP over TLS).

### Forward to a Non‑localhost Service

Point ngrok to a service running on another machine on your local network:

```bash
ngrok http 192.168.1.100:8080
```

### Run with a Pre‑defined URL

Reserve a subdomain (paid feature). If you own a custom domain or reserved subdomain:

```bash
ngrok http 3000 --url https://myapp.ngrok.io
```

---

## 6. Configuration File (YAML)

For complex setups (multiple tunnels, custom traffic policies) you can use the `ngrok.yml` file.

**Default location:** `~/.config/ngrok/ngrok.yml`

Example configuration with two tunnels:

```yaml
version: '3'
agent:
  authtoken: YOUR_AUTH_TOKEN

tunnels:
  web:
    proto: http
    addr: 8080
    domain: myapp.ngrok.io
  ssh:
    proto: tcp
    addr: 22
    remote_addr: 0.tcp.ngrok.io:12345
```

Start both tunnels simultaneously:

```bash
ngrok start --all
```

Or start only one:

```bash
ngrok start web
```

---

## 7. Running as a Background Service

ngrok can be installed as a **systemd service** to survive reboots and keep a tunnel always open.

**Install the service:**

```bash
ngrok service install --config ~/.config/ngrok/ngrok.yml
```

**Start the service:**

```bash
ngrok service start
```

Other useful service commands:

| Command                   | Action              |
| ------------------------- | ------------------- |
| `ngrok service stop`      | Stop the service    |
| `ngrok service restart`   | Restart the service |
| `ngrok service uninstall` | Remove the service  |

> **ℹ️ Note:** The service uses the configuration file you specified. Without a config file that includes at least one tunnel definition and a valid authtoken, the service will fail to start.

---

## 8. Updating ngrok

### AUR installation

```bash
yay -Syu ngrok
```

### Direct download

After downloading the new version, replace the binary and restart any running ngrok processes.

### Self‑update (built‑in)

ngrok can also update itself from the command line:

```bash
ngrok update
```

It will prompt you to confirm the upgrade when an update is available (press `Ctrl+U`).

---

## 9. Uninstalling ngrok

```bash
yay -Rns ngrok
```

If you used the direct download, simply remove the binary and its configuration directory:

```bash
sudo rm /usr/local/bin/ngrok
rm -rf ~/.config/ngrok
rm -rf ~/.ngrok2
```

---

## 10. Troubleshooting

| Problem                                              | Solution                                                                                                                                   |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| **`ngrok: command not found`**                       | The binary is not in your `$PATH`. Install the AUR package or add the download location manually.                                          |
| **Authentication failed (invalid authtoken)**        | Verify your token on the [ngrok dashboard](https://dashboard.ngrok.com/authtokens). Re‑add it with `ngrok config add-authtoken NEW_TOKEN`. |
| **`Permission denied` on port < 1024**               | Ports below 1024 are privileged. Run with `sudo ngrok http 80`, or use a port above 1024 (e.g., `8080`).                                   |
| **Tunnel disconnects frequently**                    | The free tier has a connection limit. Upgrade to a paid plan or keep your session active.                                                  |
| **Web interface not showing**                        | ngrok’s local inspection UI runs on `http://localhost:4040`. Make sure nothing else is using that port.                                    |
| **`ngrok service install` fails with “exit code 5”** | The service cannot find the configuration file. Use `--config /absolute/path/to/ngrok.yml` and ensure the file exists and is readable.     |
| **Systemd service starts but no tunnel appears**     | Check the service logs: `journalctl -u ngrok -n 50`. Your config file may be missing the required `tunnels:` section.                      |
| **DNS‑related errors / could not resolve host**      | The ngrok agent needs to resolve `connect.ngrok-agent.com:443`. Check your DNS settings.                                                   |

---

Your ngrok setup is now ready to share your local development work with the world. Enjoy the instant public URLs!
