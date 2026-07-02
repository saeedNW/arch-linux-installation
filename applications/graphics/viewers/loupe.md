# Loupe – GNOME Image Viewer

Loupe is the default image viewer for the GNOME desktop environment. It provides a modern, lightweight, and user‑friendly interface for viewing images, with support for common formats (PNG, JPEG, BMP, TIFF, etc.) and smooth zooming/panning.

> **ℹ️ Note:** Loupe is available in the official Arch Linux `extra` repository, so no AUR helper is required. It is designed to integrate seamlessly with GNOME, but can also be used on other desktop environments.

---

## Table of Contents

- [Loupe – GNOME Image Viewer](#loupe--gnome-image-viewer)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Loupe](#2-launching-loupe)
  - [3. Basic Usage](#3-basic-usage)
  - [4. Keyboard Shortcuts](#4-keyboard-shortcuts)
  - [5. Updating Loupe](#5-updating-loupe)
  - [6. Uninstalling Loupe](#6-uninstalling-loupe)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S loupe
```

This installs the latest stable version from the `extra` repository. Dependencies such as GTK4 and libadwaita will be pulled in automatically.

---

## 2. Launching Loupe

- **From the application menu** – look for “Loupe” in your GNOME application launcher.
- **From the terminal** – run:

  ```bash
  loupe
  ```

You can also open an image directly:

```bash
loupe /path/to/image.jpg
```

---

## 3. Basic Usage

- **Open an image** – use `Ctrl+O` or drag and drop a file onto the window.
- **Zoom** – use the mouse wheel, pinch gestures on touchpads, or the zoom buttons in the toolbar.
- **Pan** – click and drag the image (when zoomed in).
- **Next/Previous** – press `Page Down` / `Page Up` or use the arrow buttons in the toolbar when browsing a folder.
- **Fit to window** – press `F` or click the fit‑to‑window icon.
- **Fullscreen** – press `F11` or select **View → Fullscreen**.
- **Slideshow** – press `F5` to start a slideshow of all images in the current folder.

> **💡 Tip:** Loupe automatically detects all image files in the same folder as the opened image, allowing seamless navigation.

---

## 4. Keyboard Shortcuts

| Shortcut                | Action                                      |
| ----------------------- | ------------------------------------------- |
| `Ctrl+O`                | Open an image                               |
| `Ctrl+W`                | Close current tab (if multiple images open) |
| `Ctrl+Q`                | Quit                                        |
| `F`                     | Fit image to window                         |
| `F11`                   | Toggle fullscreen                           |
| `F5`                    | Start slideshow                             |
| `Page Up` / `Page Down` | Previous / next image                       |
| `+` / `-`               | Zoom in / out                               |
| `0` (zero)              | Zoom to 100%                                |
| `Ctrl+0`                | Fit to window (same as `F`)                 |
| `R`                     | Rotate 90° clockwise                        |
| `Ctrl+R`                | Reset rotation                              |
| `Ctrl+C`                | Copy image to clipboard                     |

---

## 5. Updating Loupe

```bash
sudo pacman -Syu
```

Loupe will be updated together with other system packages.

---

## 6. Uninstalling Loupe

```bash
sudo pacman -Rns loupe
```

Remove configuration files (stored in `~/.config/loupe/`):

```bash
rm -rf ~/.config/loupe
```

---

## 7. Troubleshooting

| Problem                                         | Solution                                                                                                         |
| ----------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `loupe: command not found`                      | Loupe is not installed. Run `sudo pacman -S loupe`.                                                              |
| Loupe does not open certain image formats       | Install additional codecs: `sudo pacman -S gst-plugins-good gst-plugins-bad gst-plugins-ugly`.                   |
| Thumbnails not showing in file picker           | Ensure `gnome-desktop-thumbnailer` is installed (part of `gnome-desktop`).                                       |
| The window is completely black (Wayland issues) | Loupe works well on Wayland. If you experience issues, try launching with `GDK_BACKEND=x11 loupe` as a fallback. |
| Slideshow stops after a few images              | Check that all files in the folder are valid images. Loupe may skip corrupted files.                             |

---

Your Loupe image viewer is now ready for fast, clean image viewing on GNOME (or any desktop). Enjoy the simplicity!
