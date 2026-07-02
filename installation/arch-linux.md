# Arch Linux Installation Guide

Note that this guide has been created through my own struggles and trial and error. So make sure to do your own research before proceeding blindly.

## Table of Contents

- [Arch Linux Installation Guide](#arch-linux-installation-guide)
	- [Table of Contents](#table-of-contents)
	- [Key Resources](#key-resources)
	- [Check Internet Connection](#check-internet-connection)
		- [Wired Connection](#wired-connection)
		- [Wireless Connection](#wireless-connection)
			- [Step 1: Check your wireless adapter status](#step-1-check-your-wireless-adapter-status)
			- [Step 2: Open `iwctl` (iNet Wireless Control Utility)](#step-2-open-iwctl-inet-wireless-control-utility)
			- [Step 3: Connect to a Wi-Fi network](#step-3-connect-to-a-wi-fi-network)
			- [Step 4: Exit `iwctl` and verify the connection](#step-4-exit-iwctl-and-verify-the-connection)
		- [Wireless Troubleshooting](#wireless-troubleshooting)
	- [Set System Time Zone](#set-system-time-zone)
		- [Set the Time Zone](#set-the-time-zone)
			- [Option 1: Set directly if you know your time zone](#option-1-set-directly-if-you-know-your-time-zone)
			- [Option 2: List all available time zones first](#option-2-list-all-available-time-zones-first)
		- [Verify the Configuration](#verify-the-configuration)
		- [Troubleshooting](#troubleshooting)
	- [Partition Management](#partition-management)
		- [Prerequisite: Check UEFI Mode](#prerequisite-check-uefi-mode)
		- [Identify Your Disk](#identify-your-disk)
		- [Create Partition Table and Partitions](#create-partition-table-and-partitions)
			- [1. Create a new GPT partition table](#1-create-a-new-gpt-partition-table)
			- [2. Create EFI Boot Partition (512MB)](#2-create-efi-boot-partition-512mb)
			- [3. Create Swap Partition](#3-create-swap-partition)
			- [4. Create Root Partition (remaining space)](#4-create-root-partition-remaining-space)
			- [5. Review and Write Changes](#5-review-and-write-changes)
		- [Format Partitions](#format-partitions)
			- [Format EFI Boot Partition](#format-efi-boot-partition)
			- [Format Swap Partition](#format-swap-partition)
			- [Format Root Partition with Btrfs](#format-root-partition-with-btrfs)
		- [Create Btrfs Subvolumes](#create-btrfs-subvolumes)
		- [Mount Subvolumes with Optimized Options](#mount-subvolumes-with-optimized-options)
		- [Mount Boot Partition](#mount-boot-partition)
		- [Verify Mounts](#verify-mounts)
		- [Optional: Enable TRIM for SSDs](#optional-enable-trim-for-ssds)
	- [Installing the Base System](#installing-the-base-system)
		- [Update the Keyring](#update-the-keyring)
		- [Choose Your Kernel](#choose-your-kernel)
		- [Generate fstab](#generate-fstab)
		- [Chroot into the New System](#chroot-into-the-new-system)
	- [System Configuration (Inside chroot)](#system-configuration-inside-chroot)
		- [Set Time Zone](#set-time-zone)
		- [Set System Locale](#set-system-locale)
		- [Configure Network](#configure-network)
		- [Set Root Password](#set-root-password)
	- [Install Essential Packages](#install-essential-packages)
		- [Package Summary](#package-summary)
	- [Configure Initramfs for Btrfs](#configure-initramfs-for-btrfs)
	- [Install and Configure GRUB](#install-and-configure-grub)
		- [Install GRUB for UEFI](#install-grub-for-uefi)
		- [Prepare GRUB Locale](#prepare-grub-locale)
		- [Generate GRUB Configuration](#generate-grub-configuration)
	- [Create a Standard User](#create-a-standard-user)
		- [Configure sudo](#configure-sudo)
	- [Enable Network Services](#enable-network-services)
	- [Finish Installation](#finish-installation)
		- [Reboot](#reboot)
	- [Conclusion](#conclusion)
		- [Next Steps](#next-steps)

## Key Resources

Here are some of the main sources that helped me put this guidance together:

- [Learn Linux TV - Full Installation Guide](https://www.youtube.com/watch?v=DPLnBPM4DhI&list=LL&index=1&t=893s)
- [Arch Wiki - Installation guide](https://wiki.archlinux.org/title/installation_guide)
- [Arch Wiki – Network configuration](https://wiki.archlinux.org/title/Network_configuration).
- [Arch Wiki - Btrfs](https://wiki.archlinux.org/title/btrfs)
- [Arch Linux Network Manager](https://linuxhint.com/arch_linux_network_manager/)
- [How to Set up Bluetooth in Arch Linux](https://www.jeremymorgan.com/tutorials/linux/how-to-bluetooth-arch-linux/)

## Check Internet Connection

Before proceeding, ensure you have a stable internet connection. This can be wired or wireless.

> **⚠️ Warning:** Do not proceed with the installation without a stable internet connection.

### Wired Connection

If you have a wired connection, it will likely be configured automatically. Verify connectivity with the `ping` command:

```bash
ping -c 5 archlinux.org
```

If the ping succeeds, proceed to [Set system time zone](#set-system-time-zone).

If it fails, either:

- You have a **wireless connection** (see below)
- Your **wired connection** has issues (troubleshoot hardware/cables or DHCP)

### Wireless Connection

#### Step 1: Check your wireless adapter status

```bash
ip addr show
```

This shows all network interfaces and their IP addresses. If your wireless interface is missing or not listed, follow the troubleshooting steps further below.

#### Step 2: Open `iwctl` (iNet Wireless Control Utility)

```bash
iwctl
```

Once inside `iwctl`, list available wireless devices:

```bash
device list
```

**Notes:**

- Write down the adapter name (e.g., `wlan0` or `wlp2s0`). You will need it for the next commands.
- If the device shows **powered off**, exit `iwctl` with `exit` and fix it using the [troubleshooting section](#wireless-troubleshooting) below before continuing.

#### Step 3: Connect to a Wi-Fi network

Replace `<adapter>` and `<network>` with your actual adapter name and Wi-Fi SSID.

```bash
# Scan for available networks
station <adapter> scan

# List available networks
station <adapter> get-networks

# Connect to your network
station <adapter> connect <network>
```

You will be prompted for the Wi-Fi password. After entering it, wait 20–30 seconds for the connection to stabilize.

#### Step 4: Exit `iwctl` and verify the connection

```bash
exit
```

Then verify:

```bash
# Check interface status and IP address
ip addr show

# Test internet connectivity
ping -c 5 archlinux.org
```

If the connection works, proceed to [Set system time zone](#set-system-time-zone).

### Wireless Troubleshooting

If your wireless adapter is **powered off** or not detected:

1. **Check system logs** for errors related to your adapter (replace `<adapter>` with the actual name, e.g., `wlan0`):

   ```bash
   journalctl | grep <adapter>
   ```

2. **Look for RF-kill issues**. If you see `Operation not possible due to RF-kill`, unblock all wireless devices:

   ```bash
   rfkill unblock all
   ```

3. **Re-enter `iwctl`** and check `device list` again. The adapter should now show **powered on**.

4. **Retry the connection steps** above.

> **💡 Tip:** If your Wi-Fi still doesn’t work after these steps, do not proceed with the installation. Consider using a wired connection temporarily or consult the [Arch Linux Wiki – Network configuration](https://wiki.archlinux.org/title/Network_configuration).

## Set System Time Zone

Before setting the time zone, enable automatic time synchronization using Network Time Protocol (NTP). This keeps your system clock accurate by syncing with internet time servers.

```bash
timedatectl set-ntp true
```

### Set the Time Zone

Choose your time zone from the [IANA Time Zone Database](https://www.iana.org/time-zones). Time zones follow the format `Region/City` (e.g., `Asia/Tokyo`, `America/New_York`, `Europe/London`).

#### Option 1: Set directly if you know your time zone

```bash
timedatectl set-timezone Asia/Tehran
```

Replace `Asia/Tehran` with your actual time zone.

#### Option 2: List all available time zones first

```bash
timedatectl list-timezones
```

> **💡 Tip:** Use `/` to search while browsing the list (e.g., type `/Tehran` to jump to Iran's time zone). Press `q` to exit the list.

Once you find the correct time zone, set it using the command in Option 1.

### Verify the Configuration

Check that both NTP and the time zone are set correctly:

```bash
timedatectl status
```

Look for:

- `System clock synchronized: yes`
- `NTP service: active`
- Your correct time zone under `Time zone`

### Troubleshooting

If `timedatectl set-ntp true` fails, ensure you have an active internet connection (see [Check Internet Connection](#check-internet-connection)). The NTP service requires network access to sync.

> **ℹ️ Note:** Time zone changes take effect immediately and persist after reboot. No additional configuration is needed.

Once verified, proceed to the next step.

## Partition Management

> **⚠️ Warning:** This section will **erase all data** on the target disk. Double-check your disk selection before writing changes.

### Prerequisite: Check UEFI Mode

This guide assumes **UEFI** boot mode. Verify you are in UEFI mode:

```bash
ls /sys/firmware/efi/efivars
```

If the command shows no error (directory exists), you are in UEFI mode. If you get "No such file or directory", you are in BIOS/Legacy mode – this guide does not cover that.

### Identify Your Disk

List all available disks:

```bash
fdisk -l
```

Identify your target disk (e.g., `/dev/sda`, `/dev/nvme0n1`, `/dev/vda`). **Note:** NVMe drives use partition suffixes like `p1` (e.g., `/dev/nvme0n1p1`). We'll use `/dev/sda` in examples – adapt accordingly.

### Create Partition Table and Partitions

Open the disk with `fdisk` (replace `/dev/sda` with your disk):

```bash
fdisk /dev/sda
```

#### 1. Create a new GPT partition table

Type `g` and press Enter. This erases all existing partitions.

#### 2. Create EFI Boot Partition (512MB)

| Step                 | Action                                                                           |
| -------------------- | -------------------------------------------------------------------------------- |
| Create new partition | Type `n` → Enter (default number) → Enter (default start) → type `+512M` → Enter |
| Set partition type   | Type `t` → Enter → type `1` (EFI System) → Enter                                 |

> **📝 Note:** Partition type `1` corresponds to EFI System. Type `L` to list all types.

#### 3. Create Swap Partition

Size depends on your RAM. A common rule: `2× RAM` for hibernation, or `4-8GB` otherwise. This example uses 8GB.

| Step                 | Action                                                        |
| -------------------- | ------------------------------------------------------------- |
| Create new partition | Type `n` → Enter → Enter (default start) → type `+8G` → Enter |
| Set partition type   | Type `t` → Enter → type `19` (Linux swap) → Enter             |

#### 4. Create Root Partition (remaining space)

| Step                          | Action                                                                 |
| ----------------------------- | ---------------------------------------------------------------------- |
| Create new partition          | Type `n` → Enter → Enter (default start) → Enter (use remaining space) |
| Set partition type (optional) | Type `t` → Enter → type `20` (Linux filesystem) → Enter                |

> **ℹ️ Note:** Type `20` (Linux filesystem) is the generic type. You can also use `23` (Linux root x86-64), but it's not required.

#### 5. Review and Write Changes

Type `p` to review your partition table. You should see three partitions: boot (EFI), swap, and root.

Type `w` to write changes and exit.

### Format Partitions

Now format each partition with the appropriate filesystem.

#### Format EFI Boot Partition

```bash
mkfs.fat -F32 /dev/sda1
```

#### Format Swap Partition

```bash
mkswap /dev/sda2
swapon /dev/sda2
```

#### Format Root Partition with Btrfs

```bash
mkfs.btrfs -n 32k /dev/sda3
```

- `-n 32k` sets the node size for metadata (good for SSDs)

> **💡 Tip:** For NVMe drives, use `/dev/nvme0n1p3` instead of `/dev/sda3`.

### Create Btrfs Subvolumes

Btrfs subvolumes allow flexible snapshots and rollbacks. Mount the root partition first:

```bash
mount /dev/sda3 /mnt
```

Create the subvolumes (using full command names for clarity):

```bash
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@var
btrfs subvolume create /mnt/@var/log
btrfs subvolume create /mnt/@opt
btrfs subvolume create /mnt/@tmp
btrfs subvolume create /mnt/@.snapshots
```

Now unmount:

```bash
umount /mnt
```

### Mount Subvolumes with Optimized Options

Mount the root subvolume (`@`) with compression and performance options:

```bash
mount -o noatime,commit=120,compress=zstd,subvol=@ /dev/sda3 /mnt
```

Create mount points:

```bash
mkdir -p /mnt/{boot,home,var,opt,tmp,.snapshots}
```

Mount the remaining subvolumes (consistent options for all except `/var` – no compression for `/var` to avoid log compression overhead):

```bash
mount -o noatime,commit=120,compress=zstd,subvol=@home /dev/sda3 /mnt/home
mount -o noatime,commit=120,compress=zstd,subvol=@opt /dev/sda3 /mnt/opt
mount -o noatime,commit=120,compress=zstd,subvol=@tmp /dev/sda3 /mnt/tmp
mount -o noatime,commit=120,compress=zstd,subvol=@.snapshots /dev/sda3 /mnt/.snapshots
mount -o noatime,commit=120,subvol=@var /dev/sda3 /mnt/var
```

> **📝 Explanation of mount options:**
>
> - `noatime` – Don't update file access times (improves performance)
> - `commit=120` – Flush data every 120 seconds (reduces writes)
> - `compress=zstd` – Zstandard compression (saves space, good performance)
> - `subvol=` – Specifies which Btrfs subvolume to mount

### Mount Boot Partition

```bash
mount /dev/sda1 /mnt/boot
```

### Verify Mounts

```bash
lsblk
```

You should see:

- `/dev/sda1` mounted at `/mnt/boot`
- `/dev/sda3` mounted at `/mnt` with subvolumes under it

### Optional: Enable TRIM for SSDs

If using an SSD, run this after chrooting into the new system (covered later):

```bash
systemctl enable fstrim.timer
```

This periodically trims unused blocks, extending SSD lifespan.

Proceed to the next section once all partitions are mounted correctly.

## Installing the Base System

### Update the Keyring

Before installing, update the Arch Linux keyring to avoid package signature errors:

```bash
pacman -Sy archlinux-keyring
```

### Choose Your Kernel

This guide uses the **stable Linux kernel** (`linux`) plus LTS as a fallback. If you prefer only one kernel, remove the other from the command below.

| CPU Type  | Command                                                                          |
| --------- | -------------------------------------------------------------------------------- |
| **Intel** | `pacstrap /mnt base linux linux-lts linux-firmware intel-ucode btrfs-progs nano` |
| **AMD**   | `pacstrap /mnt base linux linux-lts linux-firmware amd-ucode btrfs-progs nano`   |
| **VM**    | `pacstrap /mnt base linux linux-lts linux-firmware btrfs-progs nano`             |

> **💡 Tip:** For a minimal system, drop `linux-lts`. For a single-kernel setup, use just `linux`. The LTS kernel is useful as a backup but adds ~300MB and longer initramfs generation.

Run the appropriate command for your system.

### Generate fstab

The fstab file tells the system which partitions to mount at boot. Generate it using UUIDs (unique identifiers that persist across reboots):

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

Verify the generated file:

```bash
cat /mnt/etc/fstab
```

You should see entries for `/dev/sda1` (boot), `/dev/sda3` (root), and swap. If any are missing, review your mounts.

### Chroot into the New System

Now enter the newly installed environment:

```bash
arch-chroot /mnt
```

From this point, all commands run inside your new Arch installation.

---

## System Configuration (Inside chroot)

### Set Time Zone

Replace `Asia/Tehran` with your actual time zone. List all zones with `ls /usr/share/zoneinfo/`.

```bash
ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime
hwclock --systohc
```

### Set System Locale

Edit the locale configuration file:

```bash
nano /etc/locale.gen
```

Uncomment `en_US.UTF-8 UTF-8` (and any other locales you need). Then generate and set the system locale:

```bash
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
```

> **📝 Note:** Avoid editing `/etc/locale.conf` with `>>` repeatedly if you run this command multiple times. For a one-time install, it's fine.

### Configure Network

Set your hostname (replace `archlinux` with your chosen name):

```bash
echo "archlinux" > /etc/hostname
```

Edit the hosts file:

```bash
nano /etc/hosts
```

Add the following lines:

```plaintext
127.0.0.1   localhost
::1         localhost
127.0.1.1   archlinux.localdomain archlinux
```

> **⚠️ Note:** The third line uses your hostname. Do not include colons or special characters.

### Set Root Password

```bash
passwd
```

Choose a strong password.

---

## Install Essential Packages

Install the bootloader, network manager, development tools, and utilities:

```bash
pacman -S grub grub-btrfs efibootmgr base-devel linux-headers networkmanager \
wpa_supplicant mtools dosfstools reflector
```

### Package Summary

| Package                 | Purpose                                        |
| ----------------------- | ---------------------------------------------- |
| `grub` + `grub-btrfs`   | Bootloader with Btrfs snapshot support         |
| `efibootmgr`            | UEFI boot entry management                     |
| `base-devel`            | Build tools (gcc, make, etc.) for AUR packages |
| `linux-headers`         | Kernel headers for building modules            |
| `networkmanager`        | Network management (supports Wi-Fi, Ethernet)  |
| `wpa_supplicant`        | Wi-Fi authentication                           |
| `mtools` + `dosfstools` | FAT filesystem utilities (for EFI)             |
| `reflector`             | Mirror list optimization                       |

> **📦 Optional packages (not installed by default):**
>
> - `network-manager-applet` – GUI tray icon (for desktop environments)
> - `os-prober` – Detect other OSes (enable with `GRUB_DISABLE_OS_PROBER=false`)
> - `xdg-utils` / `xdg-user-dirs` – Desktop integration
> - `modemmanager` – Mobile broadband
> - `netctl` / `wireless_tools` – Legacy network tools (not needed with NetworkManager)

---

## Configure Initramfs for Btrfs

Edit the mkinitcpio configuration:

```bash
nano /etc/mkinitcpio.conf
```

Find the `MODULES=` line and add `btrfs` inside the parentheses:

```plaintext
MODULES=(btrfs)
```

Save and exit (`Ctrl+O`, `Enter`, `Ctrl+X`). Then regenerate the initramfs for each installed kernel:

```bash
mkinitcpio -p linux
```

If you installed `linux-lts`, also run:

```bash
mkinitcpio -p linux-lts
```

---

## Install and Configure GRUB

### Install GRUB for UEFI

```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch
```

### Prepare GRUB Locale

```bash
mkdir -p /boot/grub/locale
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
```

### Generate GRUB Configuration

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

> **🔧 Dual-booting?** To detect other operating systems, uncomment or add `GRUB_DISABLE_OS_PROBER=false` in `/etc/default/grub`, install `os-prober`, then rerun `grub-mkconfig`.

---

## Create a Standard User

Replace `<username>` with your desired username:

```bash
useradd -m -g users -G wheel <username>
passwd <username>
```

**Flag explanations:**

- `-m` – Creates home directory (`/home/username`)
- `-g users` – Sets primary group to `users`
- `-G wheel` – Adds user to `wheel` group (sudo privileges)

### Configure sudo

Install sudo if not already present:

```bash
pacman -S sudo
```

Edit sudoers safely:

```bash
EDITOR=nano visudo
```

Find and **uncomment** this line:

```plaintext
%wheel ALL=(ALL:ALL) ALL
```

Save and exit.

---

## Enable Network Services

```bash
systemctl enable NetworkManager.service
systemctl enable wpa_supplicant.service   # Required for Wi-Fi
```

> **ℹ️ Note:** `dhcpcd` is not enabled by default on Arch, so no need to disable it. NetworkManager handles both wired and wireless connections.

---

## Finish Installation

Exit the chroot environment:

```bash
exit
```

Unmount all partitions:

```bash
umount -R /mnt
```

> **⚠️ Warning:** If you get "target is busy", close any terminal sessions using `/mnt` or use `umount -l /mnt` as a last resort.

### Reboot

**For a physical machine:**

```bash
reboot
```

**For a virtual machine:** Remove the installation ISO first, then reboot.

---

## Conclusion

You now have a minimal, functional Arch Linux installation with:

- Btrfs filesystem with subvolumes
- GRUB bootloader with UEFI support
- NetworkManager for easy network management
- A standard user with sudo access

### Next Steps

Arch Linux is intentionally minimal. You will likely want to:

- Install a **desktop environment** (GNOME, KDE, XFCE, etc.)
- Set up **audio** (PipeWire or PulseAudio)
- Configure **firewall** (ufw or iptables)
- Install **graphics drivers** (NVIDIA/AMD/Intel)

**Useful resources:**

- [Arch Wiki – General Recommendations](https://wiki.archlinux.org/title/General_recommendations)
- [Arch Wiki – Desktop Environment](https://wiki.archlinux.org/title/Desktop_environment)
- [Arch Linux Forums](https://bbs.archlinux.org/)
- [r/archlinux](https://www.reddit.com/r/archlinux/)
- [Our Post-Installation Guide](./arch-post-install.md)

Happy Arching!
