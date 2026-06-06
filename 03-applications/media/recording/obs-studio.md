# OBS Studio – Open Broadcaster Software

OBS Studio is a free and open‑source software for video recording and live streaming. It supports high‑performance real‑time video/audio capturing, mixing, and encoding, and is compatible with most streaming platforms (Twitch, YouTube, Facebook Live, etc.).

> **ℹ️ Note:** OBS Studio is available in the official Arch Linux `extra` repository, so no AUR helper is required.

---

## Table of Contents

- [OBS Studio – Open Broadcaster Software](#obs-studio--open-broadcaster-software)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Verification](#2-verification)
  - [3. Launching OBS Studio](#3-launching-obs-studio)
  - [4. Optional: Install Additional Plugins](#4-optional-install-additional-plugins)
  - [5. Hardware Encoding – Add User to `video` Group](#5-hardware-encoding--add-user-to-video-group)
  - [6. Basic Configuration Tips](#6-basic-configuration-tips)
  - [7. Updating OBS Studio](#7-updating-obs-studio)
  - [8. Uninstalling OBS Studio](#8-uninstalling-obs-studio)
  - [9. Troubleshooting](#9-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S obs-studio
```

This installs the core OBS Studio package with default encoders (x264, AAC, etc.) and dependencies (FFmpeg, Qt6).

> **💡 Tip:** For a minimal installation, the above command is sufficient. OBS automatically uses software encoding (x264) which works on any system.

---

## 2. Verification

Check that OBS is installed correctly:

```bash
obs --version
```

You should see output like `OBS Studio x.x.x`.

---

## 3. Launching OBS Studio

- **From the application menu** – look for “OBS Studio” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  obs
  ```

---

## 4. Optional: Install Additional Plugins

Several community plugins are available in the official repositories:

| Package              | Purpose                                                                                                     |
| -------------------- | ----------------------------------------------------------------------------------------------------------- |
| `obs-studio-plugins` | A meta‑package that pulls in many useful plugins: browser source, VLC source, advanced scene switcher, etc. |
| `obs-v4l2sink`       | Virtual output device for v4l2 (e.g., use OBS as a virtual camera).                                         |
| `obs-websocket`      | Control OBS remotely via WebSocket (useful for Stream Deck, etc.).                                          |

```bash
sudo pacman -S obs-studio-plugins obs-v4l2sink obs-websocket
```

> **💡 Tip:** `obs-studio-plugins` includes the browser source, which is widely used for overlays (alerts, chat).

---

## 5. Hardware Encoding – Add User to `video` Group

To use hardware encoding (NVENC on NVIDIA, VA‑API on Intel/AMD) without `sudo`, you must add your user to the `video` group.

```bash
sudo usermod -aG video $USER
```

Log out and back in (or restart your session) for the change to take effect.

> **⚠️ Note:** If you skip this step, hardware encoders may be greyed out in OBS settings. After adding the group, restart OBS.

---

## 6. Basic Configuration Tips

- **Auto‑configuration wizard** – When you first start OBS, run the **Auto‑Configuration Wizard** (Tools → Auto‑Configuration Wizard). It will test your system and suggest optimal settings for streaming or recording.
- **Settings → Output**:
  - **Recording quality**: set to “High Quality, Medium File Size” for a good balance.
  - **Recording format**: `mkv` (safe; if OBS crashes, the file is recoverable). You can remux to `mp4` later (File → Remux Recordings).
- **Settings → Video**:
  - **Base (Canvas) Resolution**: your monitor resolution.
  - **Output (Scaled) Resolution**: your streaming resolution (e.g., 1920×1080 for 1080p, 1280×720 for 720p).
  - **Downscale Filter**: Lanczos (sharpened scaling, 36 samples) – best quality.
- **Sources** – Add a “Display Capture” to record your whole screen, or “Window Capture” for a specific window.

---

## 7. Updating OBS Studio

Run a standard system update:

```bash
sudo pacman -Syu
```

The OBS package will be updated along with other packages.

---

## 8. Uninstalling OBS Studio

```bash
sudo pacman -Rns obs-studio obs-studio-plugins obs-v4l2sink obs-websocket
```

Remove leftover configuration files (stored in `~/.config/obs-studio/`):

```bash
rm -rf ~/.config/obs-studio
```

---

## 9. Troubleshooting

| Problem                                               | Solution                                                                                                                                                              |
| ----------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `obs: command not found`                              | OBS is not installed. Run `sudo pacman -S obs-studio`.                                                                                                                |
| Hardware encoders (NVENC, VA‑API) are not available   | Add your user to the `video` group (see [Section 5](#5-hardware-encoding--add-user-to-video-group)) and restart OBS.                                                  |
| OBS crashes when adding a browser source              | Install `qt6-webengine` (dependency may be missing): `sudo pacman -S qt6-webengine`.                                                                                  |
| No audio in recordings / streams                      | Check **Settings → Audio → Desktop Audio Device** is set to your default sound card. Also ensure the “Desktop Audio” volume meter in the mixer shows activity.        |
| Screen capture is black (Wayland)                     | OBS on Wayland requires `xdg-desktop-portal` and permission via PipeWire. Launch OBS with `obs --portal`. For full compatibility, consider using X11 for the session. |
| Virtual camera not working (`obs-v4l2sink` installed) | Load the v4l2loopback module: `sudo modprobe v4l2loopback`. To make it permanent, add `v4l2loopback` to `/etc/modules-load.d/obs.conf`.                               |
| High CPU usage while streaming                        | Use hardware encoding (see Section 5). If still high, lower the output resolution or use a faster x264 preset (e.g., `veryfast`).                                     |

---

Your OBS Studio is now ready to record or stream your desktop, games, or camera feeds – with hardware encoding optimised for your GPU.
