# Setting Up Timeshift for System Snapshots

Timeshift is a powerful tool for creating system snapshots on Linux, allowing you to easily restore your system to a previous state. It works best with **Btrfs** filesystems, leveraging its subvolume and snapshot features. This guide assumes you have a Btrfs root partition with subvolumes (e.g., `@`, `@home`, etc.) – as set up in the [Arch Linux installation guide](../../../01-installation/arch-linux.md/#partition-management) or the EndeavourOS KDE/GNOME guides.

> **⚠️ Important:** Timeshift is designed for system files only (excluding `/home` by default). It is **not** a backup tool for user data – use something like `rsync`, `restic`, or `borg` for that.

---

## Table of Contents

- [Setting Up Timeshift for System Snapshots](#setting-up-timeshift-for-system-snapshots)
  - [Table of Contents](#table-of-contents)
  - [1. Prerequisites](#1-prerequisites)
  - [2. Installation](#2-installation)
  - [3. Enable Cronie (for Scheduled Snapshots)](#3-enable-cronie-for-scheduled-snapshots)
  - [4. Configure Timeshift](#4-configure-timeshift)
    - [Option A: Using the Graphical Interface (Recommended)](#option-a-using-the-graphical-interface-recommended)
    - [Option B: Using the Command Line](#option-b-using-the-command-line)
  - [5. Create Your First Snapshot](#5-create-your-first-snapshot)
  - [6. Automatic Snapshots Before System Updates](#6-automatic-snapshots-before-system-updates)
  - [7. Boot from Snapshots with GRUB](#7-boot-from-snapshots-with-grub)
  - [8. Managing Snapshots](#8-managing-snapshots)
  - [9. Uninstalling / Cleanup](#9-uninstalling--cleanup)
  - [10. Troubleshooting](#10-troubleshooting)

---

## 1. Prerequisites

- **Btrfs filesystem** on your root partition (e.g., `/dev/sda3` mounted at `/`).
- **Subvolume layout** – Timeshift expects subvolumes named `@` for root and `@home` for home (others like `@var`, `@opt` are fine). The [Arch installation guide](../../../01-installation/arch-linux.md) creates exactly these.
- **GRUB bootloader** if you want to boot into snapshots (see Section 7).

> **💡 Tip:** Timeshift can also work with `rsync` mode (on ext4), but Btrfs is far more efficient and the recommended method.

---

## 2. Installation

Timeshift is available in the official `extra` repository – **no AUR helper is required**.

```bash
sudo pacman -S timeshift
```

For additional features (automatic pre‑update snapshots and GRUB integration), install:

```bash
sudo pacman -S grub-btrfs
yay -S timeshift-autosnap   # AUR; automatically creates snapshot before pacman transactions
```

> **ℹ️ Note:** `timeshift-autosnap` is an AUR package that adds a Pacman hook. It creates a snapshot just before any package upgrade or removal.

---

## 3. Enable Cronie (for Scheduled Snapshots)

Timeshift uses `cronie` to run scheduled snapshots (hourly, daily, weekly, monthly). Enable and start the cron daemon:

```bash
sudo systemctl enable --now cronie.service
```

> **💡 Tip:** If you prefer systemd timers, Timeshift also supports them – but `cronie` is simpler and works out of the box.

---

## 4. Configure Timeshift

You can configure Timeshift either through its graphical interface (easier) or via the command line.

### Option A: Using the Graphical Interface (Recommended)

Launch Timeshift from your application menu or run:

```bash
timeshift-gtk
```

Follow the wizard:

1. **Select Snapshot Type** – choose **Btrfs**.
2. **Select Snapshot Location** – pick your Btrfs root partition (e.g., `/dev/sda3`). Timeshift will automatically detect the `@` subvolume.
3. **Configure Schedule** – enable the desired frequencies (e.g., daily, weekly). You can also set retention limits (e.g., keep 5 daily, 3 weekly).
4. **Select Users** – Usually you can skip this; Timeshift excludes `/home` by default for system snapshots.
5. **Finish** – The wizard will create a first snapshot (recommended).

### Option B: Using the Command Line

Create a configuration file (or use the default). Example commands:

```bash
# Set the snapshot device and subvolume
sudo timeshift --config
# Then follow interactive prompts (similar to the GUI)
```

A minimal configuration can also be written manually to `/etc/timeshift/timeshift.json` – but the GUI or interactive CLI is simpler.

---

## 5. Create Your First Snapshot

After configuration, create an initial snapshot (tagged as “first”):

```bash
sudo timeshift --create --comments "Fresh install after setup"
```

You can list all snapshots:

```bash
sudo timeshift --list
```

---

## 6. Automatic Snapshots Before System Updates

`timeshift-autosnap` hooks into `pacman`. When you run `sudo pacman -Syu` (or any transaction), it automatically creates a snapshot **before** the operation begins. This ensures you can always roll back if an update breaks something.

**Installation (AUR):**

```bash
yay -S timeshift-autosnap
```

> **⚠️ Note:** This package adds a hook in `/etc/pacman.d/hooks/`. It requires `timeshift` to be already installed. If you ever remove `timeshift-autosnap`, remember to also delete the hook file manually.

After installation, test it by running a dummy pacman command (e.g., `sudo pacman -S --needed htop`). You should see a message that a snapshot is being created.

---

## 7. Boot from Snapshots with GRUB

`grub-btrfs` adds entries for every Btrfs snapshot to the GRUB boot menu, allowing you to boot directly into a previous system state.

**Installation:**

```bash
sudo pacman -S grub-btrfs
```

**Regenerate GRUB configuration:**

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

**Enable the `grub-btrfsd` daemon** (automatically updates the GRUB menu when snapshots are created/deleted):

```bash
sudo systemctl enable --now grub-btrfsd
```

> **💡 Tip:** The daemon watches the snapshot directory and regenerates GRUB entries on the fly. It uses `inotify` and must be restarted after major GRUB updates (usually done automatically by pacman hooks).

---

## 8. Managing Snapshots

| Task                                                | Command                                            |
| --------------------------------------------------- | -------------------------------------------------- |
| List snapshots                                      | `sudo timeshift --list`                            |
| Create a snapshot                                   | `sudo timeshift --create --comments "description"` |
| Restore a snapshot (from within the running system) | `sudo timeshift --restore` (choose from list)      |
| Delete a snapshot                                   | `sudo timeshift --delete --snapshot 'name'`        |
| Schedule snapshots                                  | Use the GUI or configure crontab entries manually  |

To restore from a **booted snapshot** (e.g., when your system won’t boot), simply reboot, select the snapshot from GRUB, then once booted you can run `sudo timeshift --restore` to make that snapshot permanent (or use the snapshot as your new system).

---

## 9. Uninstalling / Cleanup

```bash
sudo systemctl stop grub-btrfsd
sudo systemctl disable grub-btrfsd
sudo pacman -Rsn timeshift grub-btrfs
yay -Rsn timeshift-autosnap   # if installed
```

Remove snapshot data (be careful – this deletes all snapshots):

```bash
sudo rm -rf /run/timeshift
sudo rm -rf /etc/timeshift
sudo btrfs subvolume list / | grep timeshift | awk '{print $9}' | xargs -I {} sudo btrfs subvolume delete "/{}"
```

---

## 10. Troubleshooting

| Problem                                                    | Solution                                                                                                                                                                                         |
| ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Timeshift only shows “RSYNC” mode, not “BTRFS”             | Your root filesystem is not Btrfs, or the `@` subvolume is not correctly mounted. Verify with `mount \| grep /dev`.                                                                              |
| `timeshift --create` fails with “Device not found”         | Ensure you have configured the correct snapshot device (run `sudo timeshift --config`).                                                                                                          |
| `grub-mkconfig` does not show snapshots                    | Check that `grub-btrfs` is installed and the snapshots are stored under `/timeshift-btrfs/` (the default location). Run `sudo grub-btrfs --snapshot-list` to debug.                              |
| `grub-btrfsd` fails to start                               | Ensure `inotify-tools` is installed: `sudo pacman -S inotify-tools`. Also check permissions on `/etc/grub.d/41_snapshots-btrfs`.                                                                 |
| `timeshift-autosnap` does nothing after pacman command     | Verify the hook file exists: `/etc/pacman.d/hooks/timeshift-autosnap.hook`. Reinstall `timeshift-autosnap`.                                                                                      |
| Disk space filled with snapshots                           | Delete old snapshots (`sudo timeshift --delete`). Adjust retention policy in the configuration (e.g., keep only last 5 daily snapshots).                                                         |
| Booting into snapshot fails with “cannot find root device” | The snapshot may lack the correct kernel parameters. Ensure your GRUB entry uses the same root flags (e.g., `rootflags=subvol=@timeshift/...`). Usually `grub-btrfs` handles this automatically. |

---

Your system is now protected by Timeshift snapshots. In case of a failed update or misconfiguration, simply reboot into a previous snapshot and restore. Enjoy the safety net!
