# VMware Workstation on Arch Linux – Complete Installation & Configuration Guide

VMware Workstation is a powerful, industry‑standard desktop hypervisor that allows you to run multiple operating systems as virtual machines (VMs) on a single physical host. It supports a wide range of guest operating systems, snapshot management, 3D acceleration, and robust networking capabilities.

> **📝 Note:** This guide has been created through my own struggles and trial and error. So make sure to do your own research before proceeding blindly. VMware Workstation requires **kernel modules** (`vmmon` and `vmnet`) that must be compiled for your running kernel. After every kernel update, you may need to rebuild these modules.

---

## Table of Contents

- [VMware Workstation on Arch Linux – Complete Installation \& Configuration Guide](#vmware-workstation-on-arch-linux--complete-installation--configuration-guide)
  - [Table of Contents](#table-of-contents)
  - [1. Prerequisites](#1-prerequisites)
    - [Update the System](#update-the-system)
    - [Install Development Tools \& Kernel Headers](#install-development-tools--kernel-headers)
  - [2. Install VMware Workstation](#2-install-vmware-workstation)
  - [3. Verify Kernel Modules](#3-verify-kernel-modules)
  - [4. Enable VMware Services](#4-enable-vmware-services)
  - [5. Verify Virtual Networks](#5-verify-virtual-networks)
  - [6. Start VMware Workstation](#6-start-vmware-workstation)
  - [7. Create a New Virtual Machine](#7-create-a-new-virtual-machine)
    - [Recommended VM Settings](#recommended-vm-settings)
  - [8. Enable UEFI Firmware](#8-enable-uefi-firmware)
    - [Option 1: Manual Configuration (.vmx file)](#option-1-manual-configuration-vmx-file)
    - [Option 2: VMware GUI (Easier Method)](#option-2-vmware-gui-easier-method)
    - [Verify UEFI Boot (Inside Linux Guest)](#verify-uefi-boot-inside-linux-guest)
  - [9. Networking Modes](#9-networking-modes)
  - [10. Install VMware Tools (open-vm-tools)](#10-install-vmware-tools-open-vm-tools)
    - [Linux Guest](#linux-guest)
    - [Windows Guest](#windows-guest)
  - [11. Shared Folders](#11-shared-folders)
    - [Host Configuration](#host-configuration)
    - [Linux Guest Mount Point](#linux-guest-mount-point)
  - [12. USB Passthrough](#12-usb-passthrough)
    - [Enable the USB Arbitrator Service](#enable-the-usb-arbitrator-service)
    - [Attach a USB Device](#attach-a-usb-device)
  - [13. Snapshots](#13-snapshots)
    - [Create a Snapshot](#create-a-snapshot)
    - [Restore a Snapshot](#restore-a-snapshot)
  - [14. Common Issues \& Fixes](#14-common-issues--fixes)
    - [No Internet (Guest cannot reach network)](#no-internet-guest-cannot-reach-network)
    - [vmmon or vmnet Missing](#vmmon-or-vmnet-missing)
    - [After Kernel Upgrade VMware Stops Working](#after-kernel-upgrade-vmware-stops-working)
    - [Black Screen or Graphics Problems](#black-screen-or-graphics-problems)
  - [15. Useful Commands](#15-useful-commands)
  - [16. Recommended Setup](#16-recommended-setup)
  - [17. Uninstalling VMware Workstation](#17-uninstalling-vmware-workstation)
  - [18. Troubleshooting](#18-troubleshooting)

---

## 1. Prerequisites

Before installing VMware Workstation, ensure your system is up to date and the necessary development tools and kernel headers are installed.

### Update the System

```bash
sudo pacman -Syu
```

### Install Development Tools & Kernel Headers

For the **standard kernel** (`linux`):

```bash
sudo pacman -S base-devel linux-headers
```

For the **LTS kernel** (`linux-lts`):

```bash
sudo pacman -S base-devel linux-lts-headers
```

Verify your running kernel version:

```bash
uname -r
```

> **⚠️ Important:** The kernel headers **must match** your running kernel version. If you have recently updated your kernel, reboot before proceeding.

---

## 2. Install VMware Workstation

VMware Workstation is available in the Arch User Repository (AUR). This guide uses `yay` as the AUR helper.

```bash
yay -S vmware-workstation
```

> **💡 Tip:** The AUR package installs VMware Workstation, the `vmmon` and `vmnet` kernel modules, VMware networking services, and the USB arbitrator service. The build may take a few minutes.

---

## 3. Verify Kernel Modules

Check that the VMware kernel modules (`vmmon` and `vmnet`) are present:

```bash
modinfo vmmon
modinfo vmnet
```

If they exist, load them manually:

```bash
sudo modprobe vmmon
sudo modprobe vmnet
```

Verify they are loaded:

```bash
lsmod | grep vm
```

Expected output:

```plaintext
vmmon
vmnet
vmw_vmci
```

> **💡 Tip:** If the modules are missing, they may need to be rebuilt. See [Troubleshooting](#14-common-issues--fixes).

---

## 4. Enable VMware Services

Enable and start the VMware networking service:

```bash
sudo systemctl enable --now vmware-networks.service
```

For USB passthrough support (optional but recommended):

```bash
sudo systemctl enable --now vmware-usbarbitrator.service
```

Verify the services are running:

```bash
systemctl status vmware-networks.service
systemctl status vmware-usbarbitrator.service
```

---

## 5. Verify Virtual Networks

Check the VMware network devices:

```bash
ls -l /dev/vmnet*
```

Expected output:

```plaintext
/dev/vmnet0
/dev/vmnet1
/dev/vmnet8
```

| Device        | Network Mode |
| ------------- | ------------ |
| `/dev/vmnet0` | Bridged      |
| `/dev/vmnet1` | Host‑only    |
| `/dev/vmnet8` | NAT          |

---

## 6. Start VMware Workstation

Launch VMware Workstation from the terminal:

```bash
vmware
```

Or run it in the background:

```bash
vmware &
```

On first launch, you will be prompted to:

- Accept the license agreement
- Configure user experience options
- Enter a license key (if required)

> **💡 Tip:** The free version does not require a license key for basic functionality.

---

## 7. Create a New Virtual Machine

1. **File → New Virtual Machine**
2. Select **Typical** (recommended for beginners)
3. Choose your installation media (ISO file or physical disc)
4. Select the guest operating system type and version
5. Choose a name and storage location for the VM
6. Allocate disk space (the `.vmdk` file will grow dynamically)

### Recommended VM Settings

| Setting                | Recommendation               |
| ---------------------- | ---------------------------- |
| **CPU virtualization** | Enabled (VT‑x/AMD‑V)         |
| **CPU cores**          | 2–4 (depending on host)      |
| **RAM**                | 4–8 GB (or half of host RAM) |
| **Virtual disk**       | NVMe (faster than SCSI)      |
| **Firmware**           | UEFI (see Section 8)         |

---

## 8. Enable UEFI Firmware

By default, VMware Workstation uses BIOS firmware for new virtual machines. However, UEFI offers several advantages: faster boot times, support for larger disks (GPT), Secure Boot, and better compatibility with modern operating systems.

### Option 1: Manual Configuration (.vmx file)

1. Power off the VM.
2. Locate the VM configuration file (`<vm-name>.vmx`) in the VM's directory.
3. Open the file in a text editor and add or modify the following line:

   ```ini
   firmware = "efi"
   ```

4. Save the file and power on the VM.

### Option 2: VMware GUI (Easier Method)

1. Power off the VM.
2. In the VMware Workstation main window, select the VM and click **VM → Settings** (or right‑click the VM → **Settings**).
3. Go to the **Options** tab.
4. In the left sidebar, select **Advanced**.
5. Under the **Firmware type** section, select **UEFI** instead of **BIOS**.
6. Click **OK** to save the changes.

> **💡 Tip:** The GUI method is simpler and recommended for most users. The `.vmx` file method is useful if you are scripting or managing VMs remotely.

### Verify UEFI Boot (Inside Linux Guest)

After powering on the VM, verify that the guest booted in UEFI mode:

```bash
ls /sys/firmware/efi
```

If the directory exists, the system is booted in UEFI mode.

> **⚠️ Note:** Changing the firmware type after OS installation may render the VM unbootable. It is best to set the firmware type **before** installing the guest operating system.

---

## 9. Networking Modes

| Mode                  | Description                                            | Adapter  | Use Case                                                       |
| --------------------- | ------------------------------------------------------ | -------- | -------------------------------------------------------------- |
| **NAT** (recommended) | Guest accesses internet through the host’s IP address. | `VMnet8` | Most common; works in any network environment.                 |
| **Bridged**           | Guest appears as a separate device on the same LAN.    | `VMnet0` | Running servers or network labs where the VM needs its own IP. |
| **Host‑only**         | Guest communicates only with the host machine.         | `VMnet1` | Isolated testing environments.                                 |

To change the networking mode, go to **VM Settings → Network Adapter** and select the desired mode.

---

## 10. Install VMware Tools (open-vm-tools)

VMware Tools (open‑source version) provides better mouse integration, dynamic resolution, clipboard sharing, and time synchronisation.

### Linux Guest

For Arch Linux guests:

```bash
sudo pacman -S open-vm-tools
sudo systemctl enable --now vmtoolsd.service
```

For Debian/Ubuntu guests:

```bash
sudo apt install open-vm-tools open-vm-tools-desktop
```

### Windows Guest

From the VMware menu:

```plaintext
VM → Install VMware Tools
```

Then run the installer inside the Windows guest.

---

## 11. Shared Folders

Shared folders allow you to exchange files between the host and guest.

### Host Configuration

1. Open **VM Settings → Options → Shared Folders**
2. Select **Always enabled**
3. Click **Add** and choose a host folder to share
4. Specify the share name (used inside the guest)

### Linux Guest Mount Point

Shared folders appear in:

```plaintext
/mnt/hgfs/<share-name>
```

To mount them automatically, add an entry to `/etc/fstab`:

```plaintext
.host:/<share-name> /mnt/hgfs/<share-name> fuse.vmhgfs-fuse allow_other,defaults 0 0
```

> **⚠️ Note:** Shared folders require `open-vm-tools` (see Section 10) to work.

---

## 12. USB Passthrough

USB passthrough allows you to connect physical USB devices to your VM.

### Enable the USB Arbitrator Service

```bash
sudo systemctl enable --now vmware-usbarbitrator.service
```

### Attach a USB Device

1. Power on the VM
2. Go to **VM → Removable Devices**
3. Select the desired USB device
4. Click **Connect (Disconnect from host)**

> **💡 Tip:** If a USB device does not appear, ensure the service is running and the device is not mounted on the host.

---

## 13. Snapshots

Snapshots capture the current state of a VM, allowing you to revert to that state later.

### Create a Snapshot

```text
VM → Snapshot → Take Snapshot
```

### Restore a Snapshot

```text
VM → Snapshot → Revert to Snapshot
```

> **💡 Recommendation:** Take a snapshot before major changes:
>
> - OS upgrades
> - Kernel updates
> - Major software installations
> - Configuration changes

---

## 14. Common Issues & Fixes

### No Internet (Guest cannot reach network)

**Symptoms:**

```plaintext
Could not connect Ethernet0 to /dev/vmnet0
```

**Fix:**

```bash
sudo modprobe vmnet
sudo systemctl enable --now vmware-networks.service
```

Verify with:

```bash
ls -l /dev/vmnet*
```

### vmmon or vmnet Missing

**Symptoms:** VMware fails to start with "kernel modules not found".

**Fix:** Rebuild the modules:

```bash
sudo dkms autoinstall
```

### After Kernel Upgrade VMware Stops Working

**Cause:** The kernel modules need to be rebuilt for the new kernel version.

**Fix:**

```bash
sudo dkms autoinstall
sudo modprobe vmmon
sudo modprobe vmnet
```

Reboot if necessary.

### Black Screen or Graphics Problems

**Fix:** Disable 3D acceleration in the VM settings:

1. Open **VM Settings → Display**
2. Uncheck **Accelerate 3D graphics**

---

## 15. Useful Commands

| Command                                             | Purpose                            |
| --------------------------------------------------- | ---------------------------------- |
| `lsmod \| grep vm`                                  | Check loaded VMware kernel modules |
| `systemctl status vmware-networks.service`          | Check networking service status    |
| `ls -l /dev/vmnet*`                                 | List virtual network devices       |
| `sudo modprobe vmmon`                               | Load vmmon module                  |
| `sudo modprobe vmnet`                               | Load vmnet module                  |
| `sudo systemctl start vmware-networks.service`      | Start networking service           |
| `sudo systemctl start vmware-usbarbitrator.service` | Start USB arbitrator service       |
| `tail -f ~/vmware/<vm-name>/vmware.log`             | View live logs for a specific VM   |

---

## 16. Recommended Setup

For a reliable daily‑development environment:

- **UEFI firmware** enabled
- **NAT networking** (works everywhere)
- **open-vm-tools** installed in all guests
- **Snapshots** before major changes
- **LTS kernel** on the host (fewer breaking updates)
- Matching **kernel headers** installed
- `vmware-networks.service` enabled
- `vmware-usbarbitrator.service` enabled

---

## 17. Uninstalling VMware Workstation

```bash
yay -Rns vmware-workstation
```

Stop and disable services before removal:

```bash
sudo systemctl stop vmware-networks.service
sudo systemctl disable vmware-networks.service
sudo systemctl stop vmware-usbarbitrator.service
sudo systemctl disable vmware-usbarbitrator.service
```

Remove leftover configuration files:

```bash
rm -rf ~/.vmware
rm -rf ~/vmware
```

---

## 18. Troubleshooting

| Problem                                                 | Solution                                                                                                                                    |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `vmware: command not found`                             | The package is not installed. Run `yay -S vmware-workstation`.                                                                              |
| `Could not open /dev/vmmon: No such file or directory`  | Load the module: `sudo modprobe vmmon`. If it fails, rebuild with `sudo dkms autoinstall`.                                                  |
| `Could not open /dev/vmnet0: No such file or directory` | Load `vmnet`: `sudo modprobe vmnet`. Also check `vmware-networks.service`.                                                                  |
| `Failed to start VMware Networking`                     | The service may require a reboot after installing. Also check `dkms` logs.                                                                  |
| Guest has no internet                                   | Ensure NAT service is running. Check `ls -l /dev/vmnet*`. If missing, restart networking: `sudo systemctl restart vmware-networks.service`. |
| USB device not detected in guest                        | Enable `vmware-usbarbitrator.service` and verify it is running.                                                                             |
| Keyboard/mouse unresponsive in guest                    | Install `open-vm-tools` inside the guest (see Section 10).                                                                                  |
| VMware crashes when opening VM                          | Disable 3D acceleration in the VM settings (see Section 14).                                                                                |

---

Your VMware Workstation installation is now ready for virtualisation. Enjoy running multiple operating systems on your Arch Linux machine!
