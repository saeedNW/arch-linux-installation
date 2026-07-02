# Google Chrome – Web Browser

Google Chrome is a fast, secure, and feature‑rich web browser developed by Google. It is not available in the official Arch Linux repositories, but can be installed easily from the AUR.

> **ℹ️ Note:** This guide uses `yay` as the AUR helper. If you prefer a different helper, adjust the command accordingly.

---

## Table of Contents

- [Google Chrome – Web Browser](#google-chrome--web-browser)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Google Chrome](#2-launching-google-chrome)
  - [3. Updating Google Chrome](#3-updating-google-chrome)
  - [4. Uninstalling Google Chrome](#4-uninstalling-google-chrome)
  - [5. Troubleshooting](#5-troubleshooting)

---

## 1. Installation

Install the `google-chrome` package from the AUR:

```bash
yay -S google-chrome
```

This package provides the **stable** version of Chrome. There are also AUR packages for `google-chrome-beta` and `google-chrome-dev` if you need those channels.

> **💡 Tip:** The AUR package automatically downloads the official `.deb` from Google, converts it, and installs it on your Arch system.

---

## 2. Launching Google Chrome

- **From the application menu** – look for “Google Chrome” in your desktop environment’s launcher.
- **From the terminal** – simply run:
  ```bash
  google-chrome-stable
  ```

You can also open a specific URL directly:

```bash
google-chrome-stable https://archlinux.org
```

---

## 3. Updating Google Chrome

To update to the latest version, run your normal AUR update command:

```bash
yay -Syu google-chrome
```

Chrome will also check for updates internally, but the AUR method ensures the package stays in sync with your system’s package database.

---

## 4. Uninstalling Google Chrome

```bash
yay -Rns google-chrome
```

Remove local configuration files (stored in `~/.config/google-chrome/` and `~/.cache/google-chrome/`):

```bash
rm -rf ~/.config/google-chrome
rm -rf ~/.cache/google-chrome
```

---

## 5. Troubleshooting

| Problem                                      | Solution                                                                                                                                      |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `google-chrome-stable: command not found`    | The installation may have failed. Reinstall with `yay -S google-chrome`.                                                                      |
| Chrome does not start (missing libraries)    | Install missing dependencies: `sudo pacman -S nss libxss`.                                                                                    |
| “Whoa! Google Chrome has crashed” on startup | Launch from terminal with `--disable-gpu` to test. If that works, enable GPU‑accelerated rendering gradually.                                 |
| AUR build fails (checksum mismatch)          | The Google release may have been updated without a version bump. Delete the downloaded `.deb` in `~/.cache/yay/google-chrome/` and try again. |
| No sound in Chrome                           | Ensure `pulseaudio` or `pipewire` is running. Also check **Settings → Privacy and security → Site Settings → Sound**.                         |
| Wayland support                              | Chrome supports Wayland. Launch with `--ozone-platform-hint=auto`. To force Wayland, use `--ozone-platform=wayland`.                          |

---

Your Google Chrome installation is now ready for fast, secure browsing. Enjoy the full Chrome ecosystem on Arch Linux!
