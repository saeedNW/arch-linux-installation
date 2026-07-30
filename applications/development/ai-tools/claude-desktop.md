# Claude Desktop – AI Desktop App

Claude Desktop is the official Anthropic desktop application for Linux. It provides access to Claude Chat, Cowork, and Claude Code through a graphical interface.

> **ℹ️ Note:** This guide assumes you are using **Arch Linux** or an Arch‑based distribution. Package manager commands (`yay`) are specific to Arch.

---

## Table of Contents

- [Claude Desktop – AI Desktop App](#claude-desktop--ai-desktop-app)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Claude Desktop](#2-launching-claude-desktop)
  - [3. Cowork (VM Feature)](#3-cowork-vm-feature)
  - [4. Updating Claude Desktop](#4-updating-claude-desktop)
  - [5. Uninstalling Claude Desktop](#5-uninstalling-claude-desktop)
  - [6. Troubleshooting](#6-troubleshooting)

---

## 1. Installation

Install `claude-desktop` from the AUR using `yay` (or your preferred AUR helper):

```bash
yay -S claude-desktop
```

This repackages Anthropic's official `.deb` for Arch Linux, including fixes for Cowork (virtiofsd and OVMF firmware symlinks).

> **⚠️ Note:** If you previously applied manual Cowork symlinks, remove them before installing to avoid file conflicts with pacman.

---

## 2. Launching Claude Desktop

After installation, launch Claude Desktop:

- **From the application menu** – search for "Claude"
- **From the terminal** – run:

  ```bash
  claude-desktop
  ```

On first launch, sign in with your Anthropic account through the app's authentication flow.

---

## 3. Cowork (VM Feature)

Claude Desktop includes **Cowork**, a virtual machine feature for collaborative coding sessions.

- First Cowork use downloads a ~1.3 GB VM image, which expands to roughly **12 GB** on disk under `~/.config/Claude/vm_bundles/`.
- Ensure your user has access to `/dev/kvm`. Some setups require adding the user to the `kvm` group:

  ```bash
  sudo usermod -aG kvm $USER
  ```

> **💡 Tip:** If the VM fails to start, verify your user is in the `kvm` group and restart your session.

---

## 4. Updating Claude Desktop

Claude Desktop updates are handled by pacman, not by an in-app updater. To update:

```bash
yay -Syu
```

The AUR package is bumped by the maintainer when a new upstream release is available.

---

## 5. Uninstalling Claude Desktop

```bash
yay -Rns claude-desktop
```

Remove local configuration, cache, and Cowork VM bundles:

```bash
rm -rf ~/.config/Claude
rm -rf ~/.cache/Claude
```

---

## 6. Troubleshooting

| Problem                                     | Solution                                                                                                                                                                                                                                 |
| ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| File conflicts with old Cowork symlinks     | Remove handmade symlinks at `/usr/bin/virtiofsd` and `/usr/share/edk2/OVMF_{CODE,VARS}_4M.fd` before installing.                                                                                                                         |
| VM fails to start                           | Ensure your user is in the `kvm` group and has access to `/dev/kvm`.                                                                                                                                                                     |
| Sign-in lost when switching DEs             | On tiling WMs (Hyprland, Sway), copy the `.desktop` file to `~/.local/share/applications/`, add `--password-store=kwallet6` (or `gnome-libsecret`) to the `Exec=` lines, then run `update-desktop-database ~/.local/share/applications`. |
| CachyOS package shadowing                   | Install explicitly with `paru -S aur/claude-desktop` to avoid the older distro package.                                                                                                                                                  |
| paru suggests qemu-system-aarch64 on x86_64 | This is a known paru bug (#1497). The packages are inert and safe to decline or remove after build.                                                                                                                                      |

---

Your Claude Desktop app is now ready. Enjoy Claude Chat, Cowork, and Claude Code on Arch Linux.
