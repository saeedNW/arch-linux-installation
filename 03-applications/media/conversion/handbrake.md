# HandBrake – Video Transcoder

HandBrake is a free, open‑source video transcoder that converts video files from nearly any format to a modern, broadly supported codec (H.264, H.265, MPEG‑4, etc.). It includes presets for common devices (smartphones, tablets, game consoles) and advanced controls for bitrate, frame rate, filters, and subtitles.

> **ℹ️ Note:** HandBrake is available in the official Arch Linux `extra` repository, so no AUR helper is required.

---

## Table of Contents

- [HandBrake – Video Transcoder](#handbrake--video-transcoder)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Verification](#2-verification)
  - [3. Launching HandBrake](#3-launching-handbrake)
  - [4. Basic Usage](#4-basic-usage)
    - [Graphical Interface](#graphical-interface)
    - [Command‑Line Interface (CLI)](#commandline-interface-cli)
  - [5. Command‑Line Interface (`HandBrakeCLI`)](#5-commandline-interface-handbrakecli)
  - [6. Optional: Install Extra Presets \& Dependencies](#6-optional-install-extra-presets--dependencies)
  - [7. Updating HandBrake](#7-updating-handbrake)
  - [8. Uninstalling HandBrake](#8-uninstalling-handbrake)
  - [9. Troubleshooting](#9-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S handbrake
```

This installs the **graphical version** (`ghb` – Gtk HandBrake) as well as the command‑line tool `HandBrakeCLI`.

---

## 2. Verification

Check that both components are installed:

```bash
ghb --version
HandBrakeCLI --version
```

You should see the version number (e.g., `1.9.2`).

---

## 3. Launching HandBrake

- **Graphical interface** – from your application menu, look for “HandBrake”, or run:

  ```bash
  ghb
  ```

- **Command‑line** – use `HandBrakeCLI` (see below).

---

## 4. Basic Usage

### Graphical Interface

1. **Open a source** – Click **“Open Source”** and select a video file, folder (for batch), or DVD/Blu‑ray disc.
2. **Choose a preset** – On the right side, select a preset (e.g., “Fast 1080p30”).
3. **Adjust settings** – You can modify video encoder, quality (RF value), framerate, audio/subtitle tracks, and filters (deinterlace, denoise).
4. **Set destination** – Click **“Browse”** to choose where to save the output file.
5. **Start encoding** – Click the **“Start Encode”** button (green icon).

> **💡 Tip:** Use the “Preview” button to watch a short sample before encoding the whole file.

### Command‑Line Interface (CLI)

The CLI is extremely useful for scripting and batch processing.

**Basic conversion** (MP4, H.264, quality 22):

```bash
HandBrakeCLI -i input.mkv -o output.mp4 -e x264 -q 22
```

**Use a preset** (e.g., “Fast 1080p30”):

```bash
HandBrakeCLI -i input.mkv -o output.mp4 --preset="Fast 1080p30"
```

**List all built‑in presets**:

```bash
HandBrakeCLI --preset-list
```

**Batch convert all `.mkv` files in a folder** (using a loop):

```bash
for file in *.mkv; do
  HandBrakeCLI -i "$file" -o "${file%.mkv}.mp4" --preset="Fast 1080p30"
done
```

---

## 5. Command‑Line Interface (`HandBrakeCLI`)

The CLI offers fine‑grained control. Below are common options:

| Option            | Purpose                                                         |
| ----------------- | --------------------------------------------------------------- |
| `-i <input>`      | Input file or device.                                           |
| `-o <output>`     | Output file name.                                               |
| `-e <encoder>`    | Video encoder: `x264`, `x265`, `mpeg4`, etc.                    |
| `-q <float>`      | Quality (RF) value: 18–28; lower = better quality, larger file. |
| `-b <bitrate>`    | Average bitrate (kbps) – alternative to `-q`.                   |
| `-r <fps>`        | Frame rate (`30`, `60`, `sameasource`).                         |
| `--preset="name"` | Use a built‑in preset.                                          |
| `-E <aencoder>`   | Audio encoder: `ca_aac`, `mp3`, `copy:aac`, etc.                |
| `-B <bitrate>`    | Audio bitrate (kbps).                                           |
| `-s <track>`      | Subtitle track number.                                          |
| `--all-subtitles` | Include all subtitles.                                          |

Example: Convert to H.265, constant quality 24, AAC audio at 160 kbps:

```bash
HandBrakeCLI -i in.mkv -o out.mp4 -e x265 -q 24 -E ca_aac -B 160
```

---

## 6. Optional: Install Extra Presets & Dependencies

HandBrake’s official package already includes most common presets. If you need additional ones (e.g., for specific devices), you can download them from the [HandBrake Presets Library](https://handbrake.fr/presets) and import them via the GUI (Menu → File → Import Presets).

For **DVD/Blu‑ray decryption**, install `libdvdcss`:

```bash
sudo pacman -S libdvdcss
```

> **⚠️ Note:** Check your local laws before installing `libdvdcss`.

---

## 7. Updating HandBrake

```bash
sudo pacman -Syu
```

HandBrake will be updated along with other system packages.

---

## 8. Uninstalling HandBrake

```bash
sudo pacman -Rns handbrake
```

Remove configuration files (stored in `~/.config/ghb/`):

```bash
rm -rf ~/.config/ghb
```

---

## 9. Troubleshooting

| Problem                                    | Solution                                                                                                                                                                                                                             |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ghb: command not found`                   | HandBrake not installed. Run `sudo pacman -S handbrake`.                                                                                                                                                                             |
| HandBrake crashes when opening a video     | The video may be corrupted or use an unusual codec. Try re‑encoding with `ffmpeg` first.                                                                                                                                             |
| No audio in output file                    | Ensure you selected an audio track in the GUI, or use `-E copy:aac` in the CLI to copy the original audio.                                                                                                                           |
| Very slow encoding                         | Use a faster preset (e.g., “Very Fast 1080p30”), or enable hardware acceleration if your GPU supports it (NVENC, VA‑API). Note: The open‑source version does **not** include GPU encoders by default; you would need a custom build. |
| Subtitles not burned in                    | In the GUI, go to the “Subtitles” tab and click “Add Track”. Then select “Burn in”. In CLI: `-s 1 -S "scan"` (advanced).                                                                                                             |
| `HandBrakeCLI` gives “invalid preset name” | Run `HandBrakeCLI --preset-list` to see the exact names. Use quotes if the name contains spaces.                                                                                                                                     |
| Cannot open DVD / Blu‑ray                  | Install `libdvdcss` and ensure the disc is mounted. For Blu‑ray, you may also need `libaacs`.                                                                                                                                        |

---

Your HandBrake installation is now ready to convert videos for any device – from smartphones to home theatre systems. Enjoy!
