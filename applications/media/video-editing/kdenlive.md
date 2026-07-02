# Kdenlive – Video Editing Software

Kdenlive is a powerful, open‑source video editor built on the MLT framework, KDE Frameworks, and FFmpeg. It supports multi‑track editing, a wide range of effects and transitions, keyframing, proxy editing, and many export formats – suitable for both amateur and semi‑professional video production.

> **ℹ️ Note:** Kdenlive is available in the official Arch Linux `extra` repository, so no AUR helper is required.

---

## Table of Contents

- [Kdenlive – Video Editing Software](#kdenlive--video-editing-software)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Verification](#2-verification)
  - [3. Launching Kdenlive](#3-launching-kdenlive)
  - [4. Optional: Install Additional Codecs \& Profiles](#4-optional-install-additional-codecs--profiles)
  - [5. Basic Configuration Tips](#5-basic-configuration-tips)
  - [6. Updating Kdenlive](#6-updating-kdenlive)
  - [7. Uninstalling Kdenlive](#7-uninstalling-kdenlive)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S kdenlive
```

This installs the core Kdenlive package together with the MLT framework and essential FFmpeg libraries.

> **💡 Tip:** Kdenlive will also pull in KDE Frameworks dependencies (e.g., `kio`, `knewstuff`), which are normal even if you are not using KDE Plasma as your desktop environment.

---

## 2. Verification

Check that Kdenlive is installed correctly:

```bash
kdenlive --version
```

You should see output like `kdenlive x.x.x`, along with MLT and Qt version information.

---

## 3. Launching Kdenlive

- **From the application menu** – look for “Kdenlive” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  kdenlive
  ```

> **💡 Tip:** Kdenlive may take a few seconds longer on the first launch as it initialises the MLT environment.

---

## 4. Optional: Install Additional Codecs & Profiles

By default, Kdenlive supports most common video/audio formats through FFmpeg. For additional import/export capabilities, you may want to install:

| Package          | Purpose                                                                                       |
| ---------------- | --------------------------------------------------------------------------------------------- |
| `ffmpeg`         | (Already a dependency) – provides core encoding/decoding.                                     |
| `mlt`            | Already installed with Kdenlive; you can optionally install `mlt-python` for Python bindings. |
| `frei0r-plugins` | Additional video effects (glitch, colour grading, etc.).                                      |
| `lame`           | MP3 encoding (usually already present).                                                       |
| `x264` / `x265`  | High‑efficiency video encoding.                                                               |
| `libdvdcss`      | Decrypt encrypted DVDs (if needed).                                                           |

Install extra plugins:

```bash
sudo pacman -S frei0r-plugins
```

> **⚠️ Note:** `frei0r-plugins` provides dozens of extra filters and effects that appear in Kdenlive’s effect list.

---

## 5. Basic Configuration Tips

- **Proxy clips** – If you edit high‑resolution footage (4K), enable **Proxy Clips** (Project → Proxy Clips → “Add proxy clips for selected clips”). This creates lower‑resolution copies for smooth editing; Kdenlive uses the original files at export time.
- **Performance** – In **Settings → Configure Kdenlive → Playback**, increase the “Threads for processing” to match your CPU core count.
- **Backup** – Enable **Settings → Configure Kdenlive → Environment → “Autosave every X minutes”** and increase the maximum backup files.
- **GPU acceleration** – Kdenlive can use hardware decoding/encoding via FFmpeg. Go to **Settings → Configure Kdenlive → Hardware** and enable hardware decoding if your GPU supports it (NVENC, VA‑API, etc.).

---

## 6. Updating Kdenlive

Run a standard system update:

```bash
sudo pacman -Syu
```

Kdenlive will be updated along with other packages.

---

## 7. Uninstalling Kdenlive

```bash
sudo pacman -Rns kdenlive
```

Remove leftover configuration files (stored in `~/.config/kdenliverc` and `~/.local/share/kdenlive/`):

```bash
rm -rf ~/.config/kdenliverc
rm -rf ~/.local/share/kdenlive
```

---

## 8. Troubleshooting

| Problem                                               | Solution                                                                                                                                                     |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `kdenlive: command not found`                         | Kdenlive is not installed. Run `sudo pacman -S kdenlive`.                                                                                                    |
| Kdenlive crashes on startup                           | Run from terminal to see errors. Often caused by missing `mlt` or `frei0r` plugins. Reinstall: `sudo pacman -S kdenlive frei0r-plugins`.                     |
| Timeline is laggy / playback stutters                 | Enable proxy clips (see [Configuration Tips](#5-basic-configuration-tips)). Reduce playback resolution (in monitor settings).                                |
| No audio in timeline preview                          | Check **Settings → Configure Kdenlive → Audio → Audio driver**. Try `pulseaudio` or `pipewire`. Also ensure your system sound works.                         |
| Effects not showing in the list                       | Install `frei0r-plugins` (see [Optional Packages](#4-optional-install-additional-codecs--profiles)).                                                         |
| Exported video has no sound                           | Ensure the source clip’s audio track is enabled (speaker icon in timeline). Also check the export profile (e.g., “MP4 – H.264/AAC”) includes audio encoding. |
| Wayland issues (cursor invisible, window positioning) | Kdenlive works under Wayland, but some tooltips may misbehave. Run with `QT_QPA_PLATFORM=xcb kdenlive` to force X11 compatibility.                           |
| Missing MLT module errors                             | MLT may need a rebuild. Run `sudo pacman -S mlt`.                                                                                                            |

---

Your Kdenlive video editor is now ready to create and edit professional‑looking videos. Enjoy the freedom of open‑source video production!
