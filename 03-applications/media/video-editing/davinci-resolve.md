# DaVinci Resolve Installation Guide

DaVinci Resolve is a professional video editing, colour correction, visual effects, and audio post‑production software suite. It is proprietary software from Blackmagic Design; the free version is fully featured, while the **Studio** version adds advanced neural engine tools, HDR workflows, and extra filters. For Linux, it runs natively but requires manual intervention to install on Arch Linux because the AUR package no longer downloads the installer automatically.

> **📝 Prerequisite:** DaVinci Resolve requires **OpenGL** and **OpenCL** drivers. For open‑source drivers, Mesa provides Rusticl for AMD and Intel. For NVIDIA, install the proprietary drivers. The AUR package does not pull all dependencies automatically; you must install them beforehand.

---

## Table of Contents

- [DaVinci Resolve Installation Guide](#davinci-resolve-installation-guide)
  - [Table of Contents](#table-of-contents)
  - [1. Important Notes Before Installing](#1-important-notes-before-installing)
  - [2. Installation Methods](#2-installation-methods)
    - [2.1 Free Version (davinci-resolve)](#21-free-version-davinci-resolve)
    - [2.2 Studio Version (davinci-resolve-studio)](#22-studio-version-davinci-resolve-studio)
  - [3. Post‑Installation Configuration](#3-postinstallation-configuration)
    - [3.1 Graphics Card Tweaks](#31-graphics-card-tweaks)
    - [3.2 Fix for libc++ Breakage (Oct 2025 update)](#32-fix-for-libc-breakage-oct-2025-update)
    - [3.3 Enable Hardware‑Accelerated Encoding](#33-enable-hardwareaccelerated-encoding)
  - [4. Launching DaVinci Resolve](#4-launching-davinci-resolve)
  - [5. Updating DaVinci Resolve](#5-updating-davinci-resolve)
  - [6. Uninstalling DaVinci Resolve](#6-uninstalling-davinci-resolve)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. Important Notes Before Installing

- **Manual installer required** – Since version `19.1.3-2` (January 2025), the PKGBUILD no longer includes direct download links. You must manually download the installer zip from Blackmagic Design’s website and place it in the same directory as the PKGBUILD.
- **Dependencies** – The AUR package expects a long list of dependencies, including `apr-util`, `ffmpeg4.4`, `fuse2`, `glu`, `gst-plugins-bad-libs`, and `gtk2` (from the AUR). Install them first to avoid build failures.
- **Graphics drivers** – You need a working OpenGL/OpenCL stack. For Intel/AMD, use `mesa` and `opencl-mesa` (Rusticl). For NVIDIA, install `opencl-nvidia` alongside the proprietary driver.
- **No AUR helper** – Because you must place the downloaded installer manually, **do not use a helper like `yay` or `paru`**. Instead, you will clone the PKGBUILD repository and build the package with `makepkg`.
- **`libc++` crash after system updates** – An Arch update in October 2025 broke compatibility with Resolve 20.x because of changes to `libc++` and `libc++abi`. You may need to copy older library versions into `/opt/resolve/libs` (see Troubleshooting).

---

## 2. Installation Methods

### 2.1 Free Version (davinci-resolve)

1. **Install build dependencies**

   ```bash
   sudo pacman -S --needed base-devel git
   ```

2. **Install the required OpenGL/OpenCL drivers** (adjust to your GPU)
   - For Intel/AMD (open‑source):

     ```bash
     sudo pacman -S mesa opencl-mesa
     ```

   - For NVIDIA (proprietary):

     ```bash
     sudo pacman -S nvidia nvidia-utils opencl-nvidia
     ```

3. **Clone the AUR package and enter the directory**

   ```bash
   git clone https://aur.archlinux.org/davinci-resolve.git
   cd davinci-resolve
   ```

4. **Download the official installer** from [Blackmagic Design](https://www.blackmagicdesign.com/support/download/) (free version). Save the **`.zip`** file (e.g. `DaVinci_Resolve_<version>_Linux.zip`) inside the `davinci-resolve` directory.

5. **Update the PKGBUILD with the correct checksum** (if the script does not do it automatically):
   - Run `sha256sum DaVinci_Resolve_*.zip` to obtain the hash.
   - Open `PKGBUILD` with a text editor and replace the existing `sha256sums` value with the new hash.

6. **Build and install the package**

   ```bash
   makepkg -si
   ```

   The `-si` flag synchronises dependencies and installs the built package.

### 2.2 Studio Version (davinci-resolve-studio)

The process is identical, except that you clone the **studio** package and download the **Studio** installer (requires a license key or dongle).

```bash
git clone https://aur.archlinux.org/davinci-resolve-studio.git
cd davinci-resolve-studio
# (download Studio zip, verify checksum)
makepkg -si
```

> **⚠️ Caution:** The installer zip **must** be placed inside the cloned directory **before** running `makepkg`. The build process will fail if the file is missing or has an incorrect checksum.

---

## 3. Post‑Installation Configuration

### 3.1 Graphics Card Tweaks

If DaVinci Resolve crashes on startup or refuses to open projects, you may need to force the application to use the correct GPU.

- **Launch with OpenCL GPU override** (replace `/dev/dri/renderD128` with the appropriate render node for your GPU):

  ```bash
  DAVINCI_RESOLVE_OPENCL_DEVICE=/dev/dri/renderD128 davinci-resolve
  ```

- **Check which OpenCL devices are available**:

  ```bash
  clinfo | grep "Device Name"
  ```

- For **multi‑GPU systems**, you can try switching between GPUs or disabling GPU‑accelerated scopes in the application’s preferences.

### 3.2 Fix for libc++ Breakage (Oct 2025 update)

If you installed Resolve **after** October 2025 and it fails to start with an error related to `libc++` or `libc++abi`, copy older library versions into Resolve’s library directory:

```bash
# Find the location of the older libc++ libraries (if you have them from an older system)
# or download them from a trusted repository. Then:
sudo cp /path/to/old/libc++.so.1 /opt/resolve/libs/
sudo cp /path/to/old/libc++abi.so.1 /opt/resolve/libs/
```

After copying, run `ldd /opt/resolve/bin/resolve` to confirm the libraries are found.

### 3.3 Enable Hardware‑Accelerated Encoding

For faster exports, install **ffmpeg** with GPU‑acceleration support and configure Resolve to use it. The free version has more limited encoding options than the Studio edition.

---

## 4. Launching DaVinci Resolve

- **From the application menu** – A `.desktop` entry should be created automatically.
- **From the terminal**:

  ```bash
  davinci-resolve
  ```

If you installed the Studio version, the command is `davinci-resolve-studio`.

> **💡 Tip:** The first start may take 20–30 seconds while the application initialises. If nothing appears, check the log at `~/.local/share/DaVinciResolve/logs/ResolveDebug.txt`.

---

## 5. Updating DaVinci Resolve

Because the AUR package does not automatically download the installer, you must repeat the manual steps for each new version:

1. **Remove the existing package**:

   ```bash
   sudo pacman -Rns davinci-resolve
   ```

2. **Delete the old source directory** (or clean it):

   ```bash
   rm -rf davinci-resolve
   ```

3. **Clone the AUR package again**:

   ```bash
   git clone https://aur.archlinux.org/davinci-resolve.git
   cd davinci-resolve
   ```

4. **Download the new installer zip** from Blackmagic Design and place it inside the directory.

5. **Build and install**:

   ```bash
   makepkg -si
   ```

---

## 6. Uninstalling DaVinci Resolve

```bash
sudo pacman -Rns davinci-resolve
```

Remove the local configuration directory (optional):

```bash
rm -rf ~/.local/share/DaVinciResolve
```

If you also want to remove the source directory:

```bash
rm -rf davinci-resolve
```

---

## 7. Troubleshooting

| Problem                                       | Solution                                                                                                                                                                                                                                         |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Makepkg complains “source file not found”** | You forgot to place the `.zip` installer inside the cloned directory, or the filename does not match what the PKGBUILD expects.                                                                                                                  |
| **Checksum mismatch**                         | Blackmagic Design released a new build with the same version number. Recompute the SHA256 hash and update `PKGBUILD` accordingly.                                                                                                                |
| **DaVinci Resolve crashes on launch**         | Check `~/.local/share/DaVinciResolve/logs/ResolveDebug.txt`. A common cause is missing OpenCL drivers (see Section 1). Another known issue is the `libc++` breakage described in Section 3.2.                                                    |
| **“GPU not supported” error**                 | Your GPU is too old or the OpenCL driver is not correctly installed. Try switching to Rusticl (`opencl-mesa`) instead of the legacy `opencl-amd` driver.                                                                                         |
| **No audio or video playback**                | Install additional codecs: `sudo pacman -S gst-plugins-good gst-plugins-bad gst-plugins-ugly`.                                                                                                                                                   |
| **Impossible to import MP4 files**            | The free version of Resolve on Linux **cannot import MP4 files** out of the box. Convert them to DNxHD or ProRes using `ffmpeg` before importing.                                                                                                |
| **“Failed to load module” errors**            | Some dependencies may be missing. Run `ldd /opt/resolve/bin/resolve                                                                                                                          \| grep "not found"` to identify missing libraries. |

---

Your DaVinci Resolve installation should now be ready for professional colour grading and editing. Enjoy the power of industry‑standard video post‑production on Arch Linux!
