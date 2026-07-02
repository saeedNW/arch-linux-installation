# EndeavourOS KDE Installation Guide

> **📝 Note:** This guide has been created through my own struggles and trial and error. So make sure to do your own research before proceeding blindly.

Welcome to the EndeavourOS KDE Installation Guide! In this guide, you'll learn how to install **EndeavourOS**, a user-friendly Arch-based Linux distribution designed for both new and experienced users.

EndeavourOS provides a **rolling-release model**, giving you access to the latest software updates and features – just like Arch Linux, but with a streamlined installer and helpful welcome tools.

---

## Table of Contents

- [EndeavourOS KDE Installation Guide](#endeavouros-kde-installation-guide)
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
      - [3.4 Application Selection](#34-application-selection)
      - [3.5 Partitioning](#35-partitioning)
      - [3.6 User Account](#36-user-account)
      - [3.7 Bootloader Selection](#37-bootloader-selection)
      - [3.8 Summary \& Install](#38-summary--install)
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
      - [Step 2: Clone the Paru Repository](#step-2-clone-the-paru-repository)
      - [Step 3: Build and Install Paru](#step-3-build-and-install-paru)
      - [Step 4: Verify Installation](#step-4-verify-installation)
      - [Step 5: Remove Yay (Optional – If Switching Completely)](#step-5-remove-yay-optional--if-switching-completely)
    - [Basic Paru Usage](#basic-paru-usage)
    - [Yay vs Paru: Quick Comparison](#yay-vs-paru-quick-comparison)
  - [GPU Drivers \& Configuration](#gpu-drivers--configuration)
  - [GPU Drivers \& Configuration](#gpu-drivers--configuration-1)
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
    - [Section A: Non-ASUS Optimus Laptops (Dell, Lenovo, HP, etc.)](#section-a-non-asus-optimus-laptops-dell-lenovo-hp-etc)
      - [Installation](#installation)
      - [Optional: GUI for KDE Plasma](#optional-gui-for-kde-plasma)
      - [Enable the Service](#enable-the-service)
      - [Basic Usage](#basic-usage)
      - [Wayland Note](#wayland-note)
    - [Section B: ASUS ROG / TUF Laptops Only](#section-b-asus-rog--tuf-laptops-only)
      - [What About `supergfxctl`?](#what-about-supergfxctl)
      - [Installation (Hardware Control)](#installation-hardware-control)
      - [GPU Switching for ASUS Laptops](#gpu-switching-for-asus-laptops)
      - [Summary for ASUS Users](#summary-for-asus-users)
    - [Verify Graphics Configuration](#verify-graphics-configuration)
  - [WINE Installation](#wine-installation)
    - [How WINE Works](#how-wine-works)
    - [Step 1: Install WINE](#step-1-install-wine)
      - [Basic Installation (WINE Stable)](#basic-installation-wine-stable)
      - [Alternative: WINE Staging (Better Compatibility)](#alternative-wine-staging-better-compatibility)
      - [Install Essential Components](#install-essential-components)
    - [Step 2: Install Winetricks](#step-2-install-winetricks)
    - [Step 3: Optional – Install DXVK (For Gaming)](#step-3-optional--install-dxvk-for-gaming)
    - [Step 4: Configure WINE](#step-4-configure-wine)
      - [Create a WINE Prefix](#create-a-wine-prefix)
      - [WINE Configuration Settings](#wine-configuration-settings)
      - [Set Windows Version via Command Line](#set-windows-version-via-command-line)
    - [Step 5: Test WINE Installation](#step-5-test-wine-installation)
    - [Step 6: Install Common Windows Libraries (via Winetricks)](#step-6-install-common-windows-libraries-via-winetricks)
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
  - [Install Additional Applications (Skip Reinstallation)](#install-additional-applications-skip-reinstallation)
    - [Core KDE Applications (Recommended)](#core-kde-applications-recommended)
    - [VPN Support (L2TP/IPsec)](#vpn-support-l2tpipsec)
    - [Development \& Utilities](#development--utilities)
    - [Phone Integration (KDE Connect)](#phone-integration-kde-connect)
    - [Media Codecs \& Utilities](#media-codecs--utilities)
    - [Setting Yakuake to Autostart](#setting-yakuake-to-autostart)
  - [FirewallD Configuration](#firewalld-configuration)
    - [What is FirewallD?](#what-is-firewalld)
    - [Step 1: Check FirewallD Status](#step-1-check-firewalld-status)
    - [Step 2: Understand FirewallD Zones](#step-2-understand-firewalld-zones)
    - [Step 3: List Active Rules](#step-3-list-active-rules)
    - [Step 4: Add Services (Common Rules)](#step-4-add-services-common-rules)
    - [Step 5: Make Rules Permanent](#step-5-make-rules-permanent)
    - [Step 6: Add Custom Ports (If Service Not Available)](#step-6-add-custom-ports-if-service-not-available)
    - [Step 7: Change Default Zone](#step-7-change-default-zone)
    - [Step 8: Zone Assignment by Interface](#step-8-zone-assignment-by-interface)
    - [Step 9: Rich Rules (Advanced)](#step-9-rich-rules-advanced)
    - [Step 10: GUI Management (firewall-config)](#step-10-gui-management-firewall-config)
    - [Common FirewallD Scenarios](#common-firewalld-scenarios)
      - [Scenario 1: Basic Desktop (Default)](#scenario-1-basic-desktop-default)
      - [Scenario 2: Home Desktop (More Permissive)](#scenario-2-home-desktop-more-permissive)
      - [Scenario 3: Development Workstation](#scenario-3-development-workstation)
      - [Scenario 4: Home Server](#scenario-4-home-server)
    - [Useful FirewallD Commands Cheat Sheet](#useful-firewalld-commands-cheat-sheet)
    - [Troubleshooting](#troubleshooting)
    - [FirewallD vs UFW (Arch vs EndeavourOS)](#firewalld-vs-ufw-arch-vs-endeavouros)
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
| **Desktop environment** | You choose and install manually | KDE Plasma pre-configured                       |
| **AUR helper**          | Install manually (Paru)         | Pre-installed (yay or paru)                     |
| **Welcome app**         | None                            | EndeavourOS welcome app with post-install tools |
| **Theming**             | Vanilla                         | EndeavourOS branding and themes                 |
| **Difficulty**          | Advanced                        | Beginner-friendly (Arch-based)                  |

> **💡 Tip:** If you've already completed my [Arch Linux Installation Guide](./arch-linux.md), you'll find EndeavourOS much easier. The underlying system is still Arch – EndeavourOS just adds a friendly installer and some quality-of-life tools.

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
- Partitioning your disk (Btrfs with subvolumes)
- Installing EndeavourOS with Calamares
- Configuring the bootloader (GRUB)

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

Let's dive into the installation process and unleash the power of EndeavourOS on your machine!

---

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

> **📝 Note:** EndeavourOS uses **PipeWire** (not PulseAudio) and **FirewallD** (not UFW) by default. This differs from my Arch post-install guide. We'll cover FirewallD configuration in a later section.

---

## Downloading EndeavourOS

### Step 1: Download the ISO

1. Visit the official EndeavourOS website: [endeavouros.com](https://endeavouros.com/)
2. Navigate to the **Download** section
3. Choose your preferred edition:
   - **Online installer** (recommended) – Smaller download, fetches latest packages during installation
   - **Offline installer** – Larger download, includes all packages (good for offline installs)

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

During installation, you can choose:

| Bootloader       | Best for                                                     |
| ---------------- | ------------------------------------------------------------ |
| **GRUB**         | All systems (legacy and UEFI), dual-booting, Btrfs snapshots |
| **systemd-boot** | Modern UEFI systems only (simpler, faster)                   |

> **💡 Recommendation:** Choose **GRUB** unless you have a specific reason to use systemd-boot. GRUB works better with Btrfs snapshots (grub-btrfs).

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

| Installation Type | What It Does                                        | Best For                               |
| ----------------- | --------------------------------------------------- | -------------------------------------- |
| **Offline**       | Installs KDE Plasma directly (no internet required) | Slow connections, offline installs     |
| **Online**        | Downloads latest packages during install            | Freshest software, custom DE selection |

> **📝 Note:** The offline installer now uses **KDE Plasma** (not Xfce as some older guides mention).

#### 3.4 Application Selection

Here you can deselect default applications you don't want. We'll install better alternatives later.

**Recommended to deselect (install alternatives after setup):**

| Default App  | Category     | Better Alternative |
| ------------ | ------------ | ------------------ |
| **Gwenview** | Image viewer | **Qview**          |
| **Haruna**   | Video player | **VLC** or **MPV** |
| **Elisa**    | Music player | **Amberol**        |

#### 3.5 Partitioning

Choose the option that matches your setup:

| Option                  | When to Use                                                     | Risk Level               |
| ----------------------- | --------------------------------------------------------------- | ------------------------ |
| **Erase disk**          | Fresh install on empty drive, or you want to wipe everything    | High (all data lost)     |
| **Install alongside**   | Dual-booting with Windows or another Linux distro on same drive | Low (automatic resizing) |
| **Manual partitioning** | Advanced users who want custom layout (e.g., Btrfs subvolumes)  | High (user responsible)  |

> **⚠️ Important:** It is **strongly recommended** to format the root partition as **Btrfs** (not ext4). This enables snapshots (via Timeshift or Snapper), allowing you to roll back system updates if something breaks.

**If choosing Manual Partitioning (Btrfs layout):**

| Partition | Size             | Type       | Mount point | Format |
| --------- | ---------------- | ---------- | ----------- | ------ |
| EFI       | 512MB            | FAT32      | `/boot/efi` | Yes    |
| Swap      | 8GB (or RAM × 2) | Linux swap | `swap`      | Yes    |
| Root      | Remaining space  | Btrfs      | `/`         | Yes    |

Then create Btrfs subvolumes (similar to the Arch guide):

- `@` (root)
- `@home`
- `@var`
- `@opt`
- `@tmp`
- `@.snapshots`

> **📝 Note:** The Calamares GUI may not support manual Btrfs subvolume creation. If you want this level of control, consider using the manual Arch installation method instead, or create subvolumes after installation.

#### 3.6 User Account

- Enter your **username** and **password**
- Choose a **computer name** (hostname)
- Optionally enable **automatic login** (not recommended for laptops)

#### 3.7 Bootloader Selection

| Bootloader       | Best for                                                 |
| ---------------- | -------------------------------------------------------- |
| **GRUB**         | All systems, dual-booting, Btrfs snapshots (recommended) |
| **systemd-boot** | Modern UEFI systems only (simpler, faster boot)          |

> **💡 Recommendation:** Choose **GRUB** unless you have a specific reason to use systemd-boot.

#### 3.8 Summary & Install

- Review your selections
- Click **Install Now**
- Wait for the installation to complete (5-15 minutes depending on speed)

---

### Step 4: Post-Installation

1. When finished, click **Restart Now**
2. **Remove the USB drive** when prompted
3. Boot into your new EndeavourOS system

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

Alternatively, search for a specific 32-bit package:

```bash
pacman -Ss lib32-
```

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

> **📝 Note:** If Git is already installed, this command will either do nothing or update it to the latest version.

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

This command updates the user's timestamp without running a command. If no error appears, sudo is working.

Test with an actual command:

```bash
sudo pacman -Syu
```

You should be prompted for your password, and the command should run.

---

### Optional: Passwordless sudo (Not Recommended)

If you want to allow `wheel` group members to run sudo **without entering a password** (useful for automation, but less secure), uncomment this line instead:

```plaintext
%wheel ALL=(ALL:ALL) NOPASSWD: ALL
```

> **⚠️ Security Warning:** Passwordless sudo significantly reduces security. Only use this on personal, non-exposed systems or for specific commands.

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

> **ℹ️ Note:** Yay accepts most `pacman` flags. AUR packages are downloaded, built, and installed just like official packages.

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

To update **only Yay** (rarely needed):

```bash
yay -S yay
```

---

### Option B: Install Paru (Alternative to Yay)

[Paru](https://github.com/Morganamilo/paru) is another popular AUR helper. It's the one used in my Arch guide. If you prefer Paru over Yay, follow these steps.

> **⚠️ Note:** You don't need both Yay and Paru. Choose one. If you install Paru, consider removing Yay (see Step 5 below).

#### Prerequisites

Ensure you have the necessary build tools and `git` installed:

```bash
sudo pacman -S --needed base-devel git
```

#### Step 1: Create a Build Directory

```bash
mkdir -p ~/builds
cd ~/builds
```

> **💡 Tip:** Keeping AUR builds in a dedicated directory prevents cluttering your home folder.

#### Step 2: Clone the Paru Repository

```bash
git clone https://aur.archlinux.org/paru.git
cd paru
```

#### Step 3: Build and Install Paru

```bash
makepkg -si
```

**Flag explanations:**

- `-s` – Install missing dependencies (using `pacman`)
- `-i` – Install the package after successful build

#### Step 4: Verify Installation

```bash
paru --version
```

Expected output: `paru x.x.x - libalpm vxx.x.x`

#### Step 5: Remove Yay (Optional – If Switching Completely)

If you prefer Paru and want to remove Yay:

```bash
sudo pacman -Rns yay
```

> **⚠️ Warning:** Make sure Paru is working correctly before removing Yay. You'll need an AUR helper for future AUR package management.

---

### Basic Paru Usage

| Task                            | Command                                          |
| ------------------------------- | ------------------------------------------------ |
| Update system + AUR packages    | `paru -Syu`                                      |
| Install a package (repo or AUR) | `paru -S <package>`                              |
| Remove a package                | `paru -R <package>` (or `-Rns` for full removal) |
| Search for packages             | `paru -Ss <search term>`                         |
| Show package info               | `paru -Si <package>`                             |
| Clean unused dependencies       | `paru -Yc`                                       |

> **ℹ️ Note:** Paru accepts most `pacman` flags, just like Yay.

---

### Yay vs Paru: Quick Comparison

| Feature                           | Yay                         | Paru                       |
| --------------------------------- | --------------------------- | -------------------------- |
| **Pre-installed on EndeavourOS?** | ✅ Yes                      | ❌ No                      |
| **Written in**                    | Go                          | Rust                       |
| **Default behavior**              | Interactive                 | Interactive                |
| **Package search**                | `yay -Ss`                   | `paru -Ss`                 |
| **Performance**                   | Fast                        | Very fast                  |
| **Configuration**                 | `~/.config/yay/config.json` | `~/.config/paru/paru.conf` |

> **💡 Recommendation:** Stick with **Yay** – it's pre-installed, well-tested on EndeavourOS, and works perfectly. Only switch to Paru if you have a specific reason (e.g., familiarity from Arch, or preference for Rust-based tools).

---

## GPU Drivers & Configuration

This section covers installing GPU drivers and configuring graphics switching for laptops.

> **📝 Prerequisite:** Ensure the [multilib repository is enabled](#enable-multilib-repository) before installing 32-bit libraries.

## GPU Drivers & Configuration

This section covers installing GPU drivers and configuring graphics switching for laptops.

> **📝 Prerequisite:** Ensure the [multilib repository is enabled](#enable-multilib-repository) before installing 32-bit libraries.

---

### NVIDIA GPUs

#### Check Current Drivers

EndeavourOS may have already installed NVIDIA drivers during setup (especially if you chose the NVIDIA installer). Verify:

```bash
nvidia-smi
```

If this shows driver information, NVIDIA drivers are already installed. Skip to [GPU Switching for Laptops](#gpu-switching-for-laptops) if you have a dual-GPU laptop.

---

#### Identify Your GPU

```bash
lspci -k | grep -A 2 -E "(VGA|3D)"
```

Example output:

```plaintext
01:00.0 VGA compatible controller: NVIDIA Corporation GA106 [GeForce RTX 3060]
```

---

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

> **💡 Tip for older GPUs:** If you have a legacy GPU (GTX 600-700 series), check the [NVIDIA legacy driver list](https://nvidia.custhelp.com/app/answers/detail/a_id/3473/) for compatible drivers, which may be available in the AUR.

---

### Manual NVIDIA Driver (Not Recommended)

> **⚠️ Warning:** Manual `.run` files from NVIDIA's website **are not compatible with pacman** and will break your system after kernel updates. Do not use this method.

---

### AMD GPUs

### Identify Your AMD GPU

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

## Intel GPUs

```bash
sudo pacman -S mesa vulkan-intel
```

For very old Intel GPUs (pre-2007), use `xf86-video-vesa` as fallback.

---

## GPU Switching for Laptops

> **⚠️ Note:** Only follow this if you have a laptop with both Intel integrated graphics and an NVIDIA discrete GPU.

Choose the section that matches your hardware.

---

### Section A: Non-ASUS Optimus Laptops (Dell, Lenovo, HP, etc.)

**Use `optimus-manager`** – a universal solution that works on any NVIDIA Optimus laptop.

#### Installation

```bash
yay -S optimus-manager
```

#### Optional: GUI for KDE Plasma

```bash
yay -S optimus-manager-qt
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

After installation, verify your setup:

```bash
# Check which GPU is active
glxinfo | grep "OpenGL renderer"

# Check NVIDIA driver (if applicable)
nvidia-smi

# Check Wayland session
echo $XDG_SESSION_TYPE
```

---

## WINE Installation

WINE (Wine Is Not an Emulator) is a compatibility layer that allows you to run Windows applications on Linux. It translates Windows API calls into POSIX calls on the fly.

> **📝 Prerequisite:** Ensure the [multilib repository is enabled](#enable-multilib-repository). WINE requires 32-bit libraries to run most Windows applications.

---

### How WINE Works

| Component      | Purpose                                                           |
| -------------- | ----------------------------------------------------------------- |
| **WINE core**  | Translates Windows API to Linux syscalls                          |
| **wine-gecko** | HTML rendering engine (replaces Internet Explorer)                |
| **wine-mono**  | .NET Framework implementation                                     |
| **Winetricks** | Helper script to install common DLLs and runtime components       |
| **DXVK**       | DirectX 9/10/11 to Vulkan translation (better gaming performance) |

---

### Step 1: Install WINE

#### Basic Installation (WINE Stable)

```bash
sudo pacman -S wine
```

This installs the stable version of WINE with basic dependencies.

#### Alternative: WINE Staging (Better Compatibility)

`wine-staging` includes experimental patches for newer Windows applications:

```bash
sudo pacman -S wine-staging
```

> **💡 Recommendation:** Use `wine-staging` for gaming or recent Windows software. Use `wine` for stability-critical setups.

#### Install Essential Components

```bash
sudo pacman -S wine-gecko wine-mono
```

- `wine-gecko` – Required for applications that embed web content
- `wine-mono` – Required for .NET Framework-based applications

---

### Step 2: Install Winetricks

Winetricks simplifies installing common Windows libraries (DirectX, Visual C++ runtimes, etc.):

```bash
sudo pacman -S winetricks
```

---

### Step 3: Optional – Install DXVK (For Gaming)

DXVK translates DirectX 9/10/11 to Vulkan, significantly improving gaming performance.

```bash
sudo pacman -S dxvk-bin
```

Or install from source (longer build time):

```bash
sudo pacman -S dxvk
```

To enable DXVK for a specific WINE prefix:

```bash
winetricks dxvk
```

> **ℹ️ Note:** DXVK requires Vulkan-capable graphics drivers. Verify with `vulkaninfo | grep deviceName`.

---

### Step 4: Configure WINE

#### Create a WINE Prefix

A WINE prefix is a directory that mimics a Windows C: drive. By default, it's `~/.wine`. Create a 64-bit prefix:

```bash
winecfg
```

This command creates the default prefix if it doesn't exist and opens the configuration window.

For a **32-bit only prefix** (required for some older applications):

```bash
WINEPREFIX=~/wine32 WINEARCH=win32 winecfg
```

> **💡 Tip:** Use separate prefixes for different applications to avoid conflicts.

#### WINE Configuration Settings

In the `winecfg` window:

| Tab              | Recommended Setting                                                      |
| ---------------- | ------------------------------------------------------------------------ |
| **Applications** | Windows version: Windows 10 or Windows 11                                |
| **Libraries**    | Add DLL overrides for problematic libraries (e.g., `d3d10core`, `d3d11`) |
| **Graphics**     | Enable "Emulate a virtual desktop" for troublesome fullscreen apps       |
| **Drives**       | Auto-detect drives or add custom drive mappings                          |

#### Set Windows Version via Command Line

```bash
winecfg -v win10
```

Available versions: `win10`, `win81`, `win7`, `vista`, `winxp`.

---

### Step 5: Test WINE Installation

Run a simple Windows application or the built-in WINE utilities:

```bash
# Launch WINE's Notepad equivalent
wine notepad

# Launch WINE's registry editor
wine regedit

# Check WINE version
wine --version
```

If these launch successfully, WINE is working.

---

### Step 6: Install Common Windows Libraries (via Winetricks)

Many Windows applications require additional libraries. Run Winetricks:

```bash
winetricks
```

Select from the menu:

- **Install a Windows DLL** – Common choices: `dotnet48`, `vcrun2019`, `d3dx9`, `d3dx11`
- **Install a Windows application** – Steam, Notepad++, 7-Zip, etc.

**Command-line examples:**

```bash
# Install Visual C++ 2019 runtimes
winetricks vcrun2019

# Install DirectX 9 (for older games)
winetricks d3dx9

# Install .NET Framework 4.8 (slow, requires internet)
winetricks dotnet48

# Install all common runtimes (for gaming)
winetricks corefonts vcrun2019 dxvk
```

> **⚠️ Warning:** Installing `.NET Framework` via winetricks can take 10-30 minutes and may fail. If it fails, retry or use `wine-mono` instead.

---

### GUI Frontends for WINE

These tools simplify managing multiple WINE prefixes and configurations:

| Frontend        | Installation                 | Use Case                                 |
| --------------- | ---------------------------- | ---------------------------------------- |
| **Bottles**     | `paru -S bottles`            | Modern GTK-based, easy prefix management |
| **PlayOnLinux** | `sudo pacman -S playonlinux` | Gaming-focused, scripted installs        |
| **Q4Wine**      | `sudo pacman -S q4wine`      | Qt-based, advanced settings              |
| **Lutris**      | `sudo pacman -S lutris`      | Gaming platform with WINE integration    |

> **💡 Recommendation:** For gaming, use **Lutris**. For general Windows apps, use **Bottles**.

---

### Common WINE Environment Variables

| Variable           | Purpose                        | Example                                           |
| ------------------ | ------------------------------ | ------------------------------------------------- |
| `WINEPREFIX`       | Specify prefix location        | `WINEPREFIX=~/myapp wine setup.exe`               |
| `WINEARCH`         | Set architecture (win32/win64) | `WINEARCH=win32 winecfg`                          |
| `WINEDEBUG`        | Enable debug output            | `WINEDEBUG=+loaddll wine app.exe`                 |
| `WINEDLLOVERRIDES` | Override specific DLLs         | `WINEDLLOVERRIDES="mscoree,mshtml=" wine app.exe` |

---

### Apply NVENC and NvFBC Patches for Nvidia Drivers

> **🔧 This section is for NVIDIA GPU users only.**

NVENC is NVIDIA's hardware video encoder (used by OBS, Discord, FFmpeg, etc.). By default, NVIDIA limits consumer GPUs to **3 simultaneous NVENC sessions**. The NvFBC (Frame Buffer Capture) patch enables faster screen capture methods.

**What these patches do:**

| Patch          | Purpose                                               | Use Case                                                              |
| -------------- | ----------------------------------------------------- | --------------------------------------------------------------------- |
| `patch.sh`     | Removes NVENC session limit                           | Streaming to multiple platforms, recording + streaming simultaneously |
| `patch-fbc.sh` | Enables NvFBC (normally limited to Quadro/Grid cards) | OBS Game Capture, low-latency screen capture                          |

> **⚠️ Legal & Stability Warning:**
>
> - These patches **may violate NVIDIA's EULA** for consumer GPUs. Use at your own risk.
> - Patches are **driver-version specific**. Applying the wrong version can break hardware encoding.
> - You must **reapply the patch after every NVIDIA driver update**.

---

#### Prerequisites

Ensure `git` is installed:

```bash
sudo pacman -S git
```

Check your current NVIDIA driver version:

```bash
nvidia-smi --query-gpu=driver_version --format=csv,noheader
```

Example output: `570.86.16`

Visit the [nvidia-patch releases page](https://github.com/keylase/nvidia-patch#version-table) to verify your driver version is supported.

---

#### Installation

Clone the repository and apply the patches:

```bash
cd ~/Downloads
git clone https://github.com/keylase/nvidia-patch.git
cd nvidia-patch
```

**Apply NVENC patch (removes session limit):**

```bash
bash ./patch.sh
```

**Apply NvFBC patch (enables Frame Buffer Capture):**

```bash
bash ./patch-fbc.sh
```

> **💡 Tip:** If you only need NVENC (not NvFBC), skip the second command.

---

#### Verification

After applying the patches, verify they are active:

**Check NVENC patch status:**

```bash
bash ./patch.sh -c
```

Expected output: `"Patched"` or similar confirmation.

**Check NvFBC patch status:**

```bash
bash ./patch-fbc.sh -c
```

You can also test NVENC directly with FFmpeg:

```bash
ffmpeg -f lavfi -i testsrc -c:v h264_nvenc -f null - -t 10 -y
```

If successful, FFmpeg will encode without complaining about session limits.

---

#### Uninstalling / Reverting the Patch

To restore the original NVIDIA driver files:

```bash
cd ~/Downloads/nvidia-patch
bash ./patch.sh -r
bash ./patch-fbc.sh -r
```

> **📝 Note:** Reverting requires you to have kept the `nvidia-patch` directory. Alternatively, reinstall the NVIDIA driver package:
>
> ```bash
> sudo pacman -S nvidia nvidia-utils
> ```

---

#### After Driver Updates

NVIDIA driver updates **overwrite the patched files**. You must reapply the patches after every driver update:

```bash
cd ~/Downloads/nvidia-patch
git pull                              # Get latest patch version
bash ./patch.sh
bash ./patch-fbc.sh
```

> **💡 Tip:** Consider creating a Pacman hook to reapply the patch automatically after NVIDIA driver updates. See [Arch Wiki: Pacman hooks](https://wiki.archlinux.org/title/Pacman#Hooks).

---

#### Do You Really Need This?

| Use Case                                        | Do you need the patch?                       |
| ----------------------------------------------- | -------------------------------------------- |
| Casual streaming (single platform)              | **No** – 3 NVENC sessions are enough         |
| Streaming + recording simultaneously            | **Maybe** – You may hit the limit            |
| Multiple streaming platforms (Twitch + YouTube) | **Yes** – You likely need more sessions      |
| OBS Game Capture with NVENC                     | **Only if OBS reports "session limit"**      |
| Professional / commercial use                   | **Not recommended** – violates NVIDIA's EULA |

Most users **do not need this patch**.

---

### Enable Bluetooth

This section covers installing, enabling, and using Bluetooth on Arch Linux with KDE Plasma.

---

#### Step 1: Install Bluetooth Packages

Install the core Bluetooth stack and utilities:

```bash
sudo pacman -S bluez bluez-utils
```

**Package summary:**

- `bluez` – Official Linux Bluetooth stack
- `bluez-utils` – Command-line tools (`bluetoothctl`, `rfkill`, etc.)

**For KDE Plasma (optional but recommended):**

```bash
sudo pacman -S bluedevil
```

`bluedevil` is KDE's Bluetooth management GUI. It integrates with the system tray and provides a user-friendly interface for pairing and managing devices.

> **💡 Tip:** If you're using GNOME, install `gnome-bluetooth` instead. For other desktops, `blueman` is a good GTK-based alternative.

---

#### Step 2: Load the Bluetooth Driver

Check if the `btusb` driver (generic USB Bluetooth driver) is already loaded:

```bash
lsmod | grep btusb
```

**Expected output (if loaded):**

```plaintext
btusb                  65536  0
btrtl                  24576  1 btusb
btbcm                  24576  1 btusb
btintel                40960  1 btusb
```

**If no output appears**, load the driver manually:

```bash
sudo modprobe btusb
```

To make the driver load automatically at boot, create a configuration file:

```bash
echo "btusb" | sudo tee /etc/modules-load.d/bluetooth.conf
```

---

#### Step 3: Enable and Start the Bluetooth Service

Enable the service to start automatically on boot and start it immediately:

```bash
sudo systemctl enable --now bluetooth.service
```

> **ℹ️ Note:** The `--now` flag enables and starts the service in a single command. No separate `start` command is needed.

Verify the service is running:

```bash
systemctl status bluetooth.service
```

Look for `active (running)` in the output.

---

#### Step 4: Check Bluetooth Adapter Status

List available Bluetooth adapters:

```bash
bluetoothctl list
```

Example output:

```plaintext
Controller XX:XX:XX:XX:XX:XX myhostname [default]
```

Check if Bluetooth is blocked by rfkill (common on laptops with hardware switches):

```bash
rfkill list
```

Look for a line like:

```plaintext
1: hci0: Bluetooth
    Soft blocked: yes
    Hard blocked: no
```

If `Soft blocked: yes`, unblock it:

```bash
rfkill unblock bluetooth
```

---

#### Step 5: Verify Bluetooth is Working

Check the Bluetooth service status:

```bash
systemctl status bluetooth
```

List connected devices:

```bash
bluetoothctl devices
```

Check Bluetooth adapter info:

```bash
hciconfig -a
```

> **ℹ️ Note:** If `hciconfig` is not found, install `bluez-utils-compat` from AUR or use `bluetoothctl show` instead.

---

## Install Additional Applications (Skip Reinstallation)

EndeavourOS KDE comes with a minimal set of applications. Here are additional packages you may find useful.

> **💡 Tip:** Use `--needed` to skip already-installed packages, saving time and bandwidth.

---

### Core KDE Applications (Recommended)

These applications integrate well with KDE Plasma and are useful for most users.

```bash
sudo pacman -S --needed ark spectacle yakuake partitionmanager kolourpaint kwalletmanager kaccounts-providers kio-gdrive
```

| Package                 | Purpose                                          |
| ----------------------- | ------------------------------------------------ |
| **ark**                 | Archive manager (extract zip, tar, rar, etc.)    |
| **spectacle**           | Screenshot tool (supports Wayland)               |
| **yakuake**             | Drop-down terminal emulator (Quake-style)        |
| **partitionmanager**    | Graphical disk partition manager                 |
| **kolourpaint**         | Simple paint application (similar to MS Paint)   |
| **kwalletmanager**      | KDE's password manager (manages credentials)     |
| **kaccounts-providers** | Authentication providers for online accounts     |
| **kio-gdrive**          | Google Drive integration in Dolphin file manager |

---

### VPN Support (L2TP/IPsec)

If you need to connect to L2TP/IPsec VPNs (common in corporate environments):

```bash
sudo pacman -S --needed networkmanager-l2tp strongswan
```

After installation, restart NetworkManager:

```bash
sudo systemctl restart NetworkManager
```

Then add your VPN connection in System Settings → Connections.

---

### Development & Utilities

| Package                 | Purpose                                       | Recommended?                         |
| ----------------------- | --------------------------------------------- | ------------------------------------ |
| **kdesdk-thumbnailers** | Thumbnails for source code files in Dolphin   | Optional (developers only)           |
| **android-tools**       | ADB and Fastboot for Android device debugging | Optional (Android developers only)   |
| **thunderbird**         | Email client (KDE has KMail by default)       | Optional (if you prefer Thunderbird) |

```bash
# Install all development utilities (optional)
sudo pacman -S --needed kdesdk-thumbnailers android-tools thunderbird
```

---

### Phone Integration (KDE Connect)

KDE Connect syncs your Android phone with your desktop – notifications, SMS, file sharing, remote control, and more.

```bash
sudo pacman -S --needed kdeconnect
```

> **💡 Tip:** Install KDE Connect on your Android phone from Google Play or F-Droid, then pair the devices.

---

### Media Codecs & Utilities

For broader media compatibility:

```bash
sudo pacman -S --needed ffmpegthumbs
```

`ffmpegthumbs` generates thumbnails for video files in Dolphin.

---

### Setting Yakuake to Autostart

If you installed Yakuake, add it to startup applications:

1. Open **System Settings** → **Startup and Shutdown** → **Autostart**
2. Click **Add Program** → search for **Yakuake**
3. Select it and click **OK**

Or via command line:

```bash
mkdir -p ~/.config/autostart
cp /usr/share/applications/org.kde.yakuake.desktop ~/.config/autostart/
```

> **💡 Tip:** Press `F12` (default hotkey) to show/hide Yakuake after launch.

---

## FirewallD Configuration

EndeavourOS comes with **FirewallD** pre-installed – a dynamic firewall manager with support for zones, services, and rich rules. Unlike UFW (used in my Arch guide), FirewallD is more feature-rich and better suited for desktop users who need flexibility.

> **💡 Tip:** FirewallD is already installed on EndeavourOS. You don't need to install it manually.

---

### What is FirewallD?

| Feature                 | Description                                                           |
| ----------------------- | --------------------------------------------------------------------- |
| **Dynamic rules**       | Changes take effect immediately without restarting the service        |
| **Zones**               | Different security levels for different networks (home, public, work) |
| **Runtime & permanent** | Test rules temporarily before making them permanent                   |
| **GUI available**       | `firewall-config` for graphical management                            |

---

### Step 1: Check FirewallD Status

Verify that FirewallD is installed and running:

```bash
sudo systemctl status firewalld
```

If it's not running, start and enable it:

```bash
sudo systemctl enable --now firewalld
```

---

### Step 2: Understand FirewallD Zones

Zones define trust levels for different networks. Check your current default zone:

```bash
firewall-cmd --get-default-zone
```

List all available zones:

```bash
firewall-cmd --get-zones
```

| Zone                 | Trust Level | Typical Use                                      |
| -------------------- | ----------- | ------------------------------------------------ |
| **public** (default) | Low         | Untrusted public networks (coffee shop, airport) |
| **home**             | Medium      | Trusted home network                             |
| **work**             | Medium      | Trusted office network                           |
| **internal**         | High        | Internal corporate network                       |
| **trusted**          | Full        | All traffic allowed (use with caution)           |
| **drop**             | None        | All incoming traffic dropped (stealth mode)      |
| **block**            | None        | All incoming traffic rejected with ICMP response |

---

### Step 3: List Active Rules

View all rules for the default zone:

```bash
firewall-cmd --list-all
```

Example output:

```plaintext
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: wlan0
  sources:
  services: dhcpv6-client ssh
  ports:
  protocols:
  forward: no
  masquerade: no
  rich rules:
```

---

### Step 4: Add Services (Common Rules)

FirewallD uses **services** (predefined port/protocol combinations) rather than raw ports. List available services:

```bash
firewall-cmd --get-services
```

**Add common services:**

| Service         | Port        | Use Case          | Command                                      |
| --------------- | ----------- | ----------------- | -------------------------------------------- |
| **SSH**         | 22/TCP      | Remote access     | `sudo firewall-cmd --add-service=ssh`        |
| **HTTP**        | 80/TCP      | Web server        | `sudo firewall-cmd --add-service=http`       |
| **HTTPS**       | 443/TCP     | Web server        | `sudo firewall-cmd --add-service=https`      |
| **Samba**       | 137-139,445 | File sharing      | `sudo firewall-cmd --add-service=samba`      |
| **CUPS**        | 631/TCP     | Network printing  | `sudo firewall-cmd --add-service=cups`       |
| **KDE Connect** | 1714-1764   | Phone integration | `sudo firewall-cmd --add-service=kdeconnect` |

> **⚠️ Warning:** Adding services without `--permanent` creates a **runtime-only** rule that disappears after reboot. See Step 5 below.

---

### Step 5: Make Rules Permanent

FirewallD has two rule sets:

- **Runtime** – Takes effect immediately, lost after reboot
- **Permanent** – Survives reboot, requires reload to take effect

**Best practice workflow:**

```bash
# Add a runtime rule (test it works)
sudo firewall-cmd --add-service=ssh

# If it works, make it permanent
sudo firewall-cmd --runtime-to-permanent

# OR add directly to permanent (requires reload)
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --reload
```

---

### Step 6: Add Custom Ports (If Service Not Available)

If a service isn't predefined, add a port directly:

```bash
# Add a port (runtime)
sudo firewall-cmd --add-port=8080/tcp

# Make permanent
sudo firewall-cmd --runtime-to-permanent
```

Remove a port:

```bash
sudo firewall-cmd --remove-port=8080/tcp
sudo firewall-cmd --runtime-to-permanent
```

---

### Step 7: Change Default Zone

Set a different default zone for all interfaces:

```bash
# Check current default zone
firewall-cmd --get-default-zone

# Change to home zone
sudo firewall-cmd --set-default-zone=home
```

> **💡 Tip:** At home, use `home` zone (more permissive). On public Wi-Fi, switch to `public` zone (restrictive).

---

### Step 8: Zone Assignment by Interface

Assign different zones to different network interfaces:

```bash
# Assign wlan0 to home zone
sudo firewall-cmd --zone=home --change-interface=wlan0

# Assign eth0 to work zone
sudo firewall-cmd --zone=work --change-interface=eth0

# Make permanent
sudo firewall-cmd --runtime-to-permanent
```

View interface assignments:

```bash
firewall-cmd --get-active-zones
```

---

### Step 9: Rich Rules (Advanced)

Rich rules offer fine-grained control (specific IPs, protocols, logging).

**Allow a specific IP address:**

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" accept'
```

**Block a specific IP:**

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.200" reject'
```

**Allow SSH only from local network:**

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" service name="ssh" accept'
```

**Log dropped packets:**

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="10.0.0.0/8" log prefix="DROP" level="info" drop'
```

Make permanent with `--runtime-to-permanent`.

---

### Step 10: GUI Management (firewall-config)

For a graphical interface, install `firewall-config`:

```bash
sudo pacman -S firewall-config
```

Launch from application menu as **"Firewall Configuration"**.

The GUI provides:

- Zone management
- Service toggles
- Port configuration
- Rich rule editor
- Runtime vs permanent visualization

> **💡 Tip:** The GUI is helpful for beginners to visualize zone assignments and active rules.

---

### Common FirewallD Scenarios

#### Scenario 1: Basic Desktop (Default)

EndeavourOS comes with this by default. Suitable for most users:

```bash
# Default zone: public
# No incoming services allowed except dhcpv6-client
```

#### Scenario 2: Home Desktop (More Permissive)

```bash
# Switch to home zone
sudo firewall-cmd --set-default-zone=home

# Allow KDE Connect (phone integration)
sudo firewall-cmd --add-service=kdeconnect

# Allow SSH (temporary for file transfer)
sudo firewall-cmd --add-service=ssh

sudo firewall-cmd --runtime-to-permanent
```

#### Scenario 3: Development Workstation

```bash
# Keep public zone
sudo firewall-cmd --set-default-zone=public

# Allow specific ports for development
sudo firewall-cmd --add-port=3000/tcp   # React/Node.js dev server
sudo firewall-cmd --add-port=8000/tcp   # Python/Django
sudo firewall-cmd --add-port=8080/tcp   # Java/Tomcat
sudo firewall-cmd --add-port=5432/tcp   # PostgreSQL

sudo firewall-cmd --runtime-to-permanent
```

#### Scenario 4: Home Server

```bash
# Use home zone as base
sudo firewall-cmd --set-default-zone=home

# Add server services
sudo firewall-cmd --add-service=http
sudo firewall-cmd --add-service=https
sudo firewall-cmd --add-service=ssh
sudo firewall-cmd --add-service=samba

sudo firewall-cmd --runtime-to-permanent
```

---

### Useful FirewallD Commands Cheat Sheet

| Task                        | Command                                              |
| --------------------------- | ---------------------------------------------------- |
| **Status**                  | `sudo systemctl status firewalld`                    |
| **List all rules**          | `sudo firewall-cmd --list-all`                       |
| **List all zones**          | `sudo firewall-cmd --get-zones`                      |
| **List services**           | `sudo firewall-cmd --get-services`                   |
| **Add service (runtime)**   | `sudo firewall-cmd --add-service=<name>`             |
| **Add service (permanent)** | `sudo firewall-cmd --add-service=<name> --permanent` |
| **Remove service**          | `sudo firewall-cmd --remove-service=<name>`          |
| **Add port**                | `sudo firewall-cmd --add-port=<port>/tcp`            |
| **Remove port**             | `sudo firewall-cmd --remove-port=<port>/tcp`         |
| **Make runtime permanent**  | `sudo firewall-cmd --runtime-to-permanent`           |
| **Reload permanent rules**  | `sudo firewall-cmd --reload`                         |
| **Get default zone**        | `firewall-cmd --get-default-zone`                    |
| **Set default zone**        | `sudo firewall-cmd --set-default-zone=<zone>`        |
| **Add rich rule**           | `sudo firewall-cmd --add-rich-rule='<rule>'`         |

---

### Troubleshooting

| Problem                                | Solution                                                                                                  |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `firewall-cmd: command not found`      | FirewallD not installed? `sudo pacman -S firewalld`                                                       |
| Rules not applying                     | Remember `--runtime-to-permanent` or `--reload`                                                           |
| FirewallD not starting                 | `sudo systemctl enable --now firewalld`                                                                   |
| Can't SSH after changing rules         | Add SSH service: `sudo firewall-cmd --add-service=ssh --permanent && sudo firewall-cmd --reload`          |
| Services not showing in list           | Some services need to be added manually as ports                                                          |
| `firewall-config` not launching        | Install it: `sudo pacman -S firewall-config`                                                              |
| Docker containers can't access network | Docker manipulates iptables directly. Add `--add-masquerade` or use `firewalld` with Docker documentation |

---

### FirewallD vs UFW (Arch vs EndeavourOS)

| Aspect                     | FirewallD (EndeavourOS)    | UFW (Arch Guide)        |
| -------------------------- | -------------------------- | ----------------------- |
| **Default on EndeavourOS** | ✅ Yes                     | N/A                     |
| **Default on Arch**        | N/A                        | ❌ No (must install)    |
| **Zones support**          | ✅ Yes                     | ❌ No                   |
| **Dynamic rules**          | ✅ Yes (no restart needed) | ❌ No (requires reload) |
| **Learning curve**         | Moderate                   | Easy                    |
| **GUI available**          | ✅ `firewall-config`       | ✅ `gufw`               |
| **Rich rules**             | ✅ Yes                     | ❌ Limited              |

> **💡 Recommendation:** Stick with **FirewallD** on EndeavourOS – it's pre-installed and well-integrated. Only switch to UFW if you prefer simplicity and are already familiar with it from Arch.

---

## Conclusion

Congratulations! You have successfully completed the installation and basic configuration of your EndeavourOS KDE system.

Your system now has:

- **KDE Plasma desktop** on Wayland
- **PipeWire** audio framework
- **FirewallD** firewall (pre-configured)
- **Yay** AUR helper (pre-installed)
- **Multilib repository** enabled (for 32-bit software)
- **GPU drivers** configured (NVIDIA/AMD/Intel)
- **Optimus support** (for dual-GPU laptops)
- **ASUS laptop tools** (if applicable)
- **Bluetooth** configured
- **Systemd-boot or GRUB** bootloader

> **💡 Tip:** Unlike Arch Linux, EndeavourOS provides a complete desktop experience out of the box. You don't need to install a desktop environment or basic applications manually.

---

### What Makes EndeavourOS Special

| Feature               | Description                                                          |
| --------------------- | -------------------------------------------------------------------- |
| **Welcome App**       | Post-install helper for system updates, drivers, and community links |
| **Yay pre-installed** | AUR helper ready to use                                              |
| **FirewallD**         | Dynamic firewall with zone support                                   |
| **EndeavourOS repos** | Additional packages and themes                                       |
| **Active community**  | Friendly forums and Telegram group                                   |

---

### What's Next?

Now that your system is installed, here are some recommended next steps:

#### Immediate Next Steps

| Task                                | Command / Action                                  |
| ----------------------------------- | ------------------------------------------------- |
| **Launch Welcome App**              | Find "Welcome to EndeavourOS" in application menu |
| **Run system update**               | `sudo pacman -Syu` or `yay -Syu`                  |
| **Check for driver updates**        | Welcome app → Driver Manager                      |
| **Install additional applications** | See recommendations below                         |
| **Configure FirewallD**             | Use `firewall-config` GUI or command line         |
| **Set up backups**                  | Install `timeshift` for Btrfs snapshots           |

---

### Ongoing System Maintenance

Like Arch Linux, EndeavourOS is a **rolling release**. Regular maintenance keeps your system secure and stable.

#### Weekly Maintenance (5 minutes)

```bash
# Update all packages (official repos + AUR)
sudo pacman -Syu
yay -Syu

# Check for orphaned packages
pacman -Qtdq

# Remove orphaned packages (if any)
sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null

# Clear pacman cache (keep last 2 versions)
sudo paccache -r
```

#### Monthly Maintenance (10 minutes)

```bash
# Remove all cached packages (use with caution)
sudo pacman -Scc

# Check for broken symlinks in /usr/lib
sudo find /usr/lib -type l -xtype l -ls

# Review recent pacman logs for errors
tail -n 100 /var/log/pacman.log | grep -i error

# Check for configuration file updates (.pacnew files)
sudo find /etc -name "*.pacnew" -ls
```

#### Before Major Updates

**Always check Arch Linux News before running `pacman -Syu`:**

```bash
# Open in browser
firefox https://archlinux.org/news/
```

Major updates (kernel, glibc, systemd) may require manual intervention. Also check the [EndeavourOS forum announcements](https://forum.endeavouros.com/c/announcements).

---

### EndeavourOS vs Arch: Quick Comparison

| Aspect             | EndeavourOS               | Arch Linux             |
| ------------------ | ------------------------- | ---------------------- |
| **Installation**   | Calamares GUI             | Manual (pacstrap)      |
| **Desktop**        | Pre-configured KDE        | Minimal (you build it) |
| **AUR helper**     | Yay pre-installed         | Install Paru manually  |
| **Firewall**       | FirewallD (pre-installed) | UFW (you install)      |
| **Welcome app**    | Yes                       | No                     |
| **Learning curve** | Beginner-friendly         | Advanced               |
| **Control**        | High (Arch underneath)    | Total                  |

> **💡 Tip:** If you enjoyed EndeavourOS but want more control, try my [Arch Linux Installation Guide](./arch-install.md).

---

### Learning Resources

| Resource                                                  | Purpose                                                   |
| --------------------------------------------------------- | --------------------------------------------------------- |
| [EndeavourOS Wiki](https://discovery.endeavouros.com/)    | **Official EndeavourOS documentation**                    |
| [EndeavourOS Forums](https://forum.endeavouros.com/)      | Community support                                         |
| [EndeavourOS Telegram](https://t.me/endeavouros)          | Live chat support                                         |
| [Arch Wiki](https://wiki.archlinux.org/)                  | **Deep technical documentation** (most Arch Wiki applies) |
| [Arch Linux News](https://archlinux.org/news/)            | Check before major updates                                |
| [EndeavourOS GitHub](https://github.com/endeavouros-team) | Source code and development                               |

---

### Congratulations – You're Now an EndeavourOS User

You've completed the installation and basic configuration of EndeavourOS KDE. What you have now is a **polished, Arch-based system** that balances ease of use with flexibility.

> **😏 Unfortunately, you can't say "I use Arch BTW" anymore.**
> _You're one step removed. But hey, you still have the AUR!_

**What makes EndeavourOS great:**

- **Arch underneath** – Same power, rolling releases, AUR access
- **Friendly installer** – No manual partition dance (unless you want it)
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
