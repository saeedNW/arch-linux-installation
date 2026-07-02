# qView – Lightweight Image Viewer

qView is a lightweight, fast, and minimalist image viewer for Linux. It is designed for simplicity and ease of use, supporting a wide range of image formats. With a distraction‑free interface, qView provides a clean environment for viewing images.

> **ℹ️ Note:** qView is available in the Arch User Repository (AUR). This guide uses `yay` as the AUR helper.

---

## Table of Contents

- [qView – Lightweight Image Viewer](#qview--lightweight-image-viewer)
	- [Table of Contents](#table-of-contents)
	- [1. Installation](#1-installation)
	- [2. Launching qView](#2-launching-qview)
	- [3. Basic Usage](#3-basic-usage)
	- [4. Keyboard Shortcuts](#4-keyboard-shortcuts)
	- [5. Configuration](#5-configuration)
	- [6. Updating qView](#6-updating-qview)
	- [7. Uninstalling qView](#7-uninstalling-qview)
	- [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

Install `qview` from the AUR:

```bash
yay -S qview
```

> **💡 Tip:** The AUR package builds from source. It is small and compiles quickly.

---

## 2. Launching qView

- **From the application menu** – look for “qView” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  qview
  ```

You can also open an image directly:

```bash
qview /path/to/image.jpg
```

---

## 3. Basic Usage

- **Open an image** – drag and drop a file onto the window, or use `Ctrl+O`.
- **Zoom** – use the mouse wheel, or press `+` / `-`.
- **Pan** – click and drag the image (if zoomed in).
- **Next/Previous** – press `Page Down` / `Page Up` or `Right Arrow` / `Left Arrow` (when browsing a folder).
- **Fullscreen** – press `F` or double‑click.
- **Slideshow** – press `Shift+F` to start a slideshow of all images in the current folder.

> **💡 Tip:** qView automatically detects all images in the same folder as the opened file, allowing you to navigate through them without needing to open a playlist.

---

## 4. Keyboard Shortcuts

| Shortcut       | Action                                       |
| -------------- | -------------------------------------------- |
| `Ctrl+O`       | Open an image                                |
| `Ctrl+Q`       | Quit                                         |
| `F`            | Toggle fullscreen                            |
| `Space`        | Next image                                   |
| `Backspace`    | Previous image                               |
| `+` / `-`      | Zoom in / out                                |
| `0` (zero)     | Reset zoom to 100%                           |
| `Ctrl+0`       | Fit image to window                          |
| `R`            | Rotate 90° clockwise                         |
| `Ctrl+R`       | Rotate 90° counter‑clockwise                 |
| `H`            | Flip horizontally                            |
| `V`            | Flip vertically                              |
| `C`            | Cycle colour channel (RGB, Red, Green, Blue) |
| `I`            | Toggle image information overlay             |
| `P`            | Toggle pixel grid (when zoomed > 100%)       |
| `Ctrl+S`       | Save a copy (with a different name/format)   |
| `Ctrl+C`       | Copy image to clipboard                      |
| `Ctrl+Shift+C` | Copy file path to clipboard                  |

---

## 5. Configuration

qView has minimal configuration. Settings are stored in `~/.config/qView/qView.conf`. You can edit this file manually, or adjust preferences via the **Edit → Preferences** menu.

| Setting                | Description                                                           |
| ---------------------- | --------------------------------------------------------------------- |
| **Theme**              | Choose between `system`, `dark`, or `light`.                          |
| **Background colour**  | Set the background colour for the window (e.g., `#000000` for black). |
| **Slideshow interval** | Delay in seconds between images in slideshow mode.                    |
| **Lock zoom**          | Keep zoom level when switching between images.                        |
| **Smooth scaling**     | Enable/disable smooth scaling (bilinear filtering).                   |

---

## 6. Updating qView

```bash
yay -Syu qview
```

This updates qView along with other AUR packages.

---

## 7. Uninstalling qView

```bash
yay -Rns qview
```

Remove configuration files (optional):

```bash
rm -rf ~/.config/qView
```

---

## 8. Troubleshooting

| Problem                                   | Solution                                                                                                                                                  |
| ----------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `qview: command not found`                | qView is not installed. Run `yay -S qview`.                                                                                                               |
| qView does not open certain image formats | Ensure your system has the necessary image libraries. Install `libjpeg-turbo`, `libpng`, `libtiff`, etc. (`sudo pacman -S libjpeg-turbo libpng libtiff`). |
| The window is completely black            | This may happen on some Wayland compositors. Try launching with `QT_QPA_PLATFORM=xcb qview`.                                                              |
| Drag and drop does not work               | Launch qView from the terminal. Some desktop environments restrict drag‑and‑drop for applications started from the menu.                                  |
| Slideshow uses wrong order                | qView follows the alphabetical order of filenames. Rename files to sort them as desired.                                                                  |
| High CPU usage when browsing images       | Disable **Smooth scaling** in Preferences, or use the `--no-smooth` command‑line option.                                                                  |

---

Your qView installation is now ready to view images quickly and without distractions. Enjoy the minimalist approach!
