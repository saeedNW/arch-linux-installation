# VLC Media Player Setup Guide

VLC is a free and open‑source cross‑platform multimedia player that plays most multimedia files, discs, streams, and devices. It supports a vast array of audio and video formats without needing external codecs.

> **ℹ️ Note:** VLC is available in the official Arch Linux repositories, so no AUR helper is required.

---

## Table of Contents

- [VLC Media Player Setup Guide](#vlc-media-player-setup-guide)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Verification](#2-verification)
  - [3. Launching VLC](#3-launching-vlc)
  - [4. Optional: Install Additional Codecs \& Plugins](#4-optional-install-additional-codecs--plugins)
  - [5. Basic Configuration Tips](#5-basic-configuration-tips)
  - [6. Uninstalling VLC](#6-uninstalling-vlc)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

Install the core VLC package and all its plugins:

```bash
sudo pacman -S vlc vlc-plugins-all
```

- `vlc` – the main media player.
- `vlc-plugins-all` – a meta‑package that pulls in all available VLC plugins (codecs, interfaces, etc.).

> **💡 Tip:** If you want a minimal installation, install only `vlc` – it will still play most common formats. The `vlc-plugins-all` package adds support for exotic formats, Blu‑ray menus, and advanced streaming features.

---

## 2. Verification

Check that VLC is installed correctly:

```bash
vlc --version
```

You should see the version number and build information.

---

## 3. Launching VLC

- **From the application menu** – look for “VLC media player” in your desktop environment’s launcher.
- **From the terminal** – simply run:

  ```bash
  vlc
  ```

You can also open a file directly from the terminal:

```bash
vlc /path/to/video.mp4
```

---

## 4. Optional: Install Additional Codecs & Plugins

VLC uses its own built‑in codecs, but some advanced functionality (e.g., DVD navigation, Blu‑ray decryption) may require extra packages.

| Package     | Purpose                                                                                        |
| ----------- | ---------------------------------------------------------------------------------------------- |
| `libdvdcss` | Decrypt encrypted DVDs (not installed by default due to legal restrictions in some countries). |
| `a52dec`    | AC‑3 (Dolby Digital) audio decoding.                                                           |
| `faad2`     | AAC audio decoding.                                                                            |
| `libdvdnav` | DVD navigation support.                                                                        |
| `libbluray` | Blu‑ray disc playback support.                                                                 |

Install them if needed:

```bash
sudo pacman -S libdvdcss a52dec faad2 libdvdnav libbluray
```

> **⚠️ Note:** The legal status of `libdvdcss` varies by country; check your local laws before installing.

---

## 5. Basic Configuration Tips

- **Hardware acceleration:** Go to **Tools → Preferences → Input/Codecs** and set **Hardware‑accelerated decoding** to `Automatic` or `VA‑API` (for Intel/AMD) / `VDPAU` (for NVIDIA). This reduces CPU usage.
- **Always on top:** In the video window, right‑click → **Video** → **Always on top**.
- **Take screenshots:** Use the built‑in snapshot button (camera icon) or press `Ctrl+Alt+S`.
- **Increase audio volume beyond 100%:** Slide the volume bar past 100% (or use the `+` key); up to 200%.

---

## 6. Uninstalling VLC

```bash
sudo pacman -Rns vlc vlc-plugins-all
```

Optionally, remove configuration files (stored in `~/.config/vlc/`):

```bash
rm -rf ~/.config/vlc
```

---

## 7. Troubleshooting

| Problem                          | Solution                                                                                                                                               |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `vlc: command not found`         | VLC is not installed. Run `sudo pacman -S vlc`.                                                                                                        |
| Video plays without sound        | Check the audio output module in **Tools → Preferences → Audio → Output**. Try `ALSA` or `PulseAudio`.                                                 |
| Video is choppy / high CPU usage | Enable hardware acceleration (see [Configuration Tips](#5-basic-configuration-tips)).                                                                  |
| Cannot play encrypted DVD        | Install `libdvdcss` (see [Optional Codecs](#4-optional-install-additional-codecs--plugins)).                                                           |
| No video when using Wayland      | Launch VLC with `vlc --vout=wayland`. Or fall back to `vlc --vout=xcb`.                                                                                |
| Subtitles do not appear          | Ensure the subtitle file has the same name as the video file (e.g., `movie.mp4` and `movie.srt`). Load manually with **Subtitle → Add Subtitle File**. |
| VLC crashes on startup           | Run `vlc --reset-config` to reset all settings.                                                                                                        |

---

Your VLC media player is now ready to play almost any audio or video file you throw at it.
