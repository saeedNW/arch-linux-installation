# MechSim – Mechanical Keyboard Sound Simulator

MechSim is a command‑line tool that plays mechanical keyboard click sounds as you type. It simulates various switch types (Crystal Purple, Holy Panda, Cherry MX, etc.) and can be toggled on/off easily. This guide covers installation, configuration, a custom toggle script with dynamic volume, and keyboard shortcuts.

> **ℹ️ Note:** MechSim requires root privileges to read keyboard input. The guide includes a secure way to allow passwordless `sudo` **only** for this command.

---

## Table of Contents

- [MechSim – Mechanical Keyboard Sound Simulator](#mechsim--mechanical-keyboard-sound-simulator)
  - [Table of Contents](#table-of-contents)
  - [1. Features Overview](#1-features-overview)
  - [2. Installation](#2-installation)
  - [3. Allow Passwordless sudo for MechSim](#3-allow-passwordless-sudo-for-mechsim)
  - [4. The Toggle Script (Dynamic Volume \& Status)](#4-the-toggle-script-dynamic-volume--status)
    - [4.1. Script Features](#41-script-features)
    - [4.2. Create the Script](#42-create-the-script)
    - [4.3. Make the Script Executable](#43-make-the-script-executable)
  - [5. Add Shell Aliases](#5-add-shell-aliases)
  - [6. Test Everything](#6-test-everything)
  - [7. (Optional) Bind to a Keyboard Shortcut](#7-optional-bind-to-a-keyboard-shortcut)
    - [GNOME](#gnome)
    - [KDE Plasma](#kde-plasma)
    - [i3 / Sway](#i3--sway)
  - [8. Changing the Soundpack](#8-changing-the-soundpack)
  - [9. Troubleshooting](#9-troubleshooting)
  - [10. Quick Command Reference](#10-quick-command-reference)

---

## 1. Features Overview

| Feature                     | Description                                                    |
| --------------------------- | -------------------------------------------------------------- |
| **Real‑time typing sounds** | Plays mechanical switch clicks as you press keys.              |
| **Multiple soundpacks**     | Choose from Crystal Purple, Holy Panda, Cherry MX, Topre, etc. |
| **Toggle on/off**           | Start / stop with a single command or shortcut.                |
| **Dynamic volume**          | Set volume from 0 to 100% (persists between sessions).         |
| **Status check**            | See if MechSim is running and at what volume.                  |
| **Force stop**              | Emergency kill if needed.                                      |
| **Low overhead**            | Runs in the background, minimal CPU usage.                     |

---

## 2. Installation

Install `mechsim` from the AUR using your preferred helper. This guide uses `yay`:

```bash
yay -S mechsim
```

Alternatively, build manually:

```bash
git clone https://aur.archlinux.org/mechsim.git
cd mechsim
makepkg -si
```

> **💡 Tip:** After installation, the command `mechsim` will be available system‑wide.

---

## 3. Allow Passwordless sudo for MechSim

MechSim needs root privileges to read keyboard input. To avoid typing your password every time, add a sudoers rule **only for this command**.

```bash
sudo visudo
```

Add the following line at the end (replace `your_username` with your actual username):

```plaintext
your_username ALL=(ALL) NOPASSWD: /usr/bin/mechsim
```

Save and exit. Verify:

```bash
sudo mechsim -V 1 -s eg-crystal-purple & sleep 1 && sudo pkill mechsim
```

> **✅ Expected result:** No password prompt.
>
> **⚠️ Security note:** This limits passwordless access to `mechsim` only – not to any other command.

---

## 4. The Toggle Script (Dynamic Volume & Status)

Instead of typing raw `sudo mechsim` commands, we use a Bash script that adds:

- Toggle logic (start if stopped, stop if running)
- Volume persistence
- Status check
- Soundpack selection

### 4.1. Script Features

| Feature                | How it works                                         |
| ---------------------- | ---------------------------------------------------- |
| **Toggle on/off**      | Kills MechSim if running; starts it if stopped.      |
| **Volume argument**    | `tms 50` sets volume to 50% and toggles.             |
| **Volume persistence** | Saves last used volume in `~/.cache/mechsim_volume`. |
| **Status check**       | `tms --status` shows if MechSim is running.          |
| **List soundpacks**    | `tms --list` shows available switch types.           |
| **Help**               | `tms --help` prints usage.                           |
| **Force stop**         | Alias `tmsoff` kills MechSim immediately.            |

> **📁 The script is available here:** [`toggle_mechsim.sh`](../../../assets/scripts/toggle_mechsim.sh)

### 4.2. Create the Script

Create a directory for custom scripts:

```bash
mkdir -p ~/.cscripts
```

Then create the script file:

```bash
nano ~/.cscripts/toggle_mechsim.sh
```

Copy the content from the linked file (or paste the full script from the original guide). Save and exit.

### 4.3. Make the Script Executable

```bash
chmod +x ~/.cscripts/toggle_mechsim.sh
```

---

## 5. Add Shell Aliases

Add convenient aliases to your shell configuration file (`~/.bashrc` for Bash, `~/.zshrc` for Zsh):

```bash
nano ~/.bashrc   # or ~/.zshrc
```

Append:

```bash
# MechSim aliases
alias tms='~/.cscripts/toggle_mechsim.sh'                     # Toggle with last volume
alias tmsstat='~/.cscripts/toggle_mechsim.sh --status'        # Check status
alias tmsoff='sudo pkill mechsim && echo "🔇 MechSim killed"' # Force stop
```

Reload:

```bash
source ~/.bashrc   # or source ~/.zshrc
```

---

## 6. Test Everything

```bash
# Check status (should be stopped)
tmsstat

# Start MechSim with default volume (100%)
tms

# Type some keys – you should hear clicks!

# Stop MechSim
tms

# Start with 50% volume
tms 50

# Check status again
tmsstat

# Force stop if needed
tmsoff
```

---

## 7. (Optional) Bind to a Keyboard Shortcut

### GNOME

Replace `your_username` and adjust the shortcut (e.g., `Super+T`):

```bash
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/mechsim/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/mechsim/ name 'MechSim Toggle'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/mechsim/ command '/home/your_username/.cscripts/toggle_mechsim.sh'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/mechsim/ binding '<Super>t'
```

### KDE Plasma

1. Open **System Settings** → **Shortcuts** → **Custom Shortcuts**.
2. Click **Edit** → **New** → **Global Shortcut** → **Command/URL**.
3. Name: `MechSim Toggle`.
4. Trigger: choose your key combination (e.g., `Meta+T`).
5. Action: Command/URL: `/home/your_username/.cscripts/toggle_mechsim.sh`.

### i3 / Sway

Add to `~/.config/i3/config` or `~/.config/sway/config`:

```plaintext
bindsym $mod+t exec /home/your_username/.cscripts/toggle_mechsim.sh
```

Reload the configuration (`Mod+Shift+R` in i3, `Mod+Shift+C` then `Mod+Shift+R` in Sway).

---

## 8. Changing the Soundpack

Edit the script:

```bash
nano ~/.cscripts/toggle_mechsim.sh
```

Find the line:

```bash
SOUNDPACK="eg-crystal-purple"
```

Replace with any soundpack from the list (run `tms --list` to see them). Example:

```bash
SOUNDPACK="eg-holy-panda"
```

Save and restart MechSim (`tms` to stop, then `tms` again).

---

## 9. Troubleshooting

| Problem                                  | Solution                                                                                                                                                                                                       |
| ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **No sound / PulseAudio errors**         | The script already includes environment variables. Ensure `pipewire-pulse` or `pulseaudio` is running: `systemctl --user status pipewire-pulse`. Restart if needed: `systemctl --user restart pipewire-pulse`. |
| **MechSim starts but no keyboard input** | Test passwordless sudo: `sudo mechsim -V 50 -s eg-crystal-purple`. If that works but script fails, run script manually to see errors.                                                                          |
| **Volume not remembered**                | The volume is saved in `~/.cache/mechsim_volume`. Check if that file exists. If not, set a volume explicitly: `tms 75`.                                                                                        |
| **`sudo: a password is required`**       | The sudoers rule may not be applied. Run `sudo visudo` again and verify the line is exactly `your_username ALL=(ALL) NOPASSWD: /usr/bin/mechsim`.                                                              |
| **Script does nothing**                  | Make sure the script is executable (`chmod +x`). Run it with `bash -x ~/.cscripts/toggle_mechsim.sh` for debugging.                                                                                            |
| **Multiple soundpacks not found**        | Ensure the soundpack name matches exactly (case‑sensitive). Use `tms --list` to see available names.                                                                                                           |

---

## 10. Quick Command Reference

| Command      | Action                                 |
| ------------ | -------------------------------------- |
| `tms`        | Toggle on/off (remembers last volume). |
| `tms 50`     | Set volume to 50% and toggle.          |
| `tmsstat`    | Check if MechSim is running.           |
| `tmsoff`     | Force stop MechSim (kill).             |
| `tms --list` | Show available soundpacks.             |
| `tms --help` | Show help.                             |

---

Your typing experience can now sound like a high‑end mechanical keyboard – even on a laptop. Enjoy the clicks! 🎹
