# Rclone – Cloud Storage Manager

Rclone is a command‑line program to manage files on cloud storage services (Google Drive, Dropbox, Amazon S3, Backblaze B2, and over 40 others) as well as remote servers (SFTP, HTTP, WebDAV). It includes sync, copy, move, mount, and encryption features. It is available in the official Arch Linux repositories, so no AUR helper is required.

> **ℹ️ Note:** Rclone is also available for Linux, macOS, Windows, and BSD. This guide focuses on Arch Linux.

---

## Table of Contents

- [Rclone – Cloud Storage Manager](#rclone--cloud-storage-manager)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Basic Configuration](#2-basic-configuration)
  - [3. Common Commands](#3-common-commands)
  - [4. Mounting a Remote as a Filesystem](#4-mounting-a-remote-as-a-filesystem)
  - [5. Automating with systemd (Optional)](#5-automating-with-systemd-optional)
  - [6. Updating Rclone](#6-updating-rclone)
  - [7. Uninstalling Rclone](#7-uninstalling-rclone)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S rclone
```

This installs the latest stable version from the official repositories.

> **💡 Tip:** For the very latest development version, you can install `rclone-git` from the AUR, but the stable repo version is recommended.

---

## 2. Basic Configuration

Rclone needs to know which cloud storage services you want to use. Run the configuration wizard:

```bash
rclone config
```

This will guide you through:

- Creating a **new remote** (choose from a list of providers)
- Entering authentication credentials (OAuth, API keys, etc.)
- Setting advanced options (e.g., custom endpoints, encryption, chunk size)

**Example for Google Drive:**

1. Select `drive` as the type.
2. Follow the prompts – a browser window will open for authentication (or you can use a headless auth code).
3. Give the remote a name (e.g., `mydrive`).

After configuration, you can list your remotes:

```bash
rclone listremotes
```

---

## 3. Common Commands

| Operation                                 | Command                                |
| ----------------------------------------- | -------------------------------------- |
| **List files**                            | `rclone ls remote:path`                |
| **Copy a file**                           | `rclone copy /local/file remote:path/` |
| **Sync (make remote identical to local)** | `rclone sync /local/dir remote:path/`  |
| **Move a file**                           | `rclone move /local/file remote:path/` |
| **Delete a file**                         | `rclone delete remote:path/file`       |
| **Create a directory**                    | `rclone mkdir remote:path/newdir`      |
| **Show disk usage**                       | `rclone size remote:path`              |
| **Interactive ncdu interface**            | `rclone ncdu remote:path`              |

**Example** – copy a directory to Google Drive:

```bash
rclone copy /home/user/Documents mydrive:Backup/Documents -v
```

> **💡 Tip:** Use `--dry-run` to test a command without actually moving data.

---

## 4. Mounting a Remote as a Filesystem

Rclone can mount a cloud storage remote as a local directory using FUSE.

**Install FUSE (if not already present):**

```bash
sudo pacman -S fuse2
```

**Create a mount point:**

```bash
mkdir ~/gdrive
```

**Mount the remote:**

```bash
rclone mount mydrive: ~/gdrive --daemon
```

Now you can access the remote files as if they were local.

**Options for better performance:**

```bash
rclone mount mydrive: ~/gdrive --daemon --vfs-cache-mode writes
```

To unmount:

```bash
fusermount -u ~/gdrive
```

> **⚠️ Note:** Mounting may consume network bandwidth and can be slower than local storage. Use `--vfs-cache-mode` to reduce API calls.

---

## 5. Automating with systemd (Optional)

You can create a systemd service to automatically mount a remote at boot.

**Create the service file:**

```bash
sudo nano /etc/systemd/system/rclone-mount@.service
```

**Add the following:**

```ini
[Unit]
Description=Rclone mount for %i
After=network-online.target

[Service]
Type=simple
User=%i
ExecStart=/usr/bin/rclone mount remote: /home/%i/mnt --vfs-cache-mode writes
ExecStop=/usr/bin/fusermount -u /home/%i/mnt
Restart=on-abort

[Install]
WantedBy=multi-user.target
```

Replace `remote:` and `/home/%i/mnt` with your remote name and mount point.

**Enable and start for your user:**

```bash
sudo systemctl enable rclone-mount@yourusername.service
sudo systemctl start rclone-mount@yourusername.service
```

---

## 6. Updating Rclone

```bash
sudo pacman -Syu
```

Rclone will be updated along with other packages.

---

## 7. Uninstalling Rclone

```bash
sudo pacman -Rns rclone
```

Remove configuration files (stored in `~/.config/rclone/`):

```bash
rm -rf ~/.config/rclone
```

---

## 8. Troubleshooting

| Problem                                              | Solution                                                                                                                                    |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `rclone: command not found`                          | Rclone not installed. Run `sudo pacman -S rclone`.                                                                                          |
| Authentication fails (Google Drive, etc.)            | Ensure you allowed the application in your cloud account’s API console. Run `rclone config` again and choose “auto config” for a new token. |
| Mount fails with “fusermount: fuse device not found” | Load the `fuse` kernel module: `sudo modprobe fuse`. Add `fuse` to `/etc/modules-load.d/fuse.conf`.                                         |
| “Failed to create file system”                       | Check that the remote name and path are correct (`rclone listremotes`).                                                                     |
| Slow transfers                                       | Use `--transfers 16` to increase parallel uploads. For large files, adjust `--chunk-size`.                                                  |
| Permission errors when mounting                      | Mount as your own user. Do not use `sudo`. Ensure the mount directory is writable by you.                                                   |
| “Rate limit exceeded” (Google Drive)                 | Reduce the transfer speed with `--bwlimit 10M` or wait a few minutes.                                                                       |

---

Your Rclone installation is now ready to manage cloud storage files from the command line – copying, syncing, mounting, and automating with ease. Enjoy the flexibility of a unified interface to dozens of storage providers!
