# nomacs – Lightweight Image Viewer

nomacs is a free, open‑source image viewer that supports multiple platforms. It is fast, feature‑rich, and includes tools for image manipulation, comparison, and batch processing. It is available both in the official Arch Linux `extra` repository and as an AUR package.

> **ℹ️ Note:** nomacs is designed for efficiency and can handle large image collections with a tabbed interface, thumbnail previews, and metadata editing.

---

## Table of Contents

- [nomacs – Lightweight Image Viewer](#nomacs--lightweight-image-viewer)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
    - [Method A: Official Repository (Recommended)](#method-a-official-repository-recommended)
    - [Method B: AUR (if you need a newer version or specific build)](#method-b-aur-if-you-need-a-newer-version-or-specific-build)
  - [2. Launching nomacs](#2-launching-nomacs)
  - [3. Basic Usage](#3-basic-usage)
  - [4. Keyboard Shortcuts](#4-keyboard-shortcuts)
  - [5. Advanced Features](#5-advanced-features)
    - [Image Comparison](#image-comparison)
    - [Batch Processing](#batch-processing)
    - [Metadata Editing](#metadata-editing)
  - [6. Updating nomacs](#6-updating-nomacs)
    - [Official repository version](#official-repository-version)
    - [AUR version](#aur-version)
  - [7. Uninstalling nomacs](#7-uninstalling-nomacs)
    - [Official version](#official-version)
    - [AUR version](#aur-version-1)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

### Method A: Official Repository (Recommended)

```bash
sudo pacman -S nomacs
```

This installs the latest stable version directly from the `extra` repository – no AUR helper needed.

### Method B: AUR (if you need a newer version or specific build)

```bash
yay -S nomacs
```

> **💡 Tip:** The official repository version is usually up‑to‑date. Use the AUR only if you specifically need a development snapshot.

---

## 2. Launching nomacs

- **From the application menu** – look for “nomacs” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  nomacs
  ```

You can also open an image directly:

```bash
nomacs /path/to/image.jpg
```

Or open multiple images at once (they will appear in separate tabs):

```bash
nomacs image1.jpg image2.png
```

---

## 3. Basic Usage

- **Open an image** – use `Ctrl+O` or drag and drop files onto the window.
- **Zoom** – mouse wheel, or `Ctrl+Plus` / `Ctrl+Minus`.
- **Pan** – click and drag while zoomed in.
- **Next/Previous** – `Page Down` / `Page Up`, or the arrow icons.
- **Fullscreen** – `F11` or double‑click on the image area.
- **Slide show** – `F5`.
- **Fit to window** – `F` (or double‑click when not fullscreen).
- **Thumbnail browser** – `Ctrl+T` to open a sidebar with thumbnails of all images in the folder.

> **💡 Tip:** nomacs remembers your last used directory and zoom level per image.

---

## 4. Keyboard Shortcuts

| Shortcut                   | Action                                       |
| -------------------------- | -------------------------------------------- |
| `Ctrl+O`                   | Open image(s)                                |
| `Ctrl+W`                   | Close current tab                            |
| `Ctrl+Q`                   | Quit                                         |
| `F11`                      | Fullscreen                                   |
| `F5`                       | Start slideshow                              |
| `F`                        | Fit image to window                          |
| `Ctrl+Plus` / `Ctrl+Minus` | Zoom in / out                                |
| `0` (zero)                 | Zoom to 100%                                 |
| `Ctrl+0`                   | Fit to window (same as `F`)                  |
| `Page Up` / `Page Down`    | Previous / next image                        |
| `Home` / `End`             | First / last image in folder                 |
| `R`                        | Rotate 90° clockwise                         |
| `Ctrl+R`                   | Rotate 90° counter‑clockwise                 |
| `H`                        | Flip horizontally                            |
| `V`                        | Flip vertically                              |
| `C`                        | Cycle colour channel (RGB, Red, Green, Blue) |
| `I`                        | Show image information (metadata)            |
| `Ctrl+I`                   | Open the metadata editor                     |
| `Ctrl+T`                   | Toggle thumbnail browser                     |
| `Ctrl+S`                   | Save a copy (export)                         |
| `Ctrl+Shift+S`             | Save with a different format                 |
| `Ctrl+C`                   | Copy image to clipboard                      |
| `Ctrl+Shift+C`             | Copy file path to clipboard                  |
| `Ctrl+E`                   | Edit image in external program (e.g., GIMP)  |

---

## 5. Advanced Features

### Image Comparison

nomacs includes an **image comparison** tool, useful for photographers and designers.

1. Open two images (in two tabs).
2. Go to **Windows → Image Comparison** (or press `Ctrl+M`).
3. The two images will be displayed side‑by‑side with a sliding divider.

### Batch Processing

You can resize, rename, or convert multiple images at once:

1. Open the **File → Batch Processing** dialog.
2. Add images or a whole folder.
3. Select operations (e.g., resize, rotate, convert format).
4. Choose output directory and file name pattern.
5. Click **Start**.

### Metadata Editing

View and edit Exif, IPTC, and XMP metadata:

1. Open an image.
2. Press `Ctrl+I` to open the **Metadata** dialog.
3. Edit fields such as description, author, copyright, etc.
4. Click **Save** to write changes to the file (works for JPEG, TIFF, PNG with metadata support).

---

## 6. Updating nomacs

### Official repository version

```bash
sudo pacman -Syu
```

### AUR version

```bash
yay -Syu nomacs
```

---

## 7. Uninstalling nomacs

### Official version

```bash
sudo pacman -Rns nomacs
```

### AUR version

```bash
yay -Rns nomacs
```

Remove configuration files (stored in `~/.config/nomacs/`):

```bash
rm -rf ~/.config/nomacs
```

---

## 8. Troubleshooting

| Problem                                    | Solution                                                                                                                  |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------- |
| `nomacs: command not found`                | nomacs is not installed. Run `sudo pacman -S nomacs`.                                                                     |
| nomacs does not open certain image formats | Install `qt5-imageformats` for extra format support: `sudo pacman -S qt5-imageformats`.                                   |
| Thumbnails not showing                     | Ensure you have `ffmpegthumbs` or `kimageformats` installed for video thumbnails. For images, no extra package is needed. |
| High CPU usage when browsing               | Disable **Settings → General → Load previews for all files in folder** if you have very large folders.                    |
| Drag‑and‑drop not working on Wayland       | Launch with `QT_QPA_PLATFORM=xcb nomacs` as a workaround.                                                                 |
| Metadata editing fails (greyed out)        | The image format may not support embedded metadata. Save the file as JPEG or TIFF first.                                  |
| nomacs crashes on startup                  | Reset configuration: `rm -rf ~/.config/nomacs` and restart.                                                               |

---

Your nomacs installation is now ready to view, organise, and edit images with speed and versatility. Enjoy the power of an advanced image viewer!
