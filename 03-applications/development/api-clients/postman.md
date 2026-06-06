# Postman API Development Tool Setup Guide

Postman is a popular collaboration platform for API development, used by developers to design, test, document, and monitor APIs. It provides a graphical interface for making HTTP requests, managing environments, and automating tests.

> **ℹ️ Note:** Postman is not available in the official Arch Linux repositories but can be installed from the AUR. This guide uses `yay` as the AUR helper.

---

## Table of Contents

- [Postman API Development Tool Setup Guide](#postman-api-development-tool-setup-guide)
  - [Table of Contents](#table-of-contents)
  - [1. Install Postman](#1-install-postman)
  - [2. Verify Installation](#2-verify-installation)
  - [3. Launching Postman](#3-launching-postman)
  - [4. Updating Postman](#4-updating-postman)
  - [5. Uninstalling Postman](#5-uninstalling-postman)
  - [6. Troubleshooting](#6-troubleshooting)

---

## 1. Install Postman

Install `postman-bin` from the AUR using `yay`:

```bash
yay -S postman-bin
```

> **💡 Tip:** The `-bin` suffix indicates a pre‑built binary package, so compilation is not required.

---

## 2. Verify Installation

After installation, check that Postman is available:

```bash
postman --version
```

Expected output: the version number (e.g., `11.0.0`).

---

## 3. Launching Postman

You can launch Postman in several ways:

- **From the application menu** – look for “Postman” in your desktop environment’s application launcher.
- **From the terminal** – run `postman`.
- **From a custom desktop shortcut** – the package usually creates one automatically.

> **💡 Tip:** If the terminal command is not found, log out and back in or restart your desktop session.

---

## 4. Updating Postman

To update Postman to the latest version:

```bash
yay -Syu postman-bin
```

This will update Postman along with any other outdated AUR packages.

---

## 5. Uninstalling Postman

To remove Postman completely:

```bash
yay -Rns postman-bin
```

The `-ns` flags remove configuration files and unneeded dependencies.

---

## 6. Troubleshooting

| Problem                                                | Solution                                                                                                           |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| `postman: command not found`                           | Re‑open your terminal or log out and back in. Ensure the package installed without errors.                         |
| Postman does not start (blank window)                  | Try launching from the terminal to see error messages. Install missing dependencies: `sudo pacman -S libxss nss`.  |
| Postman fails to start with “GPU process isn't usable” | Launch with `postman --disable-gpu` or disable hardware acceleration in settings (once you can open it).           |
| Updates are not available via `yay`                    | The AUR package may lag behind. Check the [AUR page](https://aur.archlinux.org/packages/postman-bin) for comments. |
| Postman asks for login on every start                  | Sign in with your Postman account to sync; this is normal behaviour.                                               |

---

Your Postman is now ready for API development and testing.
