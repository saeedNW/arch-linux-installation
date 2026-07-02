# Discord – Communication Platform

Discord is a popular communication platform offering text, voice, and video chat, as well as community servers. It is available in the official Arch Linux repositories, so no AUR helper is required for the stable version.

> **ℹ️ Note:** The package `discord` provides the **stable** version. For early releases, `discord-canary` (AUR) and `discord-ptb` (AUR) are also available.

---

## Table of Contents

- [Discord – Communication Platform](#discord--communication-platform)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Discord](#2-launching-discord)
  - [3. Updating Discord](#3-updating-discord)
  - [4. Uninstalling Discord](#4-uninstalling-discord)
  - [5. Troubleshooting](#5-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S discord
```

This installs the stable Discord client from the official repositories.

**Alternative versions (AUR):**

| Version                 | Package          | AUR helper command      |
| ----------------------- | ---------------- | ----------------------- |
| Canary (alpha)          | `discord-canary` | `yay -S discord-canary` |
| Public Test Build (PTB) | `discord-ptb`    | `yay -S discord-ptb`    |

> **💡 Tip:** The stable version is recommended for most users. Only install Canary or PTB if you need to test upcoming features.

---

## 2. Launching Discord

- **From the application menu** – look for “Discord” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  discord
  ```

For alternative versions, use `discord-canary` or `discord-ptb`.

On first launch, Discord will open a login/register window. After logging in, you can join servers, start voice calls, or share your screen.

---

## 3. Updating Discord

Discord checks for updates automatically at startup. If an update is available, the client will download and install it inside its own directory. There is no need to update via pacman – the package already pulls the latest stable version.

However, to keep the package itself in sync (e.g., for dependency updates), run:

```bash
sudo pacman -Syu
```

---

## 4. Uninstalling Discord

```bash
sudo pacman -Rns discord
```

Remove local configuration and cache files (stored in `~/.config/discord/` and `~/.cache/discord/`):

```bash
rm -rf ~/.config/discord
rm -rf ~/.cache/discord
```

---

## 5. Troubleshooting

| Problem                                 | Solution                                                                                                                                                                                       |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `discord: command not found`            | Discord is not installed. Run `sudo pacman -S discord`.                                                                                                                                        |
| Discord does not start (no window)      | Launch from a terminal to see error messages. Missing dependencies? Install `sudo pacman -S libxss nss`.                                                                                       |
| “Update failed. Retry?”                 | Discord’s self‑updater may conflict with filesystem permissions. Delete `~/.config/discord/` and restart.                                                                                      |
| Screen sharing does not work on Wayland | Discord does not fully support Wayland screen sharing. Use X11 session, or install `xdg-desktop-portal` and launch Discord with `--enable-features=UseOzonePlatform --ozone-platform=wayland`. |
| No sound in voice calls                 | Check your **Input/Output devices** in Discord’s **Voice & Video** settings. Ensure `pulseaudio` or `pipewire` is running.                                                                     |
| High CPU usage / lag                    | Disable **Hardware Acceleration** in Discord’s **Advanced** settings.                                                                                                                          |
| Flatpak version clashes with native     | Remove the Flatpak version before installing the native package. Check `flatpak list` and `flatpak uninstall com.discordapp.Discord`.                                                          |

---

Your Discord client is now ready. Enjoy seamless communication with your communities, friends, and teammates on Arch Linux.
