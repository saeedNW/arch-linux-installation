# EndeavourOS GNOME Installation Guide

> **📝 Note:** This guide has been created through my own struggles and trial and error. So make sure to do your own research before proceeding blindly.

Welcome to the EndeavourOS GNOME Installation Guide! In this guide, you'll learn how to install **EndeavourOS**, a user-friendly Arch-based Linux distribution designed for both new and experienced users.

EndeavourOS provides a **rolling-release model**, giving you access to the latest software updates and features – just like Arch Linux, but with a streamlined installer and helpful welcome tools.

---

## Table of Contents

- [EndeavourOS GNOME Installation Guide](#endeavouros-gnome-installation-guide)
  - [Table of Contents](#table-of-contents)
  - [How This Guide Differs from Arch Linux](#how-this-guide-differs-from-arch-linux)
  - [Key Resources](#key-resources)
  - [What This Guide Covers](#what-this-guide-covers)
  - [Prerequisites \& System Requirements](#prerequisites--system-requirements)
    - [Hardware Requirements](#hardware-requirements)
    - [You Will Also Need](#you-will-also-need)
    - [What EndeavourOS Includes (Pre-installed)](#what-endeavouros-includes-pre-installed)
  - [Downloading EndeavourOS](#downloading-endeavouros)
    - [Step 1: Download the ISO](#step-1-download-the-iso)
    - [Step 2: Choose Download Method](#step-2-choose-download-method)
    - [Step 3: Verify the ISO (Recommended)](#step-3-verify-the-iso-recommended)
      - [Method A: SHA512 Checksum](#method-a-sha512-checksum)
      - [Method B: GPG Signature (More Secure)](#method-b-gpg-signature-more-secure)
    - [Bootloader Options](#bootloader-options)
  - [Creating Installation Media](#creating-installation-media)
    - [Supported Methods](#supported-methods)
    - [Method 1: Rufus (Windows)](#method-1-rufus-windows)
    - [Method 2: Balena Etcher (Windows, macOS, Linux)](#method-2-balena-etcher-windows-macos-linux)
    - [Method 3: Fedora Media Writer (Linux, Windows, macOS)](#method-3-fedora-media-writer-linux-windows-macos)
    - [Method 4: Ventoy (Multiple ISOs on One Drive)](#method-4-ventoy-multiple-isos-on-one-drive)
    - [Method 5: Linux `dd` Command (Advanced)](#method-5-linux-dd-command-advanced)
      - [Step 1: Identify your USB drive](#step-1-identify-your-usb-drive)
      - [Step 2: Unmount the USB drive if auto-mounted](#step-2-unmount-the-usb-drive-if-auto-mounted)
      - [Step 3: Write the ISO to the USB drive](#step-3-write-the-iso-to-the-usb-drive)
      - [Step 4: Wait for completion](#step-4-wait-for-completion)
      - [Step 5: Safely eject the USB drive](#step-5-safely-eject-the-usb-drive)
    - [After Creating the USB Drive](#after-creating-the-usb-drive)
  - [Installation Process](#installation-process)
    - [Step 1: Boot into the Live Environment](#step-1-boot-into-the-live-environment)
      - [1.1 Enter BIOS/UEFI](#11-enter-biosuefi)
      - [1.2 Disable Secure Boot (If Dual-Booting with Windows)](#12-disable-secure-boot-if-dual-booting-with-windows)
      - [1.3 Set USB as Boot Priority](#13-set-usb-as-boot-priority)
    - [Step 2: Choose Boot Option](#step-2-choose-boot-option)
    - [Step 3: Calamares Installer Walkthrough](#step-3-calamares-installer-walkthrough)
      - [3.1 Welcome \& Location](#31-welcome--location)
      - [3.2 Keyboard Layout](#32-keyboard-layout)
      - [3.3 Desktop Environment Selection](#33-desktop-environment-selection)
      - [3.4 Partitioning](#34-partitioning)
      - [3.5 User Account](#35-user-account)
      - [3.6 Bootloader Selection](#36-bootloader-selection)
      - [3.7 Summary \& Install](#37-summary--install)
    - [Step 4: Post-Installation](#step-4-post-installation)
  - [Enable Multilib Repository](#enable-multilib-repository)
    - [Step 0: Check If Multilib Is Already Enabled](#step-0-check-if-multilib-is-already-enabled)
    - [Step 1: Edit pacman.conf](#step-1-edit-pacmanconf)
    - [Step 2: Uncomment the Multilib Repository](#step-2-uncomment-the-multilib-repository)
    - [Step 3: Save and Exit](#step-3-save-and-exit)
    - [Step 4: Refresh Package Databases](#step-4-refresh-package-databases)
    - [Step 5: Verify Multilib is Enabled](#step-5-verify-multilib-is-enabled)
    - [Step 6: Test with a Multilib Package (Optional)](#step-6-test-with-a-multilib-package-optional)
  - [Install Core Applications](#install-core-applications)
    - [Step 1: Install Git](#step-1-install-git)
    - [Step 2: Install Node.js and npm (Using NVM)](#step-2-install-nodejs-and-npm-using-nvm)
      - [Why Not Use pacman for Node.js?](#why-not-use-pacman-for-nodejs)
      - [Install NVM](#install-nvm)
      - [Install Node.js (LTS Recommended)](#install-nodejs-lts-recommended)
      - [Switching Node Versions](#switching-node-versions)
      - [Uninstall or Reinstall Node Versions](#uninstall-or-reinstall-node-versions)
    - [Step 3: Install TypeScript and NestJS (Optional)](#step-3-install-typescript-and-nestjs-optional)
      - [Global Installation (Using npm)](#global-installation-using-npm)
    - [Step 4: Install Fonts](#step-4-install-fonts)
      - [Install essential system fonts](#install-essential-system-fonts)
      - [Install Fira Code (Programming Font with Ligatures)](#install-fira-code-programming-font-with-ligatures)
        - [Recommended (Arch Linux)](#recommended-arch-linux)
        - [Optional: Nerd Font Variant](#optional-nerd-font-variant)
      - [Install JetBrains Mono Nerd Font (Recommended)](#install-jetbrains-mono-nerd-font-recommended)
        - [Recommended (Arch Linux)](#recommended-arch-linux-1)
        - [Manual Installation (if not using package manager)](#manual-installation-if-not-using-package-manager)
    - [Verify Installation](#verify-installation)
    - [Optional: Install Yarn (Alternative to npm)](#optional-install-yarn-alternative-to-npm)
  - [Grant "wheel" Group Members "sudo" Privileges](#grant-wheel-group-members-sudo-privileges)
    - [Step 1: Ensure Your User is in the "wheel" Group](#step-1-ensure-your-user-is-in-the-wheel-group)
    - [Step 2: Edit the sudoers File](#step-2-edit-the-sudoers-file)
    - [Step 3: Uncomment the "wheel" Line](#step-3-uncomment-the-wheel-line)
    - [Step 4: Save and Exit](#step-4-save-and-exit)
    - [Step 5: Verify sudo Works](#step-5-verify-sudo-works)
    - [Optional: Passwordless sudo (Not Recommended)](#optional-passwordless-sudo-not-recommended)
  - [AUR Helper: Yay (Pre-installed) \& Paru (Alternative)](#aur-helper-yay-pre-installed--paru-alternative)
    - [Option A: Use Yay (Pre-installed – Recommended)](#option-a-use-yay-pre-installed--recommended)
      - [Basic Yay Usage](#basic-yay-usage)
      - [Example: Installing a Package from AUR](#example-installing-a-package-from-aur)
      - [Update Yay Itself](#update-yay-itself)
    - [Option B: Install Paru (Alternative to Yay)](#option-b-install-paru-alternative-to-yay)
      - [Prerequisites](#prerequisites)
      - [Step 1: Create a Build Directory](#step-1-create-a-build-directory)
      - [Step 2: Clone and Install](#step-2-clone-and-install)
      - [Step 3: Verify Installation](#step-3-verify-installation)
      - [Step 4: Remove Yay (If Switching Completely)](#step-4-remove-yay-if-switching-completely)
    - [Yay vs Paru: Quick Comparison](#yay-vs-paru-quick-comparison)
  - [GPU Drivers \& Configuration](#gpu-drivers--configuration)
    - [NVIDIA GPUs](#nvidia-gpus)
      - [Check Current Drivers](#check-current-drivers)
      - [Identify Your GPU](#identify-your-gpu)
      - [Install NVIDIA Drivers](#install-nvidia-drivers)
    - [Manual NVIDIA Driver (Not Recommended)](#manual-nvidia-driver-not-recommended)
    - [AMD GPUs](#amd-gpus)
      - [Identify Your AMD GPU](#identify-your-amd-gpu)
      - [Install AMD Drivers](#install-amd-drivers)
      - [Verify AMD Driver Installation](#verify-amd-driver-installation)
    - [Intel GPUs](#intel-gpus)
  - [GPU Switching for Laptops](#gpu-switching-for-laptops)
    - [Section A: Non-ASUS Optimus Laptops](#section-a-non-asus-optimus-laptops)
      - [Installation](#installation)
      - [Enable the Service](#enable-the-service)
      - [Basic Usage](#basic-usage)
      - [Wayland Note](#wayland-note)
    - [Section B: ASUS ROG / TUF Laptops Only](#section-b-asus-rog--tuf-laptops-only)
      - [What About `supergfxctl`?](#what-about-supergfxctl)
      - [Installation (Hardware Control)](#installation-hardware-control)
      - [GPU Switching for ASUS Laptops](#gpu-switching-for-asus-laptops)
      - [Summary for ASUS Users](#summary-for-asus-users)
    - [Verify Graphics Configuration](#verify-graphics-configuration)
  - [FirewallD Configuration](#firewalld-configuration)
    - [What is FirewallD?](#what-is-firewalld)
    - [Step 1: Check FirewallD Status](#step-1-check-firewalld-status)
    - [Step 2: Understand FirewallD Zones](#step-2-understand-firewalld-zones)
    - [Step 3: List Active Rules](#step-3-list-active-rules)
    - [Step 4: Add Services (Common Rules)](#step-4-add-services-common-rules)
    - [Step 5: Make Rules Permanent](#step-5-make-rules-permanent)
    - [Step 6: Add Custom Ports](#step-6-add-custom-ports)
    - [Step 7: Change Default Zone](#step-7-change-default-zone)
    - [Step 8: Zone Assignment by Interface](#step-8-zone-assignment-by-interface)
    - [Step 9: Rich Rules (Advanced)](#step-9-rich-rules-advanced)
    - [Step 10: GUI Management (firewall-config)](#step-10-gui-management-firewall-config)
    - [Common FirewallD Scenarios](#common-firewalld-scenarios)
      - [Scenario 1: Basic Desktop (Default)](#scenario-1-basic-desktop-default)
      - [Scenario 2: Home Desktop](#scenario-2-home-desktop)
      - [Scenario 3: Development Workstation](#scenario-3-development-workstation)
    - [Useful FirewallD Commands Cheat Sheet](#useful-firewalld-commands-cheat-sheet)
    - [Troubleshooting](#troubleshooting)
  - [WINE Installation](#wine-installation)
    - [How WINE Works](#how-wine-works)
    - [Step 1: Install WINE](#step-1-install-wine)
    - [Step 2: Install Winetricks](#step-2-install-winetricks)
    - [Step 3: Configure WINE](#step-3-configure-wine)
    - [Step 4: Test WINE Installation](#step-4-test-wine-installation)
    - [Step 5: Install Common Windows Libraries (via Winetricks)](#step-5-install-common-windows-libraries-via-winetricks)
    - [GUI Frontends for WINE](#gui-frontends-for-wine)
    - [Common WINE Environment Variables](#common-wine-environment-variables)
  - [Apply NVENC and NvFBC Patches for Nvidia Drivers](#apply-nvenc-and-nvfbc-patches-for-nvidia-drivers)
    - [Prerequisites](#prerequisites-1)
    - [Installation](#installation-1)
    - [Verification](#verification)
    - [Uninstalling / Reverting the Patch](#uninstalling--reverting-the-patch)
    - [After Driver Updates](#after-driver-updates)
    - [Do You Really Need This?](#do-you-really-need-this)
  - [Enable Bluetooth](#enable-bluetooth)
    - [Step 1: Install Bluetooth Packages](#step-1-install-bluetooth-packages)
    - [Step 2: Load the Bluetooth Driver](#step-2-load-the-bluetooth-driver)
    - [Step 3: Enable and Start the Bluetooth Service](#step-3-enable-and-start-the-bluetooth-service)
    - [Step 4: Check Bluetooth Adapter Status](#step-4-check-bluetooth-adapter-status)
    - [Step 5: Verify Bluetooth is Working](#step-5-verify-bluetooth-is-working)
  - [GNOME Shell Extensions](#gnome-shell-extensions)
    - [Extensions Requirements](#extensions-requirements)
      - [GNOME Browser Connector](#gnome-browser-connector)
      - [Browser Integration Extension](#browser-integration-extension)
      - [GNOME Extensions Manager Application](#gnome-extensions-manager-application)
    - [Recommended Extensions](#recommended-extensions)
  - [Conclusion](#conclusion)
    - [What Makes EndeavourOS Special](#what-makes-endeavouros-special)
    - [What's Next?](#whats-next)
      - [Immediate Next Steps](#immediate-next-steps)
    - [Ongoing System Maintenance](#ongoing-system-maintenance)
      - [Weekly Maintenance (5 minutes)](#weekly-maintenance-5-minutes)
      - [Monthly Maintenance (10 minutes)](#monthly-maintenance-10-minutes)
      - [Before Major Updates](#before-major-updates)
    - [EndeavourOS vs Arch: Quick Comparison](#endeavouros-vs-arch-quick-comparison)
    - [Learning Resources](#learning-resources)
    - [Congratulations – You're Now an EndeavourOS User](#congratulations--youre-now-an-endeavouros-user)

---

## How This Guide Differs from Arch Linux

| Aspect                  | Arch Linux                      | EndeavourOS                                     |
| ----------------------- | ------------------------------- | ----------------------------------------------- |
| **Installation**        | Manual (pacstrap, arch-chroot)  | Calamares GUI installer                         |
| **Desktop environment** | You choose and install manually | GNOME pre-configured                            |
| **AUR helper**          | Install manually (Paru)         | Yay pre-installed                               |
| **Welcome app**         | None                            | EndeavourOS welcome app with post-install tools |
| **Audio**               | You install PipeWire/PulseAudio | PipeWire pre-installed                          |
| **Firewall**            | You install UFW                 | FirewallD pre-installed                         |
| **Theming**             | Vanilla                         | EndeavourOS branding and themes                 |
| **Difficulty**          | Advanced                        | Beginner-friendly (Arch-based)                  |

> **💡 Tip:** If you've already completed my [Arch Linux Installation Guide](./arch-install.md), you'll find EndeavourOS much easier. The underlying system is still Arch – EndeavourOS just adds a friendly installer and some quality-of-life tools.

---

## Key Resources

Here are some of the main sources that helped me put this guidance together:

- [EndeavourOS Official Website](https://endeavouros.com/)
- [EndeavourOS Wiki](https://discovery.endeavouros.com/)
- [EndeavourOS Forums](https://forum.endeavouros.com/)
- [Arch Wiki – Installation guide](https://wiki.archlinux.org/title/installation_guide)

---

## What This Guide Covers

Follow along as we walk you through the installation process step by step:

- Preparing your system and creating a bootable USB
- Partitioning your disk
- Installing EndeavourOS with Calamares
- Configuring the bootloader

---

## Prerequisites & System Requirements

Before starting, ensure your system meets the requirements and you have everything needed.

### Hardware Requirements

| Component      | Minimum Requirement          | Recommended                    |
| -------------- | ---------------------------- | ------------------------------ |
| **CPU**        | 64-bit dual-core (Intel/AMD) | 64-bit quad-core or better     |
| **RAM**        | 4GB                          | 8GB or more                    |
| **Disk space** | 15GB                         | 30GB+ (for Btrfs snapshots)    |
| **Boot mode**  | UEFI (modern systems)        | UEFI with Secure Boot disabled |

> **⚠️ Warning:** The installer works best with modern UEFI systems. Avoid legacy (CSM) mode unless absolutely necessary.

### You Will Also Need

- A **USB drive** (4GB or larger) – all data on it will be erased
- A **backup** of any important data (the installation will erase your target disk)
- A stable **internet connection** (wired recommended during installation)

### What EndeavourOS Includes (Pre-installed)

You don't need to install these – they come with the system:

| Package                  | Purpose                               |
| ------------------------ | ------------------------------------- |
| **Firefox**              | Web browser                           |
| **Yay**                  | AUR helper (similar to Paru)          |
| **PipeWire**             | Audio framework (replaces PulseAudio) |
| **FirewallD**            | Firewall (different from Arch's UFW)  |
| **Dracut**               | Initramfs tool                        |
| **Power-profile-daemon** | Power management                      |
| **Glances**              | System monitoring tool                |
| **GNOME**                | Desktop environment                   |

> **📝 Note:** EndeavourOS uses **PipeWire** (not PulseAudio) and **FirewallD** (not UFW) by default. This differs from my Arch post-install guide. We'll cover FirewallD configuration in a later section.

---

## Downloading EndeavourOS

### Step 1: Download the ISO

1. Visit the official EndeavourOS website: [endeavouros.com](https://endeavouros.com/)
2. Navigate to the **Download** section
3. Choose your preferred edition:
   - **Online installer** (recommended) – Smaller download, fetches latest packages during installation
   - **Offline installer** – Larger download, includes all packages (good for offline installs)

For this guide, we'll use the **GNOME** edition.

### Step 2: Choose Download Method

| Method                       | Pros                                                | Cons                        |
| ---------------------------- | --------------------------------------------------- | --------------------------- |
| **Torrent (Magnet link)**    | Faster, resumable, verifies integrity automatically | Requires torrent client     |
| **Direct download (mirror)** | Simple, no extra software                           | Slower, no automatic resume |

> **💡 Tip:** Use the **torrent** option if possible. It's faster and automatically verifies the download integrity.

### Step 3: Verify the ISO (Recommended)

Before writing the ISO to a USB drive, verify its integrity to ensure it hasn't been corrupted or tampered with.

#### Method A: SHA512 Checksum

Download the `.sha512` file from the same mirror as the ISO. Then run:

```bash
sha512sum -c EndeavourOS_Titan-Neo-2026.04.27.iso.sha512
```

Expected output: `OK`

#### Method B: GPG Signature (More Secure)

Import the EndeavourOS signing key:

```bash
gpg --recv-keys CDF595A1
```

Verify the ISO:

```bash
gpg --verify EndeavourOS_Titan-Neo-2026.04.27.iso.sig
```

> **🔑 Key fingerprint:** `8F43 FC37 4CD4 CEEA 19CE E323 E3D8 752A CDF5 95A1` (Johannes Kamprad)

---

### Bootloader Options

During installation, you'll be asked to choose a bootloader:

| Bootloader       | Best for                                                     |
| ---------------- | ------------------------------------------------------------ |
| **GRUB**         | All systems (legacy and UEFI), dual-booting, Btrfs snapshots |
| **systemd-boot** | Modern UEFI systems only (simpler, faster)                   |

> **💡 Recommendation:** Choose **GRUB** unless you have a specific reason to use systemd-boot. GRUB works better with Btrfs snapshots.

---

## Creating Installation Media

After downloading the EndeavourOS ISO, you need to write it to a USB drive to create bootable installation media.

> **⚠️ Warning:** This process will **erase all data** on the target USB drive. Back up any important files before proceeding.

---

### Supported Methods

| Method                  | Platform              | Difficulty | Best for                                  |
| ----------------------- | --------------------- | ---------- | ----------------------------------------- |
| **Rufus**               | Windows               | Easy       | Most Windows users                        |
| **Balena Etcher**       | Windows, macOS, Linux | Very easy  | Cross-platform simplicity                 |
| **Fedora Media Writer** | Windows, macOS, Linux | Very easy  | Linux beginners                           |
| **Ventoy**              | Windows, Linux        | Moderate   | Users who want multiple ISOs on one drive |
| **`dd` command**        | Linux                 | Advanced   | Command-line users                        |

---

### Method 1: Rufus (Windows)

1. Download Rufus from [rufus.ie](https://rufus.ie/)
   - Standard version: `rufus-4.14.exe`
   - Portable version: `rufus-4.14p.exe` (no installation needed)

2. Insert your USB flash drive into your computer

3. Open Rufus – it will auto-detect your USB drive

4. Click **Select** and choose your EndeavourOS ISO file

5. Configure partition scheme:

   | Your System       | Partition Scheme | Target System    |
   | ----------------- | ---------------- | ---------------- |
   | Modern UEFI       | **GPT**          | UEFI (non-CSM)   |
   | Older BIOS/Legacy | **MBR**          | BIOS or UEFI-CSM |

6. Leave other settings as defaults:
   - File system: `FAT32`
   - Cluster size: Default

7. Click **Start** → **OK** to confirm

8. Wait for the process to complete, then safely eject the USB drive

---

### Method 2: Balena Etcher (Windows, macOS, Linux)

1. Download Balena Etcher from [balena.io/etcher](https://www.balena.io/etcher/)

2. Insert your USB flash drive

3. Open Etcher and click **Flash from file** → select your ISO

4. Click **Select target** → choose your USB drive

5. Click **Flash!** and wait for completion

6. Safely eject the USB drive when done

> **💡 Tip:** Etcher automatically verifies the write operation, so you don't need to manually check the USB.

---

### Method 3: Fedora Media Writer (Linux, Windows, macOS)

1. Install Fedora Media Writer:

   ```bash
   sudo pacman -S mediawriter
   ```

2. Insert your USB drive

3. Launch Fedora Media Writer

4. Click **Custom OS** → select your EndeavourOS ISO

5. Select your target USB drive

6. Click **Write to disk** and wait for completion

> **💡 Tip:** Fedora Media Writer is especially reliable for Linux users and handles UEFI boot correctly.

---

### Method 4: Ventoy (Multiple ISOs on One Drive)

[Ventoy](https://www.ventoy.net/) allows you to have multiple ISOs on a single USB drive and choose which to boot.

1. Download Ventoy from [ventoy.net](https://www.ventoy.net/)

2. Install Ventoy to your USB drive (this erases the drive once)

3. Simply **copy** the EndeavourOS ISO to the USB drive (no flashing needed)

4. Boot from the USB – Ventoy will present a menu of available ISOs

> **💡 Tip:** Ventoy is great for users who want to keep multiple distributions or tools on one USB drive.

---

### Method 5: Linux `dd` Command (Advanced)

> **⚠️ Extreme Caution:** The `dd` command is nicknamed "disk destroyer" for a reason. One wrong character can wipe your entire system drive. **Triple-check the output drive before pressing Enter.**

#### Step 1: Identify your USB drive

```bash
lsblk
```

Look for a device with the correct size (e.g., `/dev/sdb`, `/dev/sdc`). **Do not** use `/dev/sda` (that's usually your system drive).

#### Step 2: Unmount the USB drive if auto-mounted

```bash
sudo umount /dev/sdX*
```

Replace `/dev/sdX` with your USB device (e.g., `/dev/sdb`).

#### Step 3: Write the ISO to the USB drive

```bash
sudo dd if=/path/to/endeavouros.iso of=/dev/sdX bs=4M status=progress
```

**Explanation:**

- `if=` – Input file (your ISO path)
- `of=` – Output device (your USB drive – **not a partition** like `/dev/sdb1`)
- `bs=4M` – Block size (faster writing)
- `status=progress` – Show progress (optional but recommended)

#### Step 4: Wait for completion

The command will show output like:

```plaintext
512+0 records in
512+0 records out
2147483648 bytes (2.1 GB) copied, 45.2 s, 47.5 MB/s
```

#### Step 5: Safely eject the USB drive

```bash
sudo eject /dev/sdX
```

> **📝 Note:** Replace `/dev/sdX` with your actual USB device name.

---

### After Creating the USB Drive

1. **Keep the USB drive inserted** – you'll boot from it next

2. **Reboot your computer** and enter the boot menu (usually `F12`, `F11`, `F10`, `Esc`, or `Del` during startup)

3. **Select your USB drive** from the boot menu

4. **If the USB doesn't boot**:
   - Disable **Secure Boot** in BIOS/UEFI
   - Try a different USB port (USB 2.0 ports are sometimes more reliable)
   - Re-write the ISO using a different method

---

## Installation Process

Once you have prepared your bootable USB flash drive with the EndeavourOS installation media, follow these steps to install the system.

---

### Step 1: Boot into the Live Environment

#### 1.1 Enter BIOS/UEFI

Plug in your USB drive and restart your computer. During startup, press the key to enter the boot menu or BIOS:

| Brand                 | Boot Menu Key     | BIOS Key          |
| --------------------- | ----------------- | ----------------- |
| **ASUS**              | `F8`              | `F2` or `DEL`     |
| **Acer**              | `F12`             | `F2` or `DEL`     |
| **Dell**              | `F12`             | `F2`              |
| **HP**                | `F9`              | `F10`             |
| **Lenovo (Laptop)**   | `F12`             | `F2` or `Fn+F2`   |
| **Lenovo (ThinkPad)** | `Enter` then `F1` | `Enter` then `F1` |
| **MSI**               | `F11`             | `DEL`             |
| **Samsung**           | `Esc` or `F12`    | `F2`              |
| **Toshiba**           | `F12`             | `F2`              |

> **💡 Tip:** If unsure, spam `F12`, `F11`, `F10`, or `Esc` immediately after powering on.

#### 1.2 Disable Secure Boot (If Dual-Booting with Windows)

Enter BIOS → **Security** → **Secure Boot** → **Disabled**

> **⚠️ Note:** Some NVIDIA drivers may require Secure Boot to be disabled. You can re-enable it later if needed.

#### 1.3 Set USB as Boot Priority

- Set your USB drive as the **first boot device**
- Save and exit (usually `F10`)

---

### Step 2: Choose Boot Option

When the EndeavourOS boot menu appears, you'll see two options:

| Option                            | When to Use                                                                         |
| --------------------------------- | ----------------------------------------------------------------------------------- |
| **Default EndeavourOS installer** | For systems with AMD, Intel, or older NVIDIA GPUs                                   |
| **EndeavourOS NVIDIA installer**  | For systems with **newer NVIDIA GPUs** (automatically installs proprietary drivers) |

> **💡 Recommendation:** If you have an NVIDIA GPU from the last 3-4 years, choose the **NVIDIA installer**. For all other hardware, choose the default option.

---

### Step 3: Calamares Installer Walkthrough

Once booted into the live environment, click **"Install System"** on the welcome screen or desktop.

#### 3.1 Welcome & Location

- Select your language and region
- Click **Next**

#### 3.2 Keyboard Layout

- Choose your keyboard layout (default is US)
- Click **Next**

#### 3.3 Desktop Environment Selection

| Installation Type | What It Does                                   | Best For                           |
| ----------------- | ---------------------------------------------- | ---------------------------------- |
| **Offline**       | Installs GNOME directly (no internet required) | Slow connections, offline installs |
| **Online**        | Downloads latest packages during install       | Freshest software                  |

> **📝 Note:** Choose **GNOME** as your desktop environment when prompted.

#### 3.4 Partitioning

Choose the option that matches your setup:

| Option                  | When to Use                                                  | Risk Level               |
| ----------------------- | ------------------------------------------------------------ | ------------------------ |
| **Erase disk**          | Fresh install on empty drive, or you want to wipe everything | High (all data lost)     |
| **Install alongside**   | Dual-booting with Windows or another Linux distro            | Low (automatic resizing) |
| **Manual partitioning** | Advanced users who want custom layout                        | High (user responsible)  |

> **⚠️ Important:** It is **strongly recommended** to format the root partition as **Btrfs** (not ext4). This enables snapshots (via Timeshift or Snapper), allowing you to roll back system updates if something breaks.

#### 3.5 User Account

- Enter your **username** and **password**
- Choose a **computer name** (hostname)
- Optionally enable **automatic login** (not recommended for laptops)

#### 3.6 Bootloader Selection

| Bootloader       | Best for                                                 |
| ---------------- | -------------------------------------------------------- |
| **GRUB**         | All systems, dual-booting, Btrfs snapshots (recommended) |
| **systemd-boot** | Modern UEFI systems only (simpler, faster boot)          |

> **💡 Recommendation:** Choose **GRUB** unless you have a specific reason to use systemd-boot.

#### 3.7 Summary & Install

- Review your selections
- Click **Install Now**
- Wait for the installation to complete (5-15 minutes depending on speed)

---

### Step 4: Post-Installation

1. When finished, click **Restart Now**
2. **Remove the USB drive** when prompted
3. Boot into your new EndeavourOS GNOME system

---

## Enable Multilib Repository

The **multilib** repository provides 32-bit libraries and applications needed to run 32-bit software on a 64-bit system. This is essential for:

- Running **Steam** and many native Linux games
- Using **Wine** to run Windows applications
- Certain **development tools** and legacy software

> **💡 Tip:** Even if you don't need 32-bit software now, enable multilib anyway – many applications will require it later.

---

### Step 0: Check If Multilib Is Already Enabled

EndeavourOS may have multilib enabled by default. Check first:

```bash
grep -A 1 "\[multilib\]" /etc/pacman.conf
```

If you see uncommented lines like this, multilib is already enabled:

```plaintext
[multilib]
Include = /etc/pacman.d/mirrorlist
```

If the lines are commented (with `#` at the beginning), proceed with the steps below.

---

### Step 1: Edit pacman.conf

Open the pacman configuration file with root privileges:

```bash
sudo nano /etc/pacman.conf
```

### Step 2: Uncomment the Multilib Repository

Find these lines in the file (usually near the bottom):

```plaintext
#[multilib]
#Include = /etc/pacman.d/mirrorlist
```

Remove the `#` at the beginning of **both lines** so they look like this:

```plaintext
[multilib]
Include = /etc/pacman.d/mirrorlist
```

> **📝 Note:** If your file has `[multilib-testing]`, leave it commented unless you specifically need testing repositories.

### Step 3: Save and Exit

- In `nano`: Press `Ctrl+O` (save), `Enter` (confirm), then `Ctrl+X` (exit)

### Step 4: Refresh Package Databases

Update pacman to recognize the newly enabled multilib repository:

```bash
sudo pacman -Syyu
```

The `-Syy` forces a refresh of all package databases, including the new multilib repository.

### Step 5: Verify Multilib is Enabled

Check that multilib packages are now available:

```bash
pacman -Sl multilib | head -n 10
```

You should see a list of multilib packages (e.g., `lib32-glibc`, `lib32-gcc-libs`).

### Step 6: Test with a Multilib Package (Optional)

Install a common 32-bit library to confirm everything works:

```bash
sudo pacman -S lib32-glibc
```

If the installation succeeds without errors, multilib is properly configured.

---

## Install Core Applications

In this section, we will install essential core applications for development and system management.

> **💡 Tip:** EndeavourOS comes with some tools pre-installed (e.g., `git` may already be present). The commands below will skip already-installed packages or update them if needed.

---

### Step 1: Install Git

Git is a version control system essential for cloning AUR packages, managing dotfiles, and collaborating on code.

```bash
sudo pacman -S git
```

**Verify installation:**

```bash
git --version
```

Expected output: `git version x.x.x`

---

### Step 2: Install Node.js and npm (Using NVM)

Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine, and npm is the Node.js package manager.

This guide explains how to install Node.js, npm, and manage global packages on Arch Linux **without using pacman**.
Instead, we use **NVM (Node Version Manager)**, which is the recommended method for development.

nvm is a version manager for node.js, designed to be installed per-user, and invoked per-shell. nvm works on any POSIX-compliant shell (sh, dash, ksh, zsh, bash), in particular on these platforms: unix, macOS, and Windows WSL.

#### Why Not Use pacman for Node.js?

- pacman installs Node.js system-wide (in `/usr/bin`)
- global npm installs require `sudo`
- global packages mix with system files
- major Node.js updates can break local projects
- NVM supports multiple Node versions per project

Using NVM ensures:

- isolated environments per project
- no sudo usage
- clean global package installs
- easy Node version switching

#### Install NVM

Use the official installer:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```

**Note: There is also an update command**

```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```

Reload your shell:

```bash
source ~/.bashrc   # or ~/.zshrc
```

Verify:

```bash
nvm --version
```

#### Install Node.js (LTS Recommended)

```bash
nvm install --lts
```

Or install the latest "current" release:

```bash
nvm install node
```

Set it as default:

```bash
nvm alias default node
```

Check:

```bash
node -v
npm -v
```

#### Switching Node Versions

Install multiple versions:

```bash
nvm install 20
nvm install 22
```

Switch anytime:

```bash
nvm use 22
```

Per-project default using `.nvmrc`:

```bash
echo "22" > .nvmrc
```

Then:

```bash
nvm use
```

#### Uninstall or Reinstall Node Versions

Remove a specific version:

```bash
nvm uninstall 20
```

---

### Step 3: Install TypeScript and NestJS (Optional)

TypeScript is a strongly typed programming language that builds on JavaScript. NestJS is a progressive Node.js framework for building efficient and scalable server-side applications.

> **⚠️ Warning – Global npm Installation:** Using `sudo npm install -g` can cause conflicts with pacman-managed packages (as covered in the [Arch Linux post-install guide](./arch-post-install.md#error-3-npmnodejs-file-exists-conflict-specific-fix)). If you encounter "file exists" errors, you may need to remove conflicting files or use the [NVM Installation](#step-2-install-nodejs-and-npm-using-nvm).

#### Global Installation (Using npm)

```bash
npm install -g typescript @nestjs/cli
```

**Verify installation:**

```bash
tsc --version
nest --version
```

---

### Step 4: Install Fonts

#### Install essential system fonts

These fonts ensure broad language support, proper emoji rendering, and good default text coverage across the system.

```bash
sudo pacman -S noto-fonts noto-fonts-emoji ttf-dejavu ttf-liberation
```

---

#### Install Fira Code (Programming Font with Ligatures)

Fira Code is a monospaced font designed for developers. It includes ligatures for common programming symbols such as `->`, `=>`, and `!=`, improving readability.

##### Recommended (Arch Linux)

```bash
sudo pacman -S ttf-fira-code
```

##### Optional: Nerd Font Variant

If you also need terminal icons (for tools like Neovim, Starship, or TUI apps), install the patched Nerd Font version:

```bash
sudo pacman -S ttf-firacode-nerd
```

More info:
[https://github.com/tonsky/FiraCode](https://github.com/tonsky/FiraCode)

---

#### Install JetBrains Mono Nerd Font (Recommended)

JetBrains Mono Nerd Font is a developer-focused typeface that combines excellent readability with Nerd Font icons (used in modern terminal tools and plugins).

##### Recommended (Arch Linux)

```bash
sudo pacman -S ttf-jetbrains-mono-nerd
```

##### Manual Installation (if not using package manager)

Download from Nerd Fonts:
[https://www.nerdfonts.com/](https://www.nerdfonts.com/)

Then install the font files manually into:

```bash
~/.local/share/fonts
```

and refresh the font cache:

```bash
fc-cache -fv
```

---

### Verify Installation

Check installed fonts:

```bash
fc-list | grep -i "Fira"
fc-list | grep -i "JetBrains"
```

List Nerd Fonts specifically:

```bash
fc-list | grep -i nerd
```

---

### Optional: Install Yarn (Alternative to npm)

If you prefer Yarn over npm:

```bash
sudo pacman -S yarn
```

**Verify installation:**

```bash
yarn --version
```

---

## Grant "wheel" Group Members "sudo" Privileges

In this step, we will grant members of the `wheel` group full sudo privileges, allowing them to execute commands with administrative (root) privileges.

> **ℹ️ Note:** EndeavourOS may already have this configured by default. The steps below ensure it's set correctly.

---

### Step 1: Ensure Your User is in the "wheel" Group

Check if your user is already a member of the `wheel` group:

```bash
groups $USER
```

Look for `wheel` in the output. If not present, add your user to the group:

```bash
sudo usermod -aG wheel $USER
```

> **⚠️ Warning:** You will need to log out and back in (or reboot) for group changes to take effect.

---

### Step 2: Edit the sudoers File

We'll use `visudo` – the safe way to edit the sudoers file. It checks for syntax errors before saving, preventing lockouts.

```bash
sudo EDITOR=nano visudo
```

> **💡 Tip:** The `EDITOR=nano` part tells `visudo` to use the Nano text editor. If you prefer `vim`, use `EDITOR=vim visudo`.

---

### Step 3: Uncomment the "wheel" Line

In the sudoers file, find the line:

```plaintext
# %wheel ALL=(ALL:ALL) ALL
```

Remove the `#` at the beginning to uncomment it:

```plaintext
%wheel ALL=(ALL:ALL) ALL
```

**What this line means:**

| Part            | Meaning                                    |
| --------------- | ------------------------------------------ |
| `%wheel`        | The wheel group (users in this group)      |
| `ALL=(ALL:ALL)` | Can run commands as any user and any group |
| `ALL`           | On any host (the system itself)            |

Simply put: **Members of the wheel group can run any command with sudo.**

---

### Step 4: Save and Exit

- In `nano`: Press `Ctrl+O` (save), `Enter` (confirm), then `Ctrl+X` (exit)

`visudo` will automatically check for syntax errors. If there's an error, it will warn you and ask what to do.

---

### Step 5: Verify sudo Works

Test that sudo is working correctly:

```bash
sudo -v
```

Test with an actual command:

```bash
sudo pacman -Syu
```

You should be prompted for your password, and the command should run.

---

### Optional: Passwordless sudo (Not Recommended)

If you want to allow `wheel` group members to run sudo **without entering a password**:

```plaintext
%wheel ALL=(ALL:ALL) NOPASSWD: ALL
```

> **⚠️ Security Warning:** Passwordless sudo significantly reduces security. Only use this on personal, non-exposed systems.

---

## AUR Helper: Yay (Pre-installed) & Paru (Alternative)

EndeavourOS comes with **Yay** pre-installed – an AUR helper that allows you to install packages from both the official Arch repositories and the Arch User Repository (AUR).

> **💡 Tip:** If you're coming from my Arch guide, note that Arch used Paru. EndeavourOS uses Yay by default. Both work similarly.

---

### Option A: Use Yay (Pre-installed – Recommended)

Since Yay is already installed, you can start using it immediately.

#### Basic Yay Usage

| Task                            | Command                                         |
| ------------------------------- | ----------------------------------------------- |
| Update system + AUR packages    | `yay -Syu`                                      |
| Install a package (repo or AUR) | `yay -S <package>`                              |
| Remove a package                | `yay -R <package>` (or `-Rns` for full removal) |
| Search for packages             | `yay -Ss <search term>`                         |
| Show package info               | `yay -Si <package>`                             |
| Clean unused dependencies       | `yay -Yc`                                       |

#### Example: Installing a Package from AUR

```bash
# Search for a package
yay -Ss google-chrome

# Install from AUR
yay -S google-chrome
```

#### Update Yay Itself

Yay updates itself when you update your system:

```bash
yay -Syu
```

---

### Option B: Install Paru (Alternative to Yay)

[Paru](https://github.com/Morganamilo/paru) is another popular AUR helper. If you prefer Paru over Yay:

> **⚠️ Note:** You don't need both Yay and Paru. Choose one.

#### Prerequisites

```bash
sudo pacman -S --needed base-devel git
```

#### Step 1: Create a Build Directory

```bash
mkdir -p ~/builds
cd ~/builds
```

#### Step 2: Clone and Install

```bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

#### Step 3: Verify Installation

```bash
paru --version
```

#### Step 4: Remove Yay (If Switching Completely)

```bash
sudo pacman -Rns yay
```

> **⚠️ Warning:** Make sure Paru is working correctly before removing Yay.

---

### Yay vs Paru: Quick Comparison

| Feature                           | Yay       | Paru       |
| --------------------------------- | --------- | ---------- |
| **Pre-installed on EndeavourOS?** | ✅ Yes    | ❌ No      |
| **Written in**                    | Go        | Rust       |
| **Package search**                | `yay -Ss` | `paru -Ss` |
| **Performance**                   | Fast      | Very fast  |

> **💡 Recommendation:** Stick with **Yay** – it's pre-installed, well-tested on EndeavourOS, and works perfectly.

---

## GPU Drivers & Configuration

This section covers installing GPU drivers.

> **📝 Prerequisite:** Ensure the [multilib repository is enabled](#enable-multilib-repository) before installing 32-bit libraries.

---

### NVIDIA GPUs

#### Check Current Drivers

EndeavourOS may have already installed NVIDIA drivers during setup (especially if you chose the NVIDIA installer). Verify:

```bash
nvidia-smi
```

#### Identify Your GPU

```bash
lspci -k | grep -A 2 -E "(VGA|3D)"
```

#### Install NVIDIA Drivers

For modern NVIDIA GPUs (GTX 900 series and newer):

```bash
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils
```

For LTS kernel users:

```bash
sudo pacman -S nvidia-lts nvidia-utils lib32-nvidia-utils
```

**Enable NVIDIA DRM kernel mode setting** (required for Wayland):

```bash
sudo nano /etc/mkinitcpio.conf
```

Add `nvidia nvidia_modeset nvidia_uvm nvidia_drm` to the `MODULES=` array:

```plaintext
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

Regenerate initramfs:

```bash
sudo mkinitcpio -P
```

Create a configuration file:

```bash
sudo nano /etc/modprobe.d/nvidia-drm.conf
```

Add:

```plaintext
options nvidia_drm modeset=1
```

**For GRUB users,** add `nvidia_drm.modeset=1` to your kernel command line:

```bash
sudo nano /etc/default/grub
```

Find `GRUB_CMDLINE_LINUX_DEFAULT` and add the parameter:

```plaintext
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia_drm.modeset=1"
```

Then regenerate GRUB config:

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Verify installation:

```bash
nvidia-smi
vulkaninfo | grep deviceName
```

> **💡 Tip for older GPUs:** If you have a legacy GPU (GTX 600-700 series), check the [NVIDIA legacy driver list](https://nvidia.custhelp.com/app/answers/detail/a_id/3473/) for compatible drivers.

---

### Manual NVIDIA Driver (Not Recommended)

> **⚠️ Warning:** Manual `.run` files from NVIDIA's website **are not compatible with pacman** and will break your system after kernel updates. Do not use this method.

---

### AMD GPUs

#### Identify Your AMD GPU

```bash
lspci -nn | grep -E 'VGA|Display'
```

#### Install AMD Drivers

```bash
sudo pacman -S mesa xf86-video-amdgpu vulkan-radeon lib32-mesa lib32-vulkan-radeon
```

For older AMD cards (pre-GCN), use `xf86-video-ati` instead:

```bash
sudo pacman -S xf86-video-ati
```

#### Verify AMD Driver Installation

```bash
glxinfo | grep "OpenGL renderer"
```

Expected output should show your AMD GPU model (not `llvmpipe`).

---

### Intel GPUs

```bash
sudo pacman -S mesa vulkan-intel
```

For very old Intel GPUs (pre-2007), use `xf86-video-vesa` as fallback.

---

## GPU Switching for Laptops

> **⚠️ Note:** Only follow this if you have a laptop with both Intel integrated graphics and an NVIDIA discrete GPU.

Choose the section that matches your hardware.

---

### Section A: Non-ASUS Optimus Laptops

**Use `optimus-manager`** – a universal solution that works on any NVIDIA Optimus laptop.

#### Installation

```bash
yay -S optimus-manager
```

#### Enable the Service

```bash
sudo systemctl enable --now optimus-manager
```

#### Basic Usage

| Task                  | Command                               |
| --------------------- | ------------------------------------- |
| Switch to NVIDIA only | `optimus-manager --switch nvidia`     |
| Switch to Intel only  | `optimus-manager --switch integrated` |
| Switch to Hybrid mode | `optimus-manager --switch hybrid`     |
| Check current mode    | `optimus-manager --print-mode`        |

> **⚠️ Note:** You must log out and back in (or reboot) after switching modes.

#### Wayland Note

`optimus-manager` has limited Wayland support. For Wayland, use Hybrid mode and run applications with:

```bash
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia <application>
```

---

### Section B: ASUS ROG / TUF Laptops Only

> **🔧 This section is for ASUS ROG and TUF laptops only.** It will not work on other brands.

For ASUS laptops, you need **hardware control** (fans, battery limit, RGB, power profiles) in addition to GPU switching.

#### What About `supergfxctl`?

> **⚠️ Warning:** `supergfxctl` is **being phased out** according to the Arch Wiki. Its use is unadvised unless you specifically require VFIO for virtual machines. Do not install it unless you have that specific need. However, since we are only going to use this service to change the GPU mode once or twice (like forever), we're going to install it anyway.

#### Installation (Hardware Control)

Install `supergfxctl`, `asusctl` and `rog-control-center` for fan control, battery limit, RGB, and power profiles:

```bash
yay -S asusctl supergfxctl rog-control-center
```

Enable the service:

```bash
sudo systemctl enable --now asusd
```

> **Note:** According to ASUS Linux documentation, `asusd` is socket-activated. The enable command above ensures it starts on boot.

---

#### GPU Switching for ASUS Laptops

**Option A: `supergfxctl` Utillity**

> **⚠️ Deprecation Notice:** `supergfxctl` is **being phased out** according to the Arch Wiki. Its use is unadvised unless you specifically require VFIO for virtual machines. However, it remains the **easiest way to control the MUX switch** on ASUS TUF/ROG laptops. For most users, **Option B (Standard PRIME)** is recommended for daily use.

`supergfxctl` provides a unified command-line interface for GPU switching on ASUS laptops, including support for the hardware MUX switch.

**Available Modes:**

| Mode          | What It Does                                        | Reboot Required?      | Use Case                        |
| :------------ | :-------------------------------------------------- | :-------------------- | :------------------------------ |
| `Integrated`  | iGPU only, dGPU completely powered off              | No (instant)          | Maximum battery life            |
| `Hybrid`      | iGPU drives display, dGPU available via `prime-run` | No (logout only)      | **Recommended for daily use**   |
| `AsusMuxDgpu` | dGPU directly drives display (MUX switch engaged)   | **Yes** (full reboot) | Maximum gaming performance      |
| `Vfio`        | dGPU bound to VFIO for VM passthrough               | No                    | Virtual machine GPU passthrough |

**Basic Usage:**

```bash
# Check current mode
supergfxctl -g

# Switch to a different mode
sudo supergfxctl -m Hybrid

# Verify the switch was successful
supergfxctl -g
```

**After switching to `Hybrid` mode**, use **Option B (Standard PRIME)** below to run applications on the NVIDIA GPU.

> **💡 Note:** The `Hybrid` and `Integrated` modes **do not** use the MUX switch — they are software-level PRIME configurations. Only `AsusMuxDgpu` engages the physical MUX switch hardware, which is why it requires a full reboot.

**Option B: Standard NVIDIA PRIME (Recommended for Wayland)**

No extra tools required. Run applications with the NVIDIA GPU on demand:

```bash
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia firefox
```

To make this permanent for an application, edit its `.desktop` file:

```bash
sudo sed -i 's/Exec=/Exec=__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia /' /usr/share/applications/steam.desktop
```

**Option C: `optimus-manager` (For Xorg users)**

> **⚠️ Conflict Warning:** `optimus-manager` **cannot** be installed alongside `asusd`. If you need both hardware control and advanced GPU switching, choose Option A (PRIME) instead.

If you still want `optimus-manager`, you must stop using `asusctl` for hardware control – they conflict.

**Option D: MUX Switch (Discrete GPU Only Mode)**

If your ASUS TUF laptop has a hardware MUX switch, you can use it without `supergfxctl`:

```bash
# Switch to discrete GPU only mode (requires reboot)
asusctl bios -D 0

# Switch back to hybrid/Optimus mode (requires reboot)
asusctl bios -D 1
```

> **ℹ️ Note:** MUX switch mode is different from standard GPU switching. It physically disconnects the integrated GPU from the display and connects the discrete GPU directly. This requires a reboot and is useful for maximum gaming performance.

#### Summary for ASUS Users

| What You Want                                   | Recommended Solution                                     |
| ----------------------------------------------- | -------------------------------------------------------- |
| Fan control, battery limit, RGB, power profiles | `asusctl` + `rog-control-center`                         |
| GPU switching (standard)                        | NVIDIA PRIME (no extra tools)                            |
| GPU switching (advanced, Xorg only)             | `optimus-manager` (but **conflicts** with `asusctl`)     |
| MUX switch (discrete-only mode)                 | `asusctl bios -D` commands                               |
| VFIO GPU passthrough                            | `supergfxctl` (but **phased out** – advanced users only) |

---

### Verify Graphics Configuration

```bash
# Check which GPU is active
glxinfo | grep "OpenGL renderer"

# Check NVIDIA driver (if applicable)
nvidia-smi

# Check Wayland session
echo $XDG_SESSION_TYPE
```

---

## FirewallD Configuration

EndeavourOS comes with **FirewallD** pre-installed – a dynamic firewall manager with support for zones, services, and rich rules.

> **💡 Tip:** FirewallD is already installed on EndeavourOS. You don't need to install it manually.

---

### What is FirewallD?

| Feature                 | Description                                        |
| ----------------------- | -------------------------------------------------- |
| **Dynamic rules**       | Changes take effect immediately without restarting |
| **Zones**               | Different security levels for different networks   |
| **Runtime & permanent** | Test rules before making them permanent            |
| **GUI available**       | `firewall-config` for graphical management         |

---

### Step 1: Check FirewallD Status

```bash
sudo systemctl status firewalld
```

If it's not running:

```bash
sudo systemctl enable --now firewalld
```

---

### Step 2: Understand FirewallD Zones

| Zone                 | Trust Level | Typical Use                            |
| -------------------- | ----------- | -------------------------------------- |
| **public** (default) | Low         | Public networks (coffee shop, airport) |
| **home**             | Medium      | Trusted home network                   |
| **work**             | Medium      | Trusted office network                 |
| **internal**         | High        | Internal corporate network             |
| **trusted**          | Full        | All traffic allowed (use with caution) |

---

### Step 3: List Active Rules

```bash
firewall-cmd --list-all
```

---

### Step 4: Add Services (Common Rules)

| Service             | Command                                 |
| ------------------- | --------------------------------------- |
| **SSH**             | `sudo firewall-cmd --add-service=ssh`   |
| **HTTP**            | `sudo firewall-cmd --add-service=http`  |
| **HTTPS**           | `sudo firewall-cmd --add-service=https` |
| **CUPS** (printing) | `sudo firewall-cmd --add-service=cups`  |

---

### Step 5: Make Rules Permanent

FirewallD has two rule sets:

- **Runtime** – Lost after reboot
- **Permanent** – Survives reboot

**Best practice workflow:**

```bash
# Test a rule (runtime)
sudo firewall-cmd --add-service=ssh

# If it works, make it permanent
sudo firewall-cmd --runtime-to-permanent
```

---

### Step 6: Add Custom Ports

```bash
sudo firewall-cmd --add-port=8080/tcp
sudo firewall-cmd --runtime-to-permanent
```

---

### Step 7: Change Default Zone

```bash
sudo firewall-cmd --set-default-zone=home
```

---

### Step 8: Zone Assignment by Interface

```bash
sudo firewall-cmd --zone=home --change-interface=wlan0
sudo firewall-cmd --runtime-to-permanent
```

---

### Step 9: Rich Rules (Advanced)

**Allow a specific IP:**

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" accept'
```

**Allow SSH only from local network:**

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" service name="ssh" accept'
```

---

### Step 10: GUI Management (firewall-config)

```bash
sudo pacman -S firewall-config
```

Launch from application menu as **"Firewall Configuration"**.

---

### Common FirewallD Scenarios

#### Scenario 1: Basic Desktop (Default)

Suitable for most users – no changes needed.

#### Scenario 2: Home Desktop

```bash
sudo firewall-cmd --set-default-zone=home
sudo firewall-cmd --add-service=kdeconnect
sudo firewall-cmd --runtime-to-permanent
```

#### Scenario 3: Development Workstation

```bash
sudo firewall-cmd --add-port=3000/tcp
sudo firewall-cmd --add-port=8000/tcp
sudo firewall-cmd --runtime-to-permanent
```

---

### Useful FirewallD Commands Cheat Sheet

| Task                       | Command                                       |
| -------------------------- | --------------------------------------------- |
| **List all rules**         | `sudo firewall-cmd --list-all`                |
| **Add service (runtime)**  | `sudo firewall-cmd --add-service=<name>`      |
| **Make runtime permanent** | `sudo firewall-cmd --runtime-to-permanent`    |
| **Reload permanent rules** | `sudo firewall-cmd --reload`                  |
| **Set default zone**       | `sudo firewall-cmd --set-default-zone=<zone>` |

---

### Troubleshooting

| Problem                           | Solution                                                                        |
| --------------------------------- | ------------------------------------------------------------------------------- |
| `firewall-cmd: command not found` | `sudo pacman -S firewalld`                                                      |
| Rules not applying                | Remember `--runtime-to-permanent`                                               |
| FirewallD not starting            | `sudo systemctl enable --now firewalld`                                         |
| Can't SSH after changes           | `sudo firewall-cmd --add-service=ssh --permanent && sudo firewall-cmd --reload` |

---

## WINE Installation

WINE (Wine Is Not an Emulator) is a compatibility layer that allows you to run Windows applications on Linux.

> **📝 Prerequisite:** Ensure the [multilib repository is enabled](#enable-multilib-repository).

---

### How WINE Works

| Component      | Purpose                                  |
| -------------- | ---------------------------------------- |
| **WINE core**  | Translates Windows API to Linux syscalls |
| **wine-gecko** | HTML rendering engine                    |
| **wine-mono**  | .NET Framework implementation            |
| **Winetricks** | Helper script for common DLLs            |

---

### Step 1: Install WINE

```bash
sudo pacman -S wine wine-gecko wine-mono
```

For better compatibility with newer applications:

```bash
sudo pacman -S wine-staging
```

---

### Step 2: Install Winetricks

```bash
sudo pacman -S winetricks
```

---

### Step 3: Configure WINE

Create a WINE prefix (default is `~/.wine`):

```bash
winecfg
```

Set Windows version to **Windows 10** or **Windows 11**.

For a 32-bit only prefix:

```bash
WINEPREFIX=~/wine32 WINEARCH=win32 winecfg
```

---

### Step 4: Test WINE Installation

```bash
wine notepad
wine --version
```

---

### Step 5: Install Common Windows Libraries (via Winetricks)

```bash
winetricks
```

Common libraries:

- `vcrun2019` – Visual C++ 2019
- `dotnet48` – .NET Framework 4.8 (slow, may fail)
- `corefonts` – Microsoft core fonts

Command line examples:

```bash
winetricks vcrun2019
winetricks corefonts
```

---

### GUI Frontends for WINE

| Frontend    | Installation            | Use Case                       |
| ----------- | ----------------------- | ------------------------------ |
| **Bottles** | `yay -S bottles`        | Modern, easy prefix management |
| **Lutris**  | `sudo pacman -S lutris` | Gaming platform                |

---

### Common WINE Environment Variables

| Variable     | Purpose                 | Example                             |
| ------------ | ----------------------- | ----------------------------------- |
| `WINEPREFIX` | Specify prefix location | `WINEPREFIX=~/myapp wine setup.exe` |
| `WINEARCH`   | Set architecture        | `WINEARCH=win32 winecfg`            |

---

## Apply NVENC and NvFBC Patches for Nvidia Drivers

> **🔧 This section is for NVIDIA GPU users only.**

NVENC is NVIDIA's hardware video encoder. By default, NVIDIA limits consumer GPUs to **3 simultaneous NVENC sessions**.

> **⚠️ Legal & Stability Warning:**
>
> - These patches **may violate NVIDIA's EULA** for consumer GPUs.
> - Patches are **driver-version specific**.
> - You must **reapply after every NVIDIA driver update**.

---

### Prerequisites

```bash
sudo pacman -S git
nvidia-smi --query-gpu=driver_version --format=csv,noheader
```

Visit the [nvidia-patch releases page](https://github.com/keylase/nvidia-patch#version-table) to verify your driver version is supported.

---

### Installation

```bash
cd ~/Downloads
git clone https://github.com/keylase/nvidia-patch.git
cd nvidia-patch
bash ./patch.sh
bash ./patch-fbc.sh
```

---

### Verification

```bash
bash ./patch.sh -c
bash ./patch-fbc.sh -c
```

---

### Uninstalling / Reverting the Patch

```bash
bash ./patch.sh -r
bash ./patch-fbc.sh -r
```

---

### After Driver Updates

NVIDIA driver updates **overwrite the patched files**. You must reapply:

```bash
cd ~/Downloads/nvidia-patch
git pull
bash ./patch.sh
bash ./patch-fbc.sh
```

---

### Do You Really Need This?

| Use Case                             | Need the patch? |
| ------------------------------------ | --------------- |
| Casual streaming (single platform)   | **No**          |
| Streaming + recording simultaneously | **Maybe**       |
| Multiple streaming platforms         | **Yes**         |

Most users **do not need this patch**.

---

## Enable Bluetooth

This section covers installing, enabling, and using Bluetooth on EndeavourOS with GNOME.

---

### Step 1: Install Bluetooth Packages

```bash
sudo pacman -S bluez bluez-utils
```

**For GNOME (recommended):**

```bash
sudo pacman -S gnome-bluetooth
```

> **💡 Tip:** `gnome-bluetooth` integrates with GNOME Settings.

---

### Step 2: Load the Bluetooth Driver

Check if `btusb` is loaded:

```bash
lsmod | grep btusb
```

If not loaded:

```bash
sudo modprobe btusb
echo "btusb" | sudo tee /etc/modules-load.d/bluetooth.conf
```

---

### Step 3: Enable and Start the Bluetooth Service

```bash
sudo systemctl enable --now bluetooth.service
```

Verify:

```bash
systemctl status bluetooth.service
```

---

### Step 4: Check Bluetooth Adapter Status

```bash
bluetoothctl list
rfkill list
```

If blocked:

```bash
rfkill unblock bluetooth
```

---

### Step 5: Verify Bluetooth is Working

```bash
systemctl status bluetooth
bluetoothctl devices
```

> **ℹ️ Note:** In GNOME, you can manage Bluetooth from **Settings** → **Bluetooth**.

---

## GNOME Shell Extensions

GNOME Shell extensions are small pieces of code that modify the way GNOME works. (Similar to Chrome Extensions or Firefox Addons.)

> **ℹ️ Note:** Some extensions may become incompatible with newer GNOME versions. Check the [GNOME Extensions website](https://extensions.gnome.org/) for compatibility.

---

### Extensions Requirements

#### GNOME Browser Connector

This extension allows your browser to communicate with GNOME Shell.

```bash
sudo pacman -S gnome-browser-connector
```

#### Browser Integration Extension

Install the browser extension for your preferred browser:

- [Chrome GNOME Shell integration](https://chromewebstore.google.com/detail/gphhapmejobijbbhgpjhcjognlahblep)
- [Firefox GNOME Shell integration](https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/)

#### GNOME Extensions Manager Application

This application is installed by default on EndeavourOS GNOME. It gives you full control over all installed extensions and their settings.

---

### Recommended Extensions

| Extension                   | Purpose                          | Install From                                                                                        |
| --------------------------- | -------------------------------- | --------------------------------------------------------------------------------------------------- |
| **ddterm**                  | Drop-down terminal               | [extensions.gnome.org](https://extensions.gnome.org/extension/3780/ddterm/)                         |
| **Forge**                   | Tiling window manager            | [extensions.gnome.org](https://extensions.gnome.org/extension/4481/forge/)                          |
| **Quick Setting Tweaker**   | Customize quick settings         | [extensions.gnome.org](https://extensions.gnome.org/extension/5446/quick-settings-tweaker/)         |
| **AppIndicator**            | System tray icons                | [extensions.gnome.org](https://extensions.gnome.org/extension/615/appindicator-support/)            |
| **Desktop Cube**            | 3D workspace switcher            | [extensions.gnome.org](https://extensions.gnome.org/extension/4648/desktop-cube/)                   |
| **Blur my Shell**           | Blur effects                     | [extensions.gnome.org](https://extensions.gnome.org/extension/3193/blur-my-shell/)                  |
| **Caffeine**                | Prevent sleep                    | [extensions.gnome.org](https://extensions.gnome.org/extension/517/caffeine/)                        |
| **Custom Hot Corners**      | Customizable hot corners         | [extensions.gnome.org](https://extensions.gnome.org/extension/4167/custom-hot-corners-extended/)    |
| **Clipboard Indicator**     | Clipboard history                | [extensions.gnome.org](https://extensions.gnome.org/extension/779/clipboard-indicator/)             |
| **Coverflow Alt-Tab**       | Visual alt-tab switcher          | [extensions.gnome.org](https://extensions.gnome.org/extension/97/coverflow-alt-tab/)                |
| **Dash to Dock**            | Dock for GNOME                   | [extensions.gnome.org](https://extensions.gnome.org/extension/307/dash-to-dock/)                    |
| **Hide Top Bar**            | Auto-hide top bar                | [extensions.gnome.org](https://extensions.gnome.org/extension/545/hide-top-bar/)                    |
| **Just Perfection**         | Comprehensive customization      | [extensions.gnome.org](https://extensions.gnome.org/extension/3843/just-perfection/)                |
| **Privacy Quick Settings**  | Privacy shortcuts                | [extensions.gnome.org](https://extensions.gnome.org/extension/4491/privacy-settings-menu/)          |
| **Rounded Corners**         | Round window corners             | [extensions.gnome.org](https://extensions.gnome.org/extension/1514/rounded-corners/)                |
| **User Themes**             | Custom shell themes              | [extensions.gnome.org](https://extensions.gnome.org/extension/19/user-themes/)                      |
| **Wiggle**                  | Magnify cursor on rapid movement | [extensions.gnome.org](https://extensions.gnome.org/extension/6784/wiggle/)                         |
| **Compiz Alike Magic Lamp** | Magic lamp effect                | [extensions.gnome.org](https://extensions.gnome.org/extension/3740/compiz-alike-magic-lamp-effect/) |

> **⚠️ Note:** Some extensions require GNOME 45+ or specific versions. Check compatibility before installing.

---

## Conclusion

Congratulations! You have successfully completed the installation and basic configuration of your EndeavourOS GNOME system.

Your system now has:

- **GNOME desktop** on Wayland
- **PipeWire** audio framework
- **FirewallD** firewall (pre-configured)
- **Yay** AUR helper (pre-installed)
- **Multilib repository** enabled (for 32-bit software)
- **GPU drivers** configured (NVIDIA/AMD/Intel)
- **Optimus support** (for dual-GPU laptops)
- **ASUS laptop tools** (if applicable)
- **Bluetooth** configured
- **Multi-touch gestures** configured
- **GNOME Shell extensions** ready

> **💡 Tip:** Unlike Arch Linux, EndeavourOS provides a complete desktop experience out of the box.

---

### What Makes EndeavourOS Special

| Feature               | Description                                                   |
| --------------------- | ------------------------------------------------------------- |
| **Welcome App**       | Post-install helper for updates, drivers, and community links |
| **Yay pre-installed** | AUR helper ready to use                                       |
| **FirewallD**         | Dynamic firewall with zone support                            |
| **EndeavourOS repos** | Additional packages and themes                                |
| **Active community**  | Friendly forums and Telegram group                            |

---

### What's Next?

#### Immediate Next Steps

| Task                           | Command / Action                        |
| ------------------------------ | --------------------------------------- |
| **Launch Welcome App**         | Find in application menu                |
| **Run system update**          | `sudo pacman -Syu` or `yay -Syu`        |
| **Configure FirewallD**        | Use `firewall-config` GUI               |
| **Set up backups**             | Install `timeshift` for Btrfs snapshots |
| **Configure GNOME Extensions** | Open Extensions app                     |

---

### Ongoing System Maintenance

Like Arch Linux, EndeavourOS is a **rolling release**. Regular maintenance keeps your system secure and stable.

#### Weekly Maintenance (5 minutes)

```bash
# Update all packages
sudo pacman -Syu
yay -Syu

# Remove orphaned packages
sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null

# Clear pacman cache (keep last 2 versions)
sudo paccache -r
```

#### Monthly Maintenance (10 minutes)

```bash
# Check for broken symlinks
sudo find /usr/lib -type l -xtype l -ls

# Review pacman logs
tail -n 100 /var/log/pacman.log | grep -i error

# Check for .pacnew files
sudo find /etc -name "*.pacnew" -ls
```

#### Before Major Updates

**Always check Arch Linux News:**

```bash
firefox https://archlinux.org/news/
```

---

### EndeavourOS vs Arch: Quick Comparison

| Aspect             | EndeavourOS               | Arch Linux             |
| ------------------ | ------------------------- | ---------------------- |
| **Installation**   | Calamares GUI             | Manual (pacstrap)      |
| **Desktop**        | Pre-configured GNOME      | Minimal (you build it) |
| **AUR helper**     | Yay pre-installed         | Install Paru manually  |
| **Firewall**       | FirewallD (pre-installed) | UFW (you install)      |
| **Welcome app**    | Yes                       | No                     |
| **Learning curve** | Beginner-friendly         | Advanced               |

> **💡 Tip:** If you enjoyed EndeavourOS but want more control, try my [Arch Linux Installation Guide](./arch-install.md).

---

### Learning Resources

| Resource                                               | Purpose                            |
| ------------------------------------------------------ | ---------------------------------- |
| [EndeavourOS Wiki](https://discovery.endeavouros.com/) | Official EndeavourOS documentation |
| [EndeavourOS Forums](https://forum.endeavouros.com/)   | Community support                  |
| [EndeavourOS Telegram](https://t.me/endeavouros)       | Live chat support                  |
| [Arch Wiki](https://wiki.archlinux.org/)               | Deep technical documentation       |
| [GNOME Extensions](https://extensions.gnome.org/)      | Browse and install extensions      |

---

### Congratulations – You're Now an EndeavourOS User

You've completed the installation and basic configuration of EndeavourOS GNOME. What you have now is a **polished, Arch-based system** that balances ease of use with flexibility.

> 🙃 **Unfortunately, you can't say "I use Arch BTW" anymore.**
> _You're one step removed. But hey, you still have the AUR!_

**What makes EndeavourOS great:**

- **Arch underneath** – Same power, rolling releases, AUR access
- **Friendly installer** – No manual partition dance
- **Helpful community** – No "RTFM" culture
- **Pre-configured but not bloated** – Just enough to be usable

**Final advice:**

- Read the [EndeavourOS Wiki](https://discovery.endeavouros.com/) before asking for help
- Join the community forums – be helpful, be respectful
- **Do not run partial updates** (`pacman -Sy` without `-u`)
- **Check the EndeavourOS blog** for distribution-specific news
- Have fun exploring the AUR!

Enjoy your new EndeavourOS system!

> _"Endeavour to explore, Arch to the core." – Community motto_
