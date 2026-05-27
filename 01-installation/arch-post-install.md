# Arch Linux Post-Installation Guide

## Table of Contents

- [Arch Linux Post-Installation Guide](#arch-linux-post-installation-guide)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [What This Guide Covers](#what-this-guide-covers)
  - [How to Use This Guide](#how-to-use-this-guide)
  - [Connect to a Wireless Network](#connect-to-a-wireless-network)
    - [Step 1: List Available Networks](#step-1-list-available-networks)
    - [Step 2: Connect to a Network](#step-2-connect-to-a-network)
      - [Method A: Interactive (recommended – password not saved in shell history)](#method-a-interactive-recommended--password-not-saved-in-shell-history)
      - [Method B: Direct (use only if you understand the security trade-off)](#method-b-direct-use-only-if-you-understand-the-security-trade-off)
    - [Step 3: Verify the Connection](#step-3-verify-the-connection)
    - [Useful NetworkManager Commands](#useful-networkmanager-commands)
    - [Troubleshooting](#troubleshooting)
    - [Example Walkthrough](#example-walkthrough)
  - [Install Paru (AUR Helper)](#install-paru-aur-helper)
    - [Prerequisites](#prerequisites-1)
    - [Installation Methods](#installation-methods)
    - [Method 1: Clone and Build (Recommended)](#method-1-clone-and-build-recommended)
      - [1. Create a build directory (optional but recommended)](#1-create-a-build-directory-optional-but-recommended)
      - [2. Clone the Paru repository](#2-clone-the-paru-repository)
      - [3. Build and install Paru](#3-build-and-install-paru)
      - [4. Verify installation](#4-verify-installation)
    - [Method 2: Direct Download via `git clone` (Alternative)](#method-2-direct-download-via-git-clone-alternative)
    - [Updating Paru](#updating-paru)
    - [Basic Paru Usage](#basic-paru-usage)
    - [Troubleshooting](#troubleshooting-1)
    - [Other AUR Helpers (Alternatives)](#other-aur-helpers-alternatives)
  - [Desktop Environment Installation](#desktop-environment-installation)
    - [Step 1: Install GPU Drivers](#step-1-install-gpu-drivers)
      - [Intel (integrated graphics)](#intel-integrated-graphics)
      - [AMD / ATI](#amd--ati)
      - [NVIDIA (desktop GPUs)](#nvidia-desktop-gpus)
      - [Virtual Machine (VirtualBox)](#virtual-machine-virtualbox)
    - [Step 2: Install Wayland](#step-2-install-wayland)
    - [Step 3: Choose and Install a Desktop Environment (Wayland-Native)](#step-3-choose-and-install-a-desktop-environment-wayland-native)
      - [Option A: KDE Plasma (Full Wayland Support)](#option-a-kde-plasma-full-wayland-support)
      - [Option B: GNOME (Wayland by Default)](#option-b-gnome-wayland-by-default)
      - [Option C: Sway (Tiling Window Manager, Wayland-Native)](#option-c-sway-tiling-window-manager-wayland-native)
      - [Option D: Hyprland (Dynamic Tiler, Popular on Wayland)](#option-d-hyprland-dynamic-tiler-popular-on-wayland)
    - [Step 4: Install Essential Wayland Portals](#step-4-install-essential-wayland-portals)
    - [Step 5: Enable Display Manager](#step-5-enable-display-manager)
    - [Step 6: Install Fonts](#step-6-install-fonts)
      - [Install essential system fonts](#install-essential-system-fonts)
      - [Install FiraCode fonts](#install-firacode-fonts)
      - [JetBrainsMono Nerd Font](#jetbrainsmono-nerd-font)
    - [Step 7: Audio Setup (PipeWire – Wayland-Compatible)](#step-7-audio-setup-pipewire--wayland-compatible)
    - [Step 8: Reboot into Wayland](#step-8-reboot-into-wayland)
  - [Wayland-Specific Troubleshooting](#wayland-specific-troubleshooting)
  - [Xorg Fallback (If Wayland Fails)](#xorg-fallback-if-wayland-fails)
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
  - [Verify Wayland is Running](#verify-wayland-is-running)
  - [First Launch in KDE Arch Linux](#first-launch-in-kde-arch-linux)
    - [Initial Setup Steps](#initial-setup-steps)
    - [Configure a VPN](#configure-a-vpn)
      - [Using **NetworkManager** plugins](#using-networkmanager-plugins)
        - [Step 1: Install VPN Plugins](#step-1-install-vpn-plugins)
        - [Step 2: Restart NetworkManager](#step-2-restart-networkmanager)
        - [Step 3: Add Your VPN Connection (GUI Method)](#step-3-add-your-vpn-connection-gui-method)
        - [Step 4: Alternative – Import VPN Configuration File](#step-4-alternative--import-vpn-configuration-file)
        - [Step 5: Connect to Your VPN](#step-5-connect-to-your-vpn)
      - [Installing VPN Clients from AUR (Provider-Specific)](#installing-vpn-clients-from-aur-provider-specific)
      - [Testing Your VPN Connection](#testing-your-vpn-connection)
    - [Apply NVENC and NvFBC Patches for Nvidia Drivers](#apply-nvenc-and-nvfbc-patches-for-nvidia-drivers)
      - [Prerequisites](#prerequisites-2)
      - [Installation](#installation-1)
      - [Verification](#verification)
      - [Uninstalling / Reverting the Patch](#uninstalling--reverting-the-patch)
      - [After Driver Updates](#after-driver-updates)
      - [Do You Really Need This?](#do-you-really-need-this)
    - [Update System Packages and Applications](#update-system-packages-and-applications)
      - [Standard System Update](#standard-system-update)
      - [Common Update Errors and Fixes](#common-update-errors-and-fixes)
        - [Error 1: "invalid or corrupted package (PGP signature)"](#error-1-invalid-or-corrupted-package-pgp-signature)
        - [Error 2: "file exists in filesystem"](#error-2-file-exists-in-filesystem)
          - [Option 1: Overwrite the conflicting files (Recommended for known conflicts)](#option-1-overwrite-the-conflicting-files-recommended-for-known-conflicts)
          - [Option 2: Remove the conflicting files manually](#option-2-remove-the-conflicting-files-manually)
          - [Option 3: Find which package owns the conflicting files](#option-3-find-which-package-owns-the-conflicting-files)
          - [Option 4: Remove orphaned packages (Cleanup)](#option-4-remove-orphaned-packages-cleanup)
      - [Error 3: npm/nodejs "file exists" conflict (Specific Fix)](#error-3-npmnodejs-file-exists-conflict-specific-fix)
      - [Error 4: "failed to commit transaction (conflicting files)" with multiple packages](#error-4-failed-to-commit-transaction-conflicting-files-with-multiple-packages)
      - [General Maintenance After Updates](#general-maintenance-after-updates)
    - [Enable Multilib Repository](#enable-multilib-repository)
      - [Step 1: Edit pacman.conf](#step-1-edit-pacmanconf)
      - [Step 2: Uncomment the Multilib Repository](#step-2-uncomment-the-multilib-repository)
      - [Step 3: Save and Exit](#step-3-save-and-exit)
      - [Step 4: Refresh Package Databases](#step-4-refresh-package-databases)
      - [Step 5: Verify Multilib is Enabled](#step-5-verify-multilib-is-enabled)
      - [Step 6: Test with a Multilib Package (Optional)](#step-6-test-with-a-multilib-package-optional)
    - [Enable Bluetooth](#enable-bluetooth)
      - [Step 1: Install Bluetooth Packages](#step-1-install-bluetooth-packages)
      - [Step 2: Load the Bluetooth Driver](#step-2-load-the-bluetooth-driver)
      - [Step 3: Enable and Start the Bluetooth Service](#step-3-enable-and-start-the-bluetooth-service)
      - [Step 4: Check Bluetooth Adapter Status](#step-4-check-bluetooth-adapter-status)
      - [Step 5: Verify Bluetooth is Working](#step-5-verify-bluetooth-is-working)
    - [Enable Firewall](#enable-firewall)
      - [Step 1: Install UFW](#step-1-install-ufw)
      - [Step 2: Set Default Policies](#step-2-set-default-policies)
      - [Step 3: Add Allowed Incoming Rules](#step-3-add-allowed-incoming-rules)
        - [Common Rules](#common-rules)
        - [Rate Limiting for SSH](#rate-limiting-for-ssh)
        - [Using Application Profiles](#using-application-profiles)
      - [Step 4: Allow Specific IP Addresses (Optional)](#step-4-allow-specific-ip-addresses-optional)
      - [Step 5: Enable the Firewall](#step-5-enable-the-firewall)
      - [Step 6: Verify Firewall Status](#step-6-verify-firewall-status)
      - [Step 7: Enable Logging (Optional but Recommended)](#step-7-enable-logging-optional-but-recommended)
      - [Step 8: Set UFW to Start at Boot (Automatic)](#step-8-set-ufw-to-start-at-boot-automatic)
      - [Managing Rules](#managing-rules)
      - [GUI Frontend: GUFW](#gui-frontend-gufw)
      - [Example: Basic Desktop Firewall](#example-basic-desktop-firewall)
      - [Example: Home Server with SSH and Web](#example-home-server-with-ssh-and-web)
    - [Harden `/etc/sysctl.conf`](#harden-etcsysctlconf)
      - [How sysctl Works](#how-sysctl-works)
      - [Step 1: Review Current Settings](#step-1-review-current-settings)
      - [Step 2: Recommended Hardening Parameters](#step-2-recommended-hardening-parameters)
        - [Network Security (TCP/IP Hardening)](#network-security-tcpip-hardening)
        - [Kernel Hardening](#kernel-hardening)
        - [File System \& System Limits](#file-system--system-limits)
        - [Virtual Memory Hardening](#virtual-memory-hardening)
      - [Step 3: Apply the Configuration](#step-3-apply-the-configuration)
      - [Step 4: Verify the Changes](#step-4-verify-the-changes)
      - [Step 5: Test Network Connectivity](#step-5-test-network-connectivity)
      - [Common Parameters Explained](#common-parameters-explained)
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
  - [Conclusion](#conclusion)
    - [What's Next?](#whats-next)
      - [Immediate Next Steps](#immediate-next-steps)
      - [Recommended Applications (by Category)](#recommended-applications-by-category)
    - [Ongoing System Maintenance](#ongoing-system-maintenance)
      - [Weekly Maintenance (5 minutes)](#weekly-maintenance-5-minutes)
      - [Monthly Maintenance (10 minutes)](#monthly-maintenance-10-minutes)
      - [Before Major Updates](#before-major-updates)
    - [Learning Resources](#learning-resources)
    - [Congratulations – You're Now an Arch Linux User! (BTW)](#congratulations--youre-now-an-arch-linux-user-btw)

## Prerequisites

Before starting this guide, ensure you have:

- Successfully installed Arch Linux and rebooted into your new system
- A working internet connection (wired or wireless)
- Root access (`sudo` or direct `su -`)
- Logged in as a standard user (not root)

## What This Guide Covers

This post-installation guide walks you through the following tasks:

- **System updates & maintenance** – Keeping your system current
- **User configuration** – Sudo privileges, dotfiles, and shell setup
- **Network setup** – Managing connections with NetworkManager
- **Audio configuration** – PipeWire or PulseAudio setup
- **Display & graphics drivers** – Intel, AMD, or NVIDIA
- **Desktop environment** – Installing and configuring a GUI (GNOME, KDE, XFCE, etc.)
- **Printing & scanning** – CUPS and SANE configuration
- **System optimization** – TRIM, firewall, and performance tuning
- **Essential applications** – Browser, media player, office suite, and utilities

## How to Use This Guide

Each section is self-contained. You can follow them in order or jump to specific topics as needed. Commands that require `sudo` will explicitly show it. Lines beginning with `#` are comments or root prompts.

---

> **💡 Tip:** Bookmark the [Arch Wiki](https://wiki.archlinux.org/) – it will be your best friend throughout this guide.

Let's get started.

## Connect to a Wireless Network

> **Prerequisite:** This section assumes [NetworkManager](https://wiki.archlinux.org/title/NetworkManager) is installed and enabled. If you see `bash: nmcli: command not found`, install it with `sudo pacman -S networkmanager` and enable it with `sudo systemctl enable --now NetworkManager.service`.

### Step 1: List Available Networks

Scan for nearby wireless networks:

```bash
nmcli device wifi list
```

If no networks appear, try rescanning:

```bash
nmcli device wifi rescan
```

### Step 2: Connect to a Network

#### Method A: Interactive (recommended – password not saved in shell history)

```bash
nmcli device wifi connect <SSID> --ask
```

You will be prompted to enter the password securely.

#### Method B: Direct (use only if you understand the security trade-off)

```bash
nmcli device wifi connect <SSID> password <password>
```

> **⚠️ Security Note:** Method B leaves your Wi-Fi password in shell history (`history` command). Use interactive mode (`--ask`) whenever possible.

Replace `<SSID>` with your actual network name (e.g., `MyHomeWiFi`).

### Step 3: Verify the Connection

Check that you have an IP address:

```bash
nmcli device status
```

Look for your Wi-Fi device (e.g., `wlan0` or `wlp2s0`) with state `connected`.

Test internet connectivity:

```bash
ping -c 4 archlinux.org
```

### Useful NetworkManager Commands

| Task                            | Command                               |
| ------------------------------- | ------------------------------------- |
| List all saved connections      | `nmcli connection show`               |
| Show detailed device info       | `nmcli device show`                   |
| Disconnect from current network | `nmcli device disconnect <interface>` |
| Forget a saved network          | `nmcli connection delete <SSID>`      |
| Turn Wi-Fi on/off               | `nmcli radio wifi on` / `off`         |
| View connection logs            | `journalctl -u NetworkManager -n 20`  |

### Troubleshooting

| Problem                        | Solution                                                        |
| ------------------------------ | --------------------------------------------------------------- |
| `No Wi-Fi adapter found`       | Run `rfkill unblock wifi` and check `nmcli radio wifi`          |
| `Connection activation failed` | Wrong password – run `nmcli connection delete <SSID>` and retry |
| `NetworkManager not running`   | `sudo systemctl start NetworkManager.service`                   |
| Wi-Fi works but no internet    | Check router, or run `sudo dhcpcd` (temporary)                  |

### Example Walkthrough

```bash
# Scan for networks
nmcli device wifi list

# Connect interactively
nmcli device wifi connect "CoffeeShopWiFi" --ask
# (enter password when prompted)

# Verify connection
nmcli device status
ping -c 2 google.com
```

---

> **💡 Tip:** After connecting, your system will automatically reconnect to this network on future boots as long as the connection profile is saved (which `nmcli` does by default).

## Install Paru (AUR Helper)

[Paru](https://github.com/Morganamilo/paru) is an AUR helper and `pacman` wrapper that simplifies installing packages from both the official Arch repositories and the Arch User Repository (AUR).

### Prerequisites

Ensure you have the necessary build tools and `git` installed:

```bash
sudo pacman -S --needed base-devel git
```

### Installation Methods

Choose **one** of the following methods.

---

### Method 1: Clone and Build (Recommended)

This method gives you full control and is the standard AUR install process.

#### 1. Create a build directory (optional but recommended)

```bash
mkdir -p ~/builds
cd ~/builds
```

> **💡 Tip:** Keeping AUR builds in a dedicated directory (like `~/builds` or `~/aur`) prevents cluttering your home folder.

#### 2. Clone the Paru repository

```bash
git clone https://aur.archlinux.org/paru.git
cd paru
```

#### 3. Build and install Paru

```bash
makepkg -si
```

**Flag explanations:**

- `-s` – Install missing dependencies (using `pacman`)
- `-i` – Install the package after successful build

You will be prompted for your `sudo` password during the process.

#### 4. Verify installation

```bash
paru --version
```

You should see output like `paru x.x.x - libalpm vxx.x.x`.

---

### Method 2: Direct Download via `git clone` (Alternative)

If the above fails, you can clone to `/opt` (less common, requires extra steps):

```bash
sudo git clone https://aur.archlinux.org/paru.git /opt/paru
sudo chown -R $USER:$USER /opt/paru
cd /opt/paru
makepkg -si
```

> **⚠️ Note:** Method 2 is more complex and generally unnecessary. Method 1 is preferred for most users.

---

### Updating Paru

Paru updates itself when you update your system:

```bash
paru -Syu
```

This updates both official packages (`pacman -Syu`) and AUR packages.

To update **only Paru** (rarely needed):

```bash
paru -S paru
```

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

> **ℹ️ Note:** Paru accepts most `pacman` flags. AUR packages are downloaded, built, and installed just like official packages.

### Troubleshooting

| Problem                              | Solution                                                          |
| ------------------------------------ | ----------------------------------------------------------------- |
| `makepkg: command not found`         | Install `base-devel`: `sudo pacman -S base-devel`                 |
| `git: command not found`             | Install `git`: `sudo pacman -S git`                               |
| Permission denied during build       | Do **not** run `makepkg` with `sudo`. Build as your regular user. |
| Paru command not found after install | Log out and back in, or run `source /etc/profile`                 |
| GPG key errors during build          | Run `sudo pacman -S archlinux-keyring && paru -Syu`               |

### Other AUR Helpers (Alternatives)

If you prefer a different AUR helper, popular choices include:

- **yay** – `git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si`
- **pikaur** – Requires Python; less common
- **trizen** – Lightweight, Perl-based

> **💡 Recommendation:** Stick with Paru unless you have a specific reason to switch. It's actively maintained, fast, and well-documented.

---

Once Paru is installed, you can use it just like `pacman` for both official and AUR packages throughout the rest of this guide.

## Desktop Environment Installation

This section covers installing a graphical desktop environment using **Wayland** (the modern replacement for Xorg). **KDE Plasma** is used as the primary example.

> **📝 Prerequisite:** Ensure your system is updated: `sudo pacman -Syu`

---

### Step 1: Install GPU Drivers

Choose the section that matches your hardware.

#### Intel (integrated graphics)

```bash
sudo pacman -S mesa vulkan-intel
```

#### AMD / ATI

```bash
sudo pacman -S mesa vulkan-radeon lib32-mesa lib32-vulkan-radeon
```

For older ATI cards (pre-GCN):

```bash
sudo pacman -S xf86-video-ati   # Xorg fallback only, Wayland uses mesa
```

#### NVIDIA (desktop GPUs)

> **⚠️ Wayland on NVIDIA:** Requires NVIDIA driver 495+ (545+ recommended). Check your version with `nvidia-smi`.

```bash
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils
```

For the LTS kernel:

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

Then regenerate the initramfs:

```bash
sudo mkinitcpio -P
```

Create a configuration file for the NVIDIA DRM:

```bash
sudo nano /etc/modprobe.d/nvidia-drm.conf
```

Add this line:

```plaintext
options nvidia_drm modeset=1
```

For GRUB users, also add `nvidia_drm.modeset=1` to your kernel command line:

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

#### Virtual Machine (VirtualBox)

Wayland works in VirtualBox with Guest Additions:

```bash
sudo pacman -S virtualbox-guest-utils
sudo systemctl enable vboxservice
sudo usermod -aG vboxsf $USER
```

---

### Step 2: Install Wayland

Most desktop environments pull Wayland as a dependency. However, you can install Wayland explicitly:

```bash
sudo pacman -S wayland wayland-protocols
```

> **ℹ️ Note:** Xorg is **not** installed by default with Wayland-based setups. Some legacy applications may still require Xwayland (compatibility layer), which is automatically installed with most desktop environments.

---

### Step 3: Choose and Install a Desktop Environment (Wayland-Native)

#### Option A: KDE Plasma (Full Wayland Support)

KDE Plasma has excellent Wayland support as of version 5.27+.

```bash
sudo pacman -S plasma-meta sddm
```

**Make SDDM use Wayland** (optional but improves integration):

```bash
sudo nano /etc/sddm.conf.d/wayland.conf
```

Add:

```plaintext
[General]
DisplayServer=wayland
```

> **💡 Tip:** You can still choose X11 from SDDM's session menu if needed.

**Verify KDE is using Wayland** after login:

```bash
echo $XDG_SESSION_TYPE
```

Expected output: `wayland`

#### Option B: GNOME (Wayland by Default)

GNOME automatically uses Wayland on supported hardware.

```bash
sudo pacman -S gnome gnome-extra gdm
sudo systemctl enable gdm
```

#### Option C: Sway (Tiling Window Manager, Wayland-Native)

For users who prefer a tiling window manager:

```bash
sudo pacman -S sway swaylock swayidle waybar foot dmenu
```

Copy default configuration:

```bash
mkdir -p ~/.config/sway
cp /etc/sway/config ~/.config/sway/
```

#### Option D: Hyprland (Dynamic Tiler, Popular on Wayland)

```bash
paru -S hyprland
```

> **ℹ️ Note:** Hyprland requires a manual configuration. See the [Hyprland Wiki](https://wiki.hyprland.org/).

---

### Step 4: Install Essential Wayland Portals

Portals enable features like screen sharing and file picking in sandboxed applications (Flatpak, Snap, and even native apps).

```bash
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-kde
```

For GNOME, replace `xdg-desktop-portal-kde` with:

```bash
sudo pacman -S xdg-desktop-portal-gnome
```

For Sway/Hyprland (use the generic GTK portal):

```bash
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-gtk
```

**Enable the portal service:**

```bash
systemctl --user enable --now xdg-desktop-portal
```

> **⚠️ Note:** Screen sharing on Wayland requires these portals. Without them, Discord, Zoom, and browser screen sharing will fail.

---

### Step 5: Enable Display Manager

For KDE Plasma (SDDM):

```bash
sudo systemctl enable sddm
```

For GNOME (GDM):

```bash
sudo systemctl enable gdm
```

For Sway/Hyprland (no display manager – login from TTY):

```bash
# Add to your ~/.bashrc or shell config
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec sway
fi
```

---

### Step 6: Install Fonts

#### Install essential system fonts

This command installs a set of widely used fonts that ensure good coverage for most languages, emojis, and general text rendering.

```bash
sudo pacman -S noto-fonts noto-fonts-emoji ttf-dejavu ttf-liberation
```

#### Install FiraCode fonts

Fira Code is a free monospaced font containing ligatures for common programming multi-character combinations

[Download](https://github.com/tonsky/FiraCode)

#### JetBrainsMono Nerd Font

Nerd Fonts are specialized fonts that include a wide range of icons and glyphs, making them ideal for developers and enthusiasts who require additional symbols in their terminal or code editor

[Download](https://www.nerdfonts.com/)

---

### Step 7: Audio Setup (PipeWire – Wayland-Compatible)

PipeWire works seamlessly with Wayland:

```bash
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber
systemctl --user enable --now pipewire pipewire-pulse wireplumber
```

---

### Step 8: Reboot into Wayland

```bash
sudo reboot
```

After rebooting:

- For KDE: Select "Plasma (Wayland)" from SDDM's session menu (usually default)
- For GNOME: Wayland is used automatically
- Verify with `echo $XDG_SESSION_TYPE`

---

## Wayland-Specific Troubleshooting

| Problem                                 | Solution                                                                              |
| --------------------------------------- | ------------------------------------------------------------------------------------- |
| Screen sharing not working              | Install `xdg-desktop-portal-kde` and restart session                                  |
| NVIDIA Wayland issues                   | Ensure `nvidia_drm.modeset=1` is set, use driver 545+                                 |
| Fractional scaling blurry               | Enable in System Settings → Display → Scale Method → "Smooth"                         |
| Copy/paste between X11 and Wayland apps | Should work automatically via `wl-clipboard` (install: `sudo pacman -S wl-clipboard`) |
| Screenshot tools not working            | Use Wayland-native tools: `spectacle` (KDE) or `grim` + `slurp` (Sway/Hyprland)       |
| Application won't launch (X11-only)     | Run with `GDK_BACKEND=x11` or `QT_QPA_PLATFORM=xcb` environment variables             |

---

## Xorg Fallback (If Wayland Fails)

If you encounter serious issues with Wayland, you can install Xorg as a fallback:

```bash
sudo pacman -S xorg xorg-server
```

Then log out and select "Plasma (X11)" from SDDM's session menu.

---

## GPU Switching for Laptops

> **⚠️ Note:** Only follow this if you have a laptop with both Intel and NVIDIA GPUs.

Choose the section that matches your hardware.

---

### Section A: Non-ASUS Optimus Laptops (Dell, Lenovo, HP, etc.)

**Use `optimus-manager`** – a universal solution that works on any NVIDIA Optimus laptop.

#### Installation

```bash
paru -S optimus-manager
```

#### Optional: GUI for KDE Plasma

```bash
paru -S optimus-manager-qt
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

For ASUS laptops, you need **hardware control** (fans, battery limit, RGB, power profiles) in addition to GPU switching. Use the ASUS Linux suite.

#### What About `supergfxctl`?

> **⚠️ Warning:** `supergfxctl` is **being phased out** according to the Arch Wiki. Its use is unadvised unless you specifically require VFIO for virtual machines. Do not install it unless you have that specific need. However, since we are only going to use this service to change the GPU mode once or twice (like forever), we're going to install it anyway.

For standard GPU switching on ASUS laptops, use either:

- **Option 1 (Recommended):** Standard NVIDIA PRIME (no extra tools)
- **Option 2:** `optimus-manager` (works on ASUS too, but conflicts with `asusctl` – choose one)

#### Installation (Hardware Control)

Install `supergfxctl`, `asusctl` and `rog-control-center` for fan control, battery limit, RGB, and power profiles:

```bash
paru -S asusctl supergfxctl rog-control-center
```

Enable the service:

```bash
sudo systemctl enable --now asusd
```

> **Note:** According to ASUS Linux documentation, `asusd` is socket-activated. The enable command above ensures it starts on boot.

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

## Verify Wayland is Running

```bash
echo $XDG_SESSION_TYPE
# Should output: wayland

wayland-info
# Shows detailed Wayland protocol information
```

## First Launch in KDE Arch Linux

After logging into KDE Plasma for the first time, you'll see the welcome screen. Here are the essential first-time setup tasks.

### Initial Setup Steps

1. **Set your preferred language and region** – System Settings → Regional Settings
2. **Connect to the internet** – Click the network icon in the system tray (bottom-right)
3. **Configure your VPN** (if needed) – See below

---

### Configure a VPN

#### Using **NetworkManager** plugins

KDE Plasma uses **NetworkManager** with the `plasma-nm` applet (already installed with `plasma-meta`). You can add VPN support by installing the appropriate plugin.

##### Step 1: Install VPN Plugins

| VPN Protocol                       | Package(s)                                      | Command                                                   |
| ---------------------------------- | ----------------------------------------------- | --------------------------------------------------------- |
| **OpenVPN**                        | `networkmanager-openvpn` + `openvpn`            | `sudo pacman -S networkmanager-openvpn openvpn`           |
| **WireGuard**                      | `networkmanager-wireguard` + `wireguard-tools`  | `sudo pacman -S networkmanager-wireguard wireguard-tools` |
| **L2TP/IPsec**                     | `networkmanager-l2tp` + `xl2tpd` + `strongswan` | `sudo pacman -S networkmanager-l2tp xl2tpd strongswan`    |
| **PPTP** (legacy)                  | `networkmanager-pptp` + `pptpclient`            | `sudo pacman -S networkmanager-pptp pptpclient`           |
| **OpenConnect** (Cisco AnyConnect) | `networkmanager-openconnect` + `openconnect`    | `sudo pacman -S networkmanager-openconnect openconnect`   |

> **💡 Tip:** Most modern VPNs use **WireGuard** or **OpenVPN**. Check your VPN provider's documentation.

##### Step 2: Restart NetworkManager

After installing plugins, restart NetworkManager to detect them:

```bash
sudo systemctl restart NetworkManager
```

##### Step 3: Add Your VPN Connection (GUI Method)

1. Click the **network icon** in the system tray (bottom-right corner)
2. Select **Configure Network Connections** (or open System Settings → Connections)
3. Click the **+** (Add) button
4. Choose your VPN type (e.g., OpenVPN, WireGuard, L2TP, PPTP)
5. Enter your VPN provider's settings:
   - **Gateway/Server address**
   - **Username** (often an email or provided username)
   - **Password**
   - **CA certificate** (if required)
   - **Cipher / Data encryption** (check provider docs)
6. Click **Apply** or **Save**

##### Step 4: Alternative – Import VPN Configuration File

Many VPN providers offer `.ovpn` (OpenVPN) or `.conf` (WireGuard) configuration files.

**For OpenVPN (.ovpn):**

```bash
nmcli connection import type openvpn file /path/to/config.ovpn
```

**For WireGuard (.conf):**

```bash
nmcli connection import type wireguard file /path/to/wg0.conf
```

##### Step 5: Connect to Your VPN

- **GUI:** Click the network icon → select your VPN → click **Connect**
- **Command line:** `nmcli connection up <VPN-name>`

---

#### Installing VPN Clients from AUR (Provider-Specific)

Some VPN providers offer their own GUI clients available in the AUR.

| Provider                          | AUR Package   | Command               |
| --------------------------------- | ------------- | --------------------- |
| **ProtonVPN**                     | `protonvpn`   | `paru -S protonvpn`   |
| **Mullvad**                       | `mullvad-vpn` | `paru -S mullvad-vpn` |
| **NordVPN**                       | `nordvpn-bin` | `paru -S nordvpn-bin` |
| **ExpressVPN**                    | `expressvpn`  | `paru -S expressvpn`  |
| **v2ray**                         | `v2rayn`      | `paru -S v2rayn`      |
| **Private Internet Access (PIA)** | `pia-client`  | `paru -S pia-client`  |

> **⚠️ Note:** Provider-specific clients often run as background services and may conflict with NetworkManager. Choose **either** the NetworkManager plugin method **or** the provider's client – not both.

---

#### Testing Your VPN Connection

After connecting, verify that your IP address has changed:

```bash
curl ifconfig.me
```

Compare this to your real IP (before VPN). They should be different.

To check VPN connection status via command line:

```bash
nmcli connection show --active
```

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

### Update System Packages and Applications

Regular system updates are essential for security and stability.

#### Standard System Update

```bash
sudo pacman -Syu
```

This command:

- `-S` – Synchronize packages
- `-y` – Refresh package databases
- `-u` – Upgrade installed packages

> **💡 Tip:** Run this command weekly to keep your system current.

---

#### Common Update Errors and Fixes

Sometimes `pacman -Syu` or package installations fail with errors. Below are the most common issues and their solutions.

---

##### Error 1: "invalid or corrupted package (PGP signature)"

**Symptoms:**

```plaintext
error: failed to commit transaction (invalid or corrupted package (PGP signature))
```

**Cause:** The package signature key is outdated or missing locally.

**Solution:** Update the `archlinux-keyring` package:

```bash
sudo pacman -S archlinux-keyring
```

Then refresh the package databases and try the update again:

```bash
sudo pacman -Syyu
```

**If that doesn't work:** Manually refresh the keys:

```bash
sudo pacman-key --refresh-keys
sudo pacman -Syyu
```

---

##### Error 2: "file exists in filesystem"

**Symptoms:**

```plaintext
error: failed to commit transaction (conflicting files)
npm: /usr/bin/npm exists in filesystem
nodejs: /usr/include/node/common.gypi exists in filesystem
```

**Cause:** A file already exists on your system that pacman is trying to install. This often happens when:

- You manually installed software (e.g., using `make install`, `npm install -g`, `pip install`)
- You previously installed a package from the AUR that left orphaned files
- Two different packages are conflicting

**Solution options (choose one):**

###### Option 1: Overwrite the conflicting files (Recommended for known conflicts)

```bash
sudo pacman -Syu --overwrite '*/npm*'
```

Replace `'*/npm*'` with the specific file pattern causing the conflict.

> **⚠️ Warning:** Only overwrite files you are certain belong to the package being installed.

###### Option 2: Remove the conflicting files manually

First, identify the conflicting files from the error message, then remove them:

```bash
sudo rm /usr/bin/npm
sudo rm -rf /usr/include/node
```

Then retry the update:

```bash
sudo pacman -Syu
```

###### Option 3: Find which package owns the conflicting files

```bash
pacman -Qo /path/to/conflicting/file
```

If the file is not owned by any package (output: `no package owns`), it's safe to remove or move it.

###### Option 4: Remove orphaned packages (Cleanup)

Orphaned packages (dependencies no longer needed) can sometimes cause conflicts:

```bash
sudo pacman -Rns $(pacman -Qtdq)
```

---

#### Error 3: npm/nodejs "file exists" conflict (Specific Fix)

The specific error with `npm` or `nodejs` usually occurs when you installed `npm` globally using the `npm` command itself before installing the `nodejs` or `npm` package via pacman.

**Correct fix – Do NOT run `npm --global remove npm`**

Instead, follow these steps:

**Step 1:** Check if npm was installed globally via npm itself

```bash
npm list -g --depth=0
```

If you see packages listed, back them up:

```bash
npm list -g --depth=0 --parseable > ~/npm-global-packages.txt
```

**Step 2:** Remove the conflicting files

```bash
sudo rm -rf /usr/lib/node_modules/npm
sudo rm -f /usr/bin/npm /usr/bin/npx
```

**Step 3:** Reinstall nodejs and npm from pacman

```bash
sudo pacman -S nodejs npm --overwrite '/usr/bin/npm' '/usr/bin/npx' '/usr/lib/node_modules/npm/*'
```

**Step 4:** Verify the installation

```bash
npm --version
node --version
```

**Step 5:** Restore any globally installed npm packages (if you had them)

```bash
# First, reinstall your global packages from the backup list
while read pkg; do
    if [[ $pkg != "├──"* && $pkg != "└──"* && $pkg != "" ]]; then
        sudo npm install -g "$pkg"
    fi
done < ~/npm-global-packages.txt
```

> **💡 Best Practice:** Avoid installing global npm packages with `sudo npm install -g` when using pacman. Instead:
>
> - Use `pacman -S` for node packages when possible
> - Or install global packages to your user directory: `npm install -g --prefix ~/.local`
> - Or use `nvm` (Node Version Manager) to manage node/npm without system conflicts

---

#### Error 4: "failed to commit transaction (conflicting files)" with multiple packages

**Symptoms:** A long list of conflicting files from different packages.

**Solution:** Use `pacman -Syu --overwrite='*'` (last resort only):

```bash
sudo pacman -Syu --overwrite='*'
```

> **⚠️ Extreme Caution:** `--overwrite='*'` tells pacman to overwrite **any** conflicting file without asking. Only use this if you understand the consequences and have a backup.

---

#### General Maintenance After Updates

After running `sudo pacman -Syu`, consider these optional cleanup steps:

| Task                                          | Command                            |
| --------------------------------------------- | ---------------------------------- |
| Remove unused cached packages                 | `sudo pacman -Sc`                  |
| Remove ALL cached packages (use with caution) | `sudo pacman -Scc`                 |
| Remove orphaned dependencies                  | `sudo pacman -Rns $(pacman -Qtdq)` |
| Check for broken packages                     | `pacman -Qk`                       |
| View recent pacman log                        | `tail -n 50 /var/log/pacman.log`   |

---

### Enable Multilib Repository

The **multilib** repository provides 32-bit libraries and applications needed to run 32-bit software on a 64-bit Arch Linux system. This is essential for:

- Running **Steam** and many native Linux games
- Using **Wine** to run Windows applications
- Certain **development tools** and legacy software

> **💡 Tip:** Even if you don't need 32-bit software now, enable multilib anyway – many applications will require it later.

#### Step 1: Edit pacman.conf

Open the pacman configuration file with root privileges:

```bash
sudo nano /etc/pacman.conf
```

#### Step 2: Uncomment the Multilib Repository

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

#### Step 3: Save and Exit

- In `nano`: Press `Ctrl+O` (save), `Enter` (confirm), then `Ctrl+X` (exit)
- In `vim`: Press `Esc`, type `:wq`, then `Enter`

#### Step 4: Refresh Package Databases

Update pacman to recognize the newly enabled multilib repository:

```bash
sudo pacman -Syyu
```

The `-Syy` forces a refresh of all package databases, including the new multilib repository.

#### Step 5: Verify Multilib is Enabled

Check that multilib packages are now available:

```bash
pacman -Sl multilib | head -n 10
```

You should see a list of multilib packages (e.g., `lib32-glibc`, `lib32-gcc-libs`).

Alternatively, search for a specific 32-bit package:

```bash
pacman -Ss lib32-
```

#### Step 6: Test with a Multilib Package (Optional)

Install a common 32-bit library to confirm everything works:

```bash
sudo pacman -S lib32-glibc
```

If the installation succeeds without errors, multilib is properly configured.

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

### Enable Firewall

A firewall controls incoming and outgoing network traffic, protecting your system from unauthorized access.

This section uses **UFW (Uncomplicated Firewall)** – a user-friendly frontend for `iptables`. It's ideal for desktop users who want basic protection without complexity.

> **💡 Alternative:** For advanced users, `firewalld` (dynamic firewall) or raw `nftables` are available. See the [Arch Wiki: Firewalls](https://wiki.archlinux.org/title/Category:Firewalls).

---

#### Step 1: Install UFW

```bash
sudo pacman -S ufw
```

> **ℹ️ Note:** UFW is not installed by default on Arch Linux.

---

#### Step 2: Set Default Policies

Default policies determine how to handle traffic that doesn't match any specific rule.

```bash
sudo ufw default deny incoming   # Block all incoming traffic by default
sudo ufw default allow outgoing  # Allow all outgoing traffic by default
```

**Explanation:**

- `deny incoming` – Prevents external systems from initiating connections to your PC (secure)
- `allow outgoing` – Your applications can connect to the internet normally

> **⚠️ Warning:** Do not change `default deny incoming` to `allow` unless you know what you're doing.

---

#### Step 3: Add Allowed Incoming Rules

Allow specific services that need to accept incoming connections.

##### Common Rules

| Service                  | Port        | Command                     | Use Case                                     |
| ------------------------ | ----------- | --------------------------- | -------------------------------------------- |
| **SSH** (rate-limited)   | 22/TCP      | `sudo ufw limit 22/tcp`     | Remote administration (prevents brute force) |
| **HTTP**                 | 80/TCP      | `sudo ufw allow 80/tcp`     | Web server                                   |
| **HTTPS**                | 443/TCP     | `sudo ufw allow 443/tcp`    | Web server                                   |
| **SSH (different port)** | 2222/TCP    | `sudo ufw allow 2222/tcp`   | Custom SSH port                              |
| **Ping (ICMP)**          | -           | `sudo ufw allow proto icmp` | Allow ping responses                         |
| **Samba (file sharing)** | 137-139,445 | `sudo ufw allow Samba`      | Windows file sharing                         |
| **CUPS (printing)**      | 631/TCP     | `sudo ufw allow 631/tcp`    | Network printing                             |

##### Rate Limiting for SSH

The `limit` command is preferred over `allow` for SSH:

```bash
sudo ufw limit 22/tcp
```

This allows 6 connections per 30 seconds from the same IP address, then blocks further attempts – effectively preventing brute-force attacks.

##### Using Application Profiles

Some applications register profiles with UFW. List available profiles:

```bash
sudo ufw app list
```

Allow by profile name:

```bash
sudo ufw allow OpenSSH
```

---

#### Step 4: Allow Specific IP Addresses (Optional)

Allow all traffic from a trusted IP (e.g., home network):

```bash
sudo ufw allow from 192.168.1.100
```

Allow a specific port from a specific IP:

```bash
sudo ufw allow from 192.168.1.100 to any port 22 proto tcp
```

Allow a whole subnet:

```bash
sudo ufw allow from 192.168.1.0/24
```

---

#### Step 5: Enable the Firewall

**Before enabling:** If you are connected via SSH, ensure you have allowed SSH access FIRST, or you will lock yourself out.

```bash
sudo ufw enable
```

You will be prompted with a warning:

```plainText
Command may disrupt existing ssh connections. Proceed with operation (y|n)?
```

Answer `y` to continue.

> **⚠️ Critical Warning:** If you are connected remotely via SSH and have NOT added `sudo ufw allow 22/tcp` (or your SSH port), you will lose access immediately. If this happens, you need physical or out-of-band access to disable UFW.

---

#### Step 6: Verify Firewall Status

Check if UFW is running and view active rules:

```bash
sudo ufw status verbose
```

**Example output:**

```plainText
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
22/tcp                     LIMIT IN    Anywhere
80/tcp                     ALLOW IN    Anywhere
443/tcp                    ALLOW IN    Anywhere
```

To see numbered rules (useful for deletion):

```bash
sudo ufw status numbered
```

---

#### Step 7: Enable Logging (Optional but Recommended)

Logging helps with debugging and identifying intrusion attempts:

```bash
sudo ufw logging on
```

Log levels: `off`, `low` (default), `medium`, `high`, `full`.

View UFW logs:

```bash
sudo tail -f /var/log/ufw.log
```

---

#### Step 8: Set UFW to Start at Boot (Automatic)

UFW enables itself at boot after `ufw enable`. To confirm:

```bash
sudo systemctl is-enabled ufw
```

If not enabled, manually enable the service:

```bash
sudo systemctl enable ufw
```

---

#### Managing Rules

| Task                            | Command                        |
| ------------------------------- | ------------------------------ |
| List rules with numbers         | `sudo ufw status numbered`     |
| Delete rule by number           | `sudo ufw delete <number>`     |
| Delete rule by exact spec       | `sudo ufw delete allow 80/tcp` |
| Disable UFW entirely            | `sudo ufw disable`             |
| Reset all rules to defaults     | `sudo ufw reset`               |
| Reload UFW after manual changes | `sudo ufw reload`              |

---

#### GUI Frontend: GUFW

For a graphical interface, install `gufw`:

```bash
sudo pacman -S gufw
```

Launch from application menu as **"Firewall Configuration"**. The GUI is especially helpful for beginners to visualize rules.

---

#### Example: Basic Desktop Firewall

For a typical desktop user (not running servers), this minimal setup is sufficient:

```bash
sudo pacman -S ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
```

This blocks all incoming traffic (safe) while allowing all outgoing traffic (browsing, updates, etc.). No specific port allowances needed unless you run services like SSH or a web server.

---

#### Example: Home Server with SSH and Web

```bash
sudo pacman -S ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw limit 22/tcp          # SSH with rate limiting
sudo ufw allow 80/tcp          # HTTP
sudo ufw allow 443/tcp         # HTTPS
sudo ufw enable
```

---

### Harden `/etc/sysctl.conf`

The `sysctl` interface allows you to modify kernel parameters at runtime. Hardening these parameters improves system security by mitigating network attacks, restricting information leaks, and limiting certain types of exploits.

> **⚠️ Warning:** Incorrect sysctl values can break network connectivity, prevent applications from working, or cause system instability. Test changes in a non-production environment first.

---

#### How sysctl Works

- **Runtime changes:** `sudo sysctl -w parameter=value` (lost after reboot)
- **Persistent changes:** Add to `/etc/sysctl.conf` or `/etc/sysctl.d/*.conf`
- **View current values:** `sysctl parameter` or `sysctl -a`
- **Apply persistent config:** `sudo sysctl -p` (reloads `/etc/sysctl.conf`)

> **💡 Modern practice:** Use `/etc/sysctl.d/99-hardening.conf` instead of editing `/etc/sysctl.conf` directly. This survives package updates and keeps configurations organized.

---

#### Step 1: Review Current Settings

Before making changes, understand your current configuration:

```bash
# Display ALL kernel parameters
sysctl -a

# Display parameters related to network security
sysctl -a | grep -E "net.ipv4.(conf|tcp_)"

# Display specific parameters
sysctl net.ipv4.conf.all.rp_filter
sysctl net.ipv4.tcp_syncookies

# Display parameters matching a pattern
sysctl -a --pattern 'net.ipv4.conf.(eth|wlan).*'
```

#### Step 2: Recommended Hardening Parameters

Create a new configuration file:

```bash
sudo nano /etc/sysctl.d/99-hardening.conf
```

Add the following parameters. **Uncomment or adjust values based on your use case.**

##### Network Security (TCP/IP Hardening)

```plaintext
# IP Spoofing protection (Reverse Path Filtering)
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# Ignore ICMP redirects (prevent MITM attacks)
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0

# Ignore send redirects (not a router)
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0

# Disable source packet routing (prevent spoofing)
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0

# Log Martians (packets with impossible source addresses)
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1

# Protect against TCP SYN flood attacks
net.ipv4.tcp_syncookies = 1

# Protect against time-wait assassination
net.ipv4.tcp_rfc1337 = 1

# Disable IPv6 if not needed (comment out if you need IPv6)
# net.ipv6.conf.all.disable_ipv6 = 1
# net.ipv6.conf.default.disable_ipv6 = 1
```

##### Kernel Hardening

```plaintext
# Restrict kernel pointer access (prevents information leaks)
kernel.kptr_restrict = 2

# Restrict dmesg access (prevents kernel info leaks)
kernel.dmesg_restrict = 1

# Randomize kernel memory addresses (ASLR)
kernel.randomize_va_space = 2

# Restrict perf events (prevents kernel profiling by unprivileged users)
kernel.perf_event_paranoid = 3

# Disable bpf JIT hardening (for BPF security)
net.core.bpf_jit_harden = 2

# Restrict ptrace (prevents process injection)
kernel.yama.ptrace_scope = 1
```

##### File System & System Limits

```plaintext
# Protect against hardlink/symlink attacks
fs.protected_hardlinks = 1
fs.protected_symlinks = 1

# Protect FIFO files (prevent DoS via FIFO bombs)
fs.protected_fifos = 2

# Protect regular files (prevent file corruption)
fs.protected_regular = 2

# Increase system max file descriptors
fs.file-max = 65535
```

##### Virtual Memory Hardening

```plaintext
# Prevent swapping of shared anonymous pages
vm.vfs_cache_pressure = 50

# Restrict kernel code execution from user memory
vm.mmap_rnd_bits = 32
vm.mmap_rnd_compat_bits = 16
```

---

#### Step 3: Apply the Configuration

After saving the file, apply the changes:

```bash
sudo sysctl -p /etc/sysctl.d/99-hardening.conf
```

Or apply all sysctl configuration files:

```bash
sudo sysctl --system
```

---

#### Step 4: Verify the Changes

Check specific parameters to confirm they're applied:

```bash
# Verify a single parameter
sysctl net.ipv4.conf.all.rp_filter

# Verify multiple parameters
sysctl kernel.kptr_restrict kernel.dmesg_restrict fs.protected_symlinks

# Check for errors in loading
sudo sysctl --system 2>&1 | grep -i error
```

---

#### Step 5: Test Network Connectivity

After applying network hardening, ensure your system still functions normally:

```bash
# Test internet connectivity
ping -c 4 archlinux.org

# Test DNS resolution
host archlinux.org

# Test local network access (if applicable)
ip route show
```

If you encounter issues, review the parameters you enabled (especially IPv6 disabling and ICMP redirect blocking).

---

#### Common Parameters Explained

| Parameter                            | Default | Hardened | What It Does                                |
| ------------------------------------ | ------- | -------- | ------------------------------------------- |
| `net.ipv4.conf.all.rp_filter`        | 0       | 1        | Prevents IP spoofing (strict mode)          |
| `net.ipv4.tcp_syncookies`            | 1       | 1        | Protects against SYN flood attacks          |
| `net.ipv4.conf.all.accept_redirects` | 1       | 0        | Prevents ICMP redirect attacks              |
| `kernel.kptr_restrict`               | 0       | 2        | Restricts `/proc/kallsyms` access           |
| `kernel.dmesg_restrict`              | 0       | 1        | Restricts `dmesg` to root only              |
| `fs.protected_symlinks`              | 0       | 1        | Prevents symlink race conditions            |
| `kernel.randomize_va_space`          | 2       | 2        | Enables full ASLR (already default on Arch) |
| `net.ipv4.conf.all.log_martians`     | 0       | 1        | Logs spoofed/weird source addresses         |

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

## Conclusion

Congratulations! You have successfully completed the post-installation configuration for your Arch Linux system. Your system now has:

- A **Wayland-based desktop environment** (KDE Plasma)
- **GPU drivers** and hardware acceleration
- **Audio support** (PipeWire)
- **Bluetooth** and **firewall** configured
- **VPN** and **WINE** ready for use
- **Security hardening** via sysctl parameters

---

### What's Next?

Arch Linux is a rolling release distribution. Unlike point-release distros (Ubuntu, Fedora), Arch requires **ongoing maintenance** to keep your system secure and stable.

#### Immediate Next Steps

| Task                                         | Command / Action                             |
| -------------------------------------------- | -------------------------------------------- |
| **Install essential applications**           | See recommendations below                    |
| **Create system snapshots** (if using Btrfs) | Install `timeshift` or `snapper`             |
| **Set up automatic backups**                 | Use `rsync`, `restic`, or `borg` for `/home` |
| **Configure printing** (if needed)           | `sudo pacman -S cups` (see Arch Wiki)        |
| **Install Flatpak for sandboxed apps**       | `sudo pacman -S flatpak`                     |

#### Recommended Applications (by Category)

| Category              | Packages (install with `sudo pacman -S` or `paru -S`) |
| --------------------- | ----------------------------------------------------- |
| **Web browser**       | `firefox`, `chromium`, `brave-bin`                    |
| **Office suite**      | `libreoffice-fresh`, `onlyoffice-bin`                 |
| **Media player**      | `vlc`, `mpv`, `celluloid`                             |
| **Image editing**     | `gimp`, `krita`, `inkscape`                           |
| **Video editing**     | `kdenlive`, `obsidian` (AUR)                          |
| **Terminal emulator** | `konsole` (KDE default), `kitty`, `alacritty`         |
| **File manager**      | `dolphin` (KDE default), `thunar`, `ranger`           |
| **System monitoring** | `htop`, `btop`, `kde-system-monitor`                  |
| **Discord client**    | `discord` (from AUR: `paru -S discord`)               |
| **Steam (gaming)**    | `steam` (enable multilib first)                       |
| **Password manager**  | `keepassxc`, `bitwarden-bin`                          |

> **💡 Tip:** Use `paru` to search for AUR packages: `paru -Ss search-term`.

---

### Ongoing System Maintenance

#### Weekly Maintenance (5 minutes)

```bash
# Update all packages (official repos + AUR)
sudo pacman -Syu
paru -Syu

# Check for orphaned packages
pacman -Qtdq

# Remove orphaned packages (if any)
sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null

# Clear pacman cache (keep last 2 versions)
sudo paccache -r
```

#### Monthly Maintenance (10 minutes)

```bash
# Remove all cached packages (not recommended if you downgrade often)
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

Major updates (kernel, glibc, systemd) may require manual intervention.

---

### Learning Resources

| Resource                                                                     | Purpose                                   |
| ---------------------------------------------------------------------------- | ----------------------------------------- |
| [Arch Wiki](https://wiki.archlinux.org/)                                     | **Primary documentation** – Bookmark this |
| [Arch Linux News](https://archlinux.org/news/)                               | Check before `pacman -Syu`                |
| [Arch Forums](https://bbs.archlinux.org/)                                    | Community support                         |
| [r/archlinux](https://reddit.com/r/archlinux)                                | Reddit community                          |
| [Arch Linux Guide](https://wiki.archlinux.org/title/General_recommendations) | General recommendations                   |
| [Awesome Arch](https://github.com/archlinux/awesome-arch)                    | Curated Arch resources                    |

---

### Congratulations – You're Now an Arch Linux User! (BTW)

You've completed the installation and post-installation configuration. What you have now is a **minimal but powerful foundation**.

**What makes Arch special:**

- **Rolling releases** – One install, continuous updates (no version upgrades)
- **The AUR** – Thousands of user-submitted packages
- **The Wiki** – Unmatched documentation
- **Total control** – Your system, your way

**Final advice:**

- Read the [Arch Wiki](https://wiki.archlinux.org/) before asking for help
- Join the community – be helpful, be respectful
- **Do not run partial updates** (`pacman -Sy` without `-u`)
- **Do not use `sudo` to run graphical applications** (use `pkexec` instead)

Enjoy your new Arch Linux system, and welcome to the community!

> _"Keep it simple, stupid." – The Arch Way_
