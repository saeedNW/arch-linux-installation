# Firefox – Web Browser

Firefox is a free, open‑source web browser developed by Mozilla. It is available in the official Arch Linux repositories, so no AUR helper is required.

---

## Table of Contents

- [Firefox – Web Browser](#firefox--web-browser)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Firefox](#2-launching-firefox)
  - [3. Updating Firefox](#3-updating-firefox)
  - [4. Uninstalling Firefox](#4-uninstalling-firefox)
  - [5. Troubleshooting](#5-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S firefox
```

This installs the **stable** version of Firefox. Alternative packages are also available:

- `firefox-developer-edition` – Developer Edition
- `firefox-nightly` – Nightly builds (AUR)

> **💡 Tip:** For the non‑English versions, install `firefox-i18n-<language>` (e.g., `firefox-i18n-de` for German).

---

## 2. Launching Firefox

- **From the application menu** – look for “Firefox” in your desktop environment’s launcher.
- **From the terminal** – simply run:

  ```bash
  firefox
  ```

You can open a specific URL directly:

```bash
firefox https://archlinux.org
```

---

## 3. Updating Firefox

Firefox is updated along with your system:

```bash
sudo pacman -Syu
```

Firefox also has its own built‑in updater, but it is disabled by default when installed via pacman – always rely on `pacman` for updates.

---

## 4. Uninstalling Firefox

```bash
sudo pacman -Rns firefox
```

Remove local configuration files (stored in `~/.mozilla/firefox/`):

```bash
rm -rf ~/.mozilla/firefox
```

---

## 5. Troubleshooting

| Problem                                    | Solution                                                                                                                                                                  |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `firefox: command not found`               | Firefox is not installed. Run `sudo pacman -S firefox`.                                                                                                                   |
| Firefox does not start (missing libraries) | Install missing dependencies: `sudo pacman -S nss libxss`.                                                                                                                |
| “Your Firefox profile cannot be loaded”    | Corrupted profile. Rename or delete `~/.mozilla/firefox/` and restart Firefox (it will create a fresh profile).                                                           |
| No sound in Firefox                        | Ensure `pulseaudio` or `pipewire` is running. Check **Settings → Privacy & Security → Permissions → Autoplay** and allow sound.                                           |
| Wayland support                            | Firefox supports Wayland. Launch with `MOZ_ENABLE_WAYLAND=1 firefox`. To make it permanent, edit `/etc/environment` or your shell profile and add `MOZ_ENABLE_WAYLAND=1`. |
| Hardware acceleration not working          | In `about:config`, set `gfx.webrender.all` to `true`. For VA‑API (Intel/AMD), set `media.ffmpeg.vaapi.enabled` to `true`.                                                 |

---

Your Firefox installation is now ready for private, customizable, and open‑web browsing on Arch Linux.
