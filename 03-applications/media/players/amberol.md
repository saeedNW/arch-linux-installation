# Amberol Music Player Setup Guide

Amberol is a minimalist, no‑frills music player for the Linux desktop. Built with GTK4 and Rust, it focuses on one job: **playing your local music files** – and nothing else. The interface is adaptive and recolours itself dynamically based on the album art of the currently playing track, giving it a modern, elegant look.

> **ℹ️ Note:** Amberol is available in the official `extra` repository of Arch Linux, so no AUR helper is required for the main installation. However, a `-git` version is also available in the AUR if you prefer the very latest development snapshot.

---

## Table of Contents

- [1. Installation](#1-installation)
- [2. Verification](#2-verification)
- [3. Launching Amberol](#3-launching-amberol)
- [4. Basic Usage & Features](#4-basic-usage--features)
- [5. Updating Amberol](#5-updating-amberol)
- [6. Uninstalling Amberol](#6-uninstalling-amberol)
- [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

### Method A: Official Arch Repository (Recommended)

Install Amberol directly from the `extra` repository:

```bash
sudo pacman -S amberol
```

This installs the stable version (currently `2026.1-1`), which integrates cleanly with your package management system.

### Method B: Flatpak (Alternative for Non‑Arch Systems)

If you are not on Arch Linux (or prefer sandboxed applications), Amberol is also available on Flathub:

```bash
flatpak install flathub io.bassi.Amberol
```

### Method C: AUR (`amberol-git`) – Latest Development Version

For users who want the latest commit from the official Git repository, the AUR provides a `-git` package:

```bash
yay -S amberol-git
```

> **⚠️ Note:** The `-git` version may be less stable than the official repository package. Only use it if you specifically need a feature that has not yet been released in the stable version.

---

## 2. Verification

To confirm that Amberol is installed correctly, run:

```bash
amberol --version
```

You should see output similar to:

```plaintext
amberol 2026.1
```

---

## 3. Launching Amberol

- **From the application menu** – look for “Amberol” in your desktop environment’s launcher (it integrates well with GNOME and other GTK‑based desktops).
- **From the terminal** – simply run:

  ```bash
  amberol
  ```

You can also open music files directly from the command line:

```bash
amberol /path/to/your/track.mp3
```

---

## 4. Basic Usage & Features

Amberol deliberately keeps its feature set simple and distraction‑free:

- **Playlist creation** – Add songs by dragging and dropping files or folders onto the window, or use the **Add** button in the bottom bar. A playlist is generated automatically from the selected media.
- **Playback controls** – Play, pause, previous, next, shuffle, and repeat functions are available.
- **UI recolouring** – By default, the interface automatically takes its colour from the album art of the current track. You can disable this in the settings menu if you prefer a static theme.
- **Keyboard media keys** – Supports common multimedia keys (play/pause, next, previous) for seamless integration with your hardware.
- **MPRIS integration** – Amberol can be controlled by other applications (such as desktop widgets or panel applets) that speak the MPRIS protocol.

> **💡 Tip:** Amberol does **not** include metadata editing, lyrics display, a full‑scale library manager, or any streaming services. It plays your local files and that’s it – which is exactly its intended design.

---

## 5. Updating Amberol

### Official repository version

Run your normal system update command:

```bash
sudo pacman -Syu
```

### Flatpak version

```bash
flatpak update io.bassi.Amberol
```

### AUR (`-git`) version

```bash
yay -Syu amberol-git
```

---

## 6. Uninstalling Amberol

### Official repository version

```bash
sudo pacman -Rns amberol
```

Remove leftover configuration files (stored in `~/.var/app/io.bassi.Amberol/` for Flatpak, or in `~/.local/share/amberol` for the native version, depending on your installation method):

```bash
rm -rf ~/.local/share/amberol
```

### Flatpak version

```bash
flatpak uninstall io.bassi.Amberol
```

### AUR (`-git`) version

```bash
yay -Rns amberol-git
```

---

## 7. Troubleshooting

| Problem                                                  | Solution                                                                                                                                                                                                                                         |
| -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `amberol: command not found`                             | Amberol is not installed. Re‑run the installation command for your chosen method.                                                                                                                                                                |
| Amberol does not play certain audio formats              | Ensure your system has the necessary GStreamer plugins installed: `sudo pacman -S gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly`                                                                                            |
| The interface does not recolour when playing an MP3 file | Some audio files may not contain embedded cover art. The recolouring feature relies on album art being present in the track’s metadata.                                                                                                          |
| Media keys do not work (play/pause, next, previous)      | Verify that your desktop environment is correctly capturing multimedia keys and forwarding them to applications. In GNOME, this usually works out of the box. In other environments, you may need to check your keyboard shortcut configuration. |
| Amberol crashes on launch                                | Run it from a terminal to see any error messages. The most common cause is missing GStreamer codecs (see above).                                                                                                                                 |

---

Your Amberol music player is now ready to enjoy your local music collection in a beautiful, distraction‑free interface.
