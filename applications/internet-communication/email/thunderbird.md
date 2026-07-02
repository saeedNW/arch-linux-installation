# Thunderbird – Email & Calendar Client

Thunderbird is a free, open‑source email client, news reader, calendar, and contact manager developed by the Mozilla Foundation. It supports IMAP, POP3, CalDAV, and CardDAV, and includes advanced features like junk mail filtering, message tagging, and encryption.

> **ℹ️ Note:** Thunderbird is available in the official Arch Linux repositories, so no AUR helper is required.

---

## Table of Contents

- [Thunderbird – Email \& Calendar Client](#thunderbird--email--calendar-client)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Thunderbird](#2-launching-thunderbird)
  - [3. Updating Thunderbird](#3-updating-thunderbird)
  - [4. Uninstalling Thunderbird](#4-uninstalling-thunderbird)
  - [5. Troubleshooting](#5-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S thunderbird
```

This installs the stable version of Thunderbird. For alternative languages, install `thunderbird-i18n-<language>` (e.g., `thunderbird-i18n-de` for German).

---

## 2. Launching Thunderbird

- **From the application menu** – look for “Thunderbird” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  thunderbird
  ```

On first launch, the setup wizard will guide you through adding an email account (automatic configuration for many providers like Gmail, Yahoo, Outlook, etc.).

---

## 3. Updating Thunderbird

Thunderbird is updated along with your system:

```bash
sudo pacman -Syu
```

The built‑in automatic updater is disabled when installed via pacman – always rely on the system package manager.

---

## 4. Uninstalling Thunderbird

```bash
sudo pacman -Rns thunderbird
```

Remove local configuration files (stored in `~/.thunderbird/`):

```bash
rm -rf ~/.thunderbird
```

> **⚠️ Warning:** This will delete all your email accounts, messages, and settings. Back up important data first.

---

## 5. Troubleshooting

| Problem                                           | Solution                                                                                                                                                                           |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `thunderbird: command not found`                  | Thunderbird is not installed. Run `sudo pacman -S thunderbird`.                                                                                                                    |
| Thunderbird does not start                        | Launch from a terminal to see error messages. Missing dependencies? Run `sudo pacman -S hicolor-icon-theme libx11`.                                                                |
| Cannot add Gmail / Yahoo account                  | Enable “Allow less secure apps” in your account settings, or generate an app‑specific password. For Gmail, you may need to use OAuth2 (Thunderbird supports it natively).          |
| No sound for new mail notifications               | Ensure `libnotify` is installed (`sudo pacman -S libnotify`). Also check system notification settings.                                                                             |
| Calendar fails to sync with Google                | Use the “Provider for Google Calendar” add‑on. Install from **Tools → Add‑ons and Themes**.                                                                                        |
| Thunderbird is very slow                          | Disable hardware acceleration in **Settings → General → Config Editor** (`gfx.direct2d.disabled` set to `true`). Also consider compacting folders (**File → Compact Folders**).    |
| Wayland issues (blurry fonts, window positioning) | Thunderbird works under Wayland. Launch with `MOZ_ENABLE_WAYLAND=1 thunderbird`. To make permanent, add `export MOZ_ENABLE_WAYLAND=1` to your shell profile or `/etc/environment`. |

---

Your Thunderbird installation is now ready to manage all your email accounts, calendars, and contacts on Arch Linux.
