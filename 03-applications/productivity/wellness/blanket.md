# Blanket – Ambient Sound Player for GNOME

Blanket is a simple, minimalist application for the GNOME desktop that plays ambient sounds to help you focus, relax, or sleep. It offers a library of high‑quality sounds (rain, wind, waves, fire, coffee shop, etc.) that can be mixed together.

> **ℹ️ Note:** Blanket is available in the official Arch Linux `extra` repository, so no AUR helper is required. It integrates seamlessly with GNOME but works on other desktops as well.

---

## Table of Contents

- [Blanket – Ambient Sound Player for GNOME](#blanket--ambient-sound-player-for-gnome)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Blanket](#2-launching-blanket)
  - [3. Basic Usage](#3-basic-usage)
  - [4. Keyboard Shortcuts](#4-keyboard-shortcuts)
  - [5. Updating Blanket](#5-updating-blanket)
  - [6. Uninstalling Blanket](#6-uninstalling-blanket)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S blanket
```

This installs the latest stable version from the `extra` repository. Dependencies such as GTK4, libadwaita, and GStreamer will be pulled in automatically.

---

## 2. Launching Blanket

- **From the application menu** – look for “Blanket” in your GNOME application launcher.
- **From the terminal** – run:

  ```bash
  blanket
  ```

> **💡 Tip:** Blanket runs in the background when minimized. It appears as an icon in the system tray (if your desktop supports it) or continues playing sound without a visible window.

---

## 3. Basic Usage

When you open Blanket, you see a grid of sound tiles. Each tile represents a different ambient sound.

| Sound Category | Examples                                      |
| -------------- | --------------------------------------------- |
| **Nature**     | Rain, Thunderstorm, Wind, Waves, Stream, Fire |
| **Noise**      | White noise, Pink noise, Brown noise          |
| **Interior**   | Fireplace, Coffee shop, Fan                   |
| **Exterior**   | Train, City, Forest, Birds                    |

**To play a sound:** click on its tile. The sound starts playing immediately. Click again to stop.

**To adjust volume:** hover over a playing tile – a volume slider appears. Drag it up or down.

**To mix multiple sounds:** click several tiles – they will play simultaneously, and you can adjust each volume independently.

> **💡 Tip:** Blanket remembers your last used sounds and their volumes when you reopen the application.

---

## 4. Keyboard Shortcuts

| Shortcut       | Action                                             |
| -------------- | -------------------------------------------------- |
| `Space`        | Play / pause the currently selected sound (if any) |
| `Ctrl+Q`       | Quit Blanket                                       |
| `Ctrl+H`       | Hide window (continue playing in background)       |
| `Ctrl+Shift+Q` | Stop all sounds and quit                           |

> **⚠️ Note:** Blanket does not have extensive keyboard shortcuts – it is designed as a simple touch‑friendly GUI app.

---

## 5. Updating Blanket

```bash
sudo pacman -Syu
```

Blanket will be updated together with other system packages.

---

## 6. Uninstalling Blanket

```bash
sudo pacman -Rns blanket
```

Remove configuration files (stored in `~/.var/app/com.blanket.Blanket/` for Flatpak, but for the native package it's usually `~/.config/blanket/`):

```bash
rm -rf ~/.config/blanket
```

---

## 7. Troubleshooting

| Problem                            | Solution                                                                                                                                                                                |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `blanket: command not found`       | Blanket is not installed. Run `sudo pacman -S blanket`.                                                                                                                                 |
| No sound plays when clicking tiles | Check that your system sound is working. Ensure `pipewire` or `pulseaudio` is running. Install `gstreamer` plugins: `sudo pacman -S gst-plugins-good gst-plugins-bad gst-plugins-ugly`. |
| Blanket crashes on startup         | Launch from a terminal to see error messages. Missing dependencies: `sudo pacman -S gtk4 libadwaita`.                                                                                   |
| The window is blank (no tiles)     | The application may have failed to load the sound library. Reinstall blanket: `sudo pacman -Syu --force blanket`.                                                                       |
| Tray icon not showing (GNOME)      | GNOME hides tray icons by default. Install `gnome-shell-extension-appindicator` and enable it. Alternatively, simply keep the window minimized.                                         |
| Sound mixing is distorted          | Lower the volume of individual tracks. If still distorted, reduce the system output volume.                                                                                             |

---

Your Blanket installation is now ready to fill your environment with calming background sounds – perfect for deep work, study, or sleep. Enjoy the serenity!
