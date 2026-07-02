# yt‑dlp – Video Downloader Command‑Line Tool

`yt‑dlp` is a powerful command‑line program that downloads videos from **YouTube** and hundreds of other websites (Twitch, Vimeo, Twitter, Facebook, etc.). It is a faster, feature‑richer fork of the popular `youtube‑dl` project.

> **ℹ️ Note:** The `yt‑dlp` package is available in the official Arch Linux `extra` repository, so no AUR helper is required. The extra `yt‑dlp-ejs` package adds an embedded JavaScript interpreter for improved format selection.

---

## Table of Contents

- [yt‑dlp – Video Downloader Command‑Line Tool](#ytdlp--video-downloader-commandline-tool)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Verification](#2-verification)
  - [3. Basic Usage](#3-basic-usage)
  - [4. Advanced Features \& Common Options](#4-advanced-features--common-options)
  - [5. Custom Alias (Recommended)](#5-custom-alias-recommended)
  - [6. Updating yt‑dlp](#6-updating-ytdlp)
  - [7. Uninstalling](#7-uninstalling)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

Install the main package along with the embedded JavaScript interpreter (improves format selection):

```bash
sudo pacman -S yt-dlp yt-dlp-ejs
```

- `yt-dlp` – the core downloader.
- `yt-dlp-ejs` – embeds a small JavaScript interpreter (µBlock origin’s `duktape`), which makes format selection more accurate for sites that rely on dynamic JavaScript.

> **💡 Tip:** If you do not install `yt-dlp-ejs`, `yt‑dlp` will still work, but may sometimes choose suboptimal formats.

---

## 2. Verification

Check that the installation succeeded:

```bash
yt-dlp --version
```

Example output: `2025.12.18`

---

## 3. Basic Usage

Download a video (best quality automatically):

```bash
yt-dlp https://www.youtube.com/watch?v=VIDEO_ID
```

Download only audio (best quality, as MP3):

```bash
yt-dlp -x --audio-format mp3 https://www.youtube.com/watch?v=VIDEO_ID
```

Download a video with a specific resolution:

```bash
yt-dlp -f "best[height<=720]" https://www.youtube.com/watch?v=VIDEO_ID
```

---

## 4. Advanced Features & Common Options

| Option                           | Purpose                                                                            |
| -------------------------------- | ---------------------------------------------------------------------------------- |
| `-f "bestvideo+bestaudio/best"`  | Merge best video and best audio streams into one file.                             |
| `--merge-output-format mkv`      | Use MKV container for the merged output (supports most codecs).                    |
| `--js node`                      | Use the embedded JavaScript interpreter (from `yt-dlp-ejs`) for format extraction. |
| `-x --audio-format mp3`          | Extract audio and convert to MP3.                                                  |
| `--playlist-start N`             | Start downloading a playlist from video number N.                                  |
| `--download-archive archive.txt` | Skip already downloaded videos (tracking file).                                    |
| `--limit-rate 2M`                | Limit download speed to 2 MiB/s.                                                   |
| `--cookies cookies.txt`          | Use browser cookies to access age‑restricted content.                              |

---

## 5. Custom Alias (Recommended)

Create an alias that uses the **embedded JavaScript interpreter** (`--js node`) and merges the best video + best audio streams into a **single MKV file**. This alias is especially useful for YouTube downloads.

Add the following line to your shell configuration file (e.g., `~/.bashrc`, `~/.zshrc`, or `~/.config/fish/config.fish`):

```bash
alias ytdl='yt-dlp --js node -f "bestvideo+bestaudio/best" --merge-output-format mkv'
```

After adding, reload your shell configuration:

```bash
source ~/.bashrc   # for Bash
# or
source ~/.zshrc    # for Zsh
```

**Usage example with the alias:**

```bash
ytdl https://www.youtube.com/watch?v=VIDEO_ID
```

> **💡 Tip:** The alias ensures you always get the highest possible quality combination (e.g., separate 4K video + best audio) merged into a single MKV file.

---

## 6. Updating yt‑dlp

Regular updates are important because YouTube and other sites frequently change their layout.

```bash
sudo pacman -Syu yt-dlp yt-dlp-ejs
```

> **⚠️ Note:** If you use the `--js node` option, ensure `yt-dlp-ejs` is also kept up to date.

---

## 7. Uninstalling

Remove both packages:

```bash
sudo pacman -Rns yt-dlp yt-dlp-ejs
```

Remove the alias from your shell configuration file manually if you added it.

---

## 8. Troubleshooting

| Problem                                               | Solution                                                                                                                                |
| ----------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `yt-dlp: command not found`                           | Install the package first (`sudo pacman -S yt-dlp`).                                                                                    |
| `ERROR: Unsupported URL`                              | The site is not supported. Check the [list of supported sites](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md).         |
| `ERROR: No video formats found`                       | The site may require cookies. Use `--cookies-from-browser BROWSER` (e.g., `--cookies-from-browser firefox`).                            |
| `ERROR: The JS interpreter "node" is not installed`   | You need `yt-dlp-ejs`. Install it with `sudo pacman -S yt-dlp-ejs`.                                                                     |
| Download stops mid‑way                                | Restart the download – `yt-dlp` supports resuming. Add `--continue` (enabled by default).                                               |
| `ffmpeg` missing warnings                             | Install `ffmpeg` to merge video and audio tracks: `sudo pacman -S ffmpeg`.                                                              |
| `--js node` does not work (alias defined incorrectly) | Ensure the alias uses single quotes for the format string. Double quotes would interpret `$` inside. Use the exact line provided above. |

---

Your `yt‑dlp` installation is now ready to download videos in the best possible quality, with optional embedded JS support for reliable format extraction.
