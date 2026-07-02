# spotdl – Music Downloader from Spotify and Other Platforms

`spotdl` (python-spotdl) is a command‑line tool that downloads music from **Spotify**, YouTube, SoundCloud, and other streaming services. It fetches the audio track, embeds metadata (title, artist, album, cover art), and saves it as an MP3 file.

> **ℹ️ Note:** The AUR package `python-spotdl` installs the latest stable version. This guide uses `yay` as the AUR helper (following the project’s preferred style). For Arch Linux, the package is available only via AUR.

---

## Table of Contents

- [spotdl – Music Downloader from Spotify and Other Platforms](#spotdl--music-downloader-from-spotify-and-other-platforms)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Verification](#2-verification)
  - [3. Basic Usage](#3-basic-usage)
  - [4. Configuration (Optional)](#4-configuration-optional)
  - [5. Custom Alias](#5-custom-alias)
  - [6. Updating spotdl](#6-updating-spotdl)
  - [7. Uninstalling](#7-uninstalling)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

Install `python-spotdl` from the AUR:

```bash
yay -S python-spotdl
```

> **💡 Tip:** The package name is `python-spotdl`. After installation, the command `spotdl` is available.

---

## 2. Verification

Check that the tool is installed correctly:

```bash
spotdl --version
```

You should see output like `spotdl x.x.x`.

---

## 3. Basic Usage

Download a single track by providing a Spotify URL:

```bash
spotdl https://open.spotify.com/track/TRACK_ID
```

Download a whole album:

```bash
spotdl https://open.spotify.com/album/ALBUM_ID
```

Download a playlist:

```bash
spotdl https://open.spotify.com/playlist/PLAYLIST_ID
```

By default, files are saved to the current directory with the naming pattern `{artist} - {title}.mp3`.

---

## 4. Configuration (Optional)

Create a configuration file to set default preferences (download folder, naming scheme, etc.).

The configuration file is located at `~/.config/spotdl/config.toml`. Create it if it does not exist:

```bash
mkdir -p ~/.config/spotdl
```

Example content:

```toml
# Default output directory
output = "/home/username/Music/SpotifyDownloads"

# Naming format
format = "{artist} - {title}"

# Save album covers
save_cover = true

# Preload all tracks before downloading (useful for large playlists)
preload = true
```

After editing, spotdl will use these defaults. You can still override them with command‑line flags.

> **💡 Tip:** Run `spotdl --help` for a full list of options.

---

## 5. Custom Alias

Create a simple alias for convenience (or just to shorten the command).
Add the following line to your shell configuration file (e.g., `~/.bashrc`, `~/.zshrc`, or `~/.config/fish/config.fish`):

```bash
alias spdl='spotdl'
```

After adding, reload your shell configuration:

```bash
source ~/.bashrc   # for Bash
# or
source ~/.zshrc    # for Zsh
```

Now you can use `spdl` instead of `spotdl`.

---

## 6. Updating spotdl

Update the package through your AUR helper:

```bash
yay -Syu python-spotdl
```

---

## 7. Uninstalling

Remove the package:

```bash
yay -Rns python-spotdl
```

Remove the configuration directory (optional):

```bash
rm -rf ~/.config/spotdl
```

---

## 8. Troubleshooting

| Problem                                               | Solution                                                                                                                                    |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `spotdl: command not found`                           | The package may not have been installed correctly. Reinstall with `yay -S python-spotdl`.                                                   |
| `No module named 'spotdl'` (Python error)             | The installation failed; try building manually: `git clone https://aur.archlinux.org/python-spotdl.git && cd python-spotdl && makepkg -si`. |
| Downloads fail with `ERROR: Could not get track info` | The Spotify API may be rate‑limiting. Wait a few minutes and retry. Sometimes using a `--cookie` from your browser helps.                   |
| Files are saved without metadata                      | Ensure you have `ffmpeg` installed (`sudo pacman -S ffmpeg`). spotdl uses it for embedding metadata.                                        |
| Download takes very long                              | The tool fetches audio from YouTube, which is slower than a direct CDN. Use `--preload` to reduce per‑track delays.                         |

---

Your `spotdl` music downloader is now ready to fetch songs, albums, and playlists directly to your local library.
