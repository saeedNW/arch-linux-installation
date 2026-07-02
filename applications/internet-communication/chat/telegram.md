# Telegram Desktop – Secure Messaging App

Telegram Desktop is a fast, secure messaging application that offers text, voice, video calls, and file sharing with end‑to‑end encryption for secret chats. It is available in the official Arch Linux repositories, so no AUR helper is required.

---

## Table of Contents

- [Telegram Desktop – Secure Messaging App](#telegram-desktop--secure-messaging-app)
	- [Table of Contents](#table-of-contents)
	- [1. Installation](#1-installation)
	- [2. Launching Telegram Desktop](#2-launching-telegram-desktop)
	- [3. Updating Telegram Desktop](#3-updating-telegram-desktop)
	- [4. Uninstalling Telegram Desktop](#4-uninstalling-telegram-desktop)
	- [5. Troubleshooting](#5-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S telegram-desktop
```

This installs the latest stable version of Telegram Desktop from the official repositories.

> **💡 Tip:** There is also an AUR package `telegram-desktop-bin` if you prefer a pre‑compiled binary directly from Telegram, but the official repository version is recommended for most users.

---

## 2. Launching Telegram Desktop

- **From the application menu** – look for “Telegram Desktop” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  telegram-desktop
  ```

On first launch, you will be asked to log in with your phone number. After verification, you can start chatting, joining groups, or making calls.

---

## 3. Updating Telegram Desktop

Telegram Desktop updates automatically via the system package manager. To keep it up to date:

```bash
sudo pacman -Syu
```

The application itself also checks for updates, but the pacman method is the safest and most reliable on Arch.

---

## 4. Uninstalling Telegram Desktop

```bash
sudo pacman -Rns telegram-desktop
```

Remove local configuration and cache files (stored in `~/.local/share/TelegramDesktop/` and `~/.cache/TelegramDesktop/`):

```bash
rm -rf ~/.local/share/TelegramDesktop
rm -rf ~/.cache/TelegramDesktop
```

---

## 5. Troubleshooting

| Problem                                       | Solution                                                                                                                   |
| --------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `telegram-desktop: command not found`         | Telegram is not installed. Run `sudo pacman -S telegram-desktop`.                                                          |
| Telegram does not start (crashes immediately) | Launch from a terminal to see error messages. Install missing dependencies: `sudo pacman -S qt6-imageformats libxcb`.      |
| No sound in voice/video calls                 | Ensure `pulseaudio` or `pipewire` is running. Also check **Settings → Advanced → Audio** and select the correct device.    |
| Screen sharing not working on Wayland         | Telegram Desktop supports Wayland natively. If screen sharing fails, try launching with `--ozone-platform=wayland`.        |
| “Connection to server lost” repeatedly        | Check your internet connection. Sometimes VPN or firewall can interfere. Try logging out and back in.                      |
| High CPU usage / lag                          | Disable hardware acceleration in **Settings → Advanced → System → “Use hardware acceleration”** (if available).            |
| Notifications not appearing                   | Ensure `libnotify` is installed (`sudo pacman -S libnotify`). Also check your desktop environment’s notification settings. |

---

Your Telegram Desktop installation is now ready for fast, secure communication with friends, family, and communities on Arch Linux.
