# WINE – Run Windows Applications on Linux

WINE (Wine Is Not an Emulator) is a compatibility layer that allows you to run Windows applications on Linux. It translates Windows API calls into POSIX calls on the fly. This guide covers installation, configuration, and management of WINE on Arch Linux / EndeavourOS.

> **📝 Prerequisite:** Ensure the [multilib repository is enabled](https://wiki.archlinux.org/title/Official_repositories). WINE requires 32‑bit libraries to run most Windows applications.

---

## Table of Contents

- [WINE – Run Windows Applications on Linux](#wine--run-windows-applications-on-linux)
  - [Table of Contents](#table-of-contents)
  - [How WINE Works](#how-wine-works)
  - [1. Install WINE](#1-install-wine)
    - [Basic Installation (WINE Stable)](#basic-installation-wine-stable)
    - [Alternative: WINE Staging (Better Compatibility)](#alternative-wine-staging-better-compatibility)
    - [Install Essential Components](#install-essential-components)
  - [2. Install Winetricks](#2-install-winetricks)
  - [3. (Optional) Install DXVK for Gaming](#3-optional-install-dxvk-for-gaming)
  - [4. Configure WINE](#4-configure-wine)
    - [Create a WINE Prefix](#create-a-wine-prefix)
    - [WINE Configuration Settings](#wine-configuration-settings)
    - [Set Windows Version via Command Line](#set-windows-version-via-command-line)
  - [5. Test WINE Installation](#5-test-wine-installation)
  - [6. Install Common Windows Libraries (via Winetricks)](#6-install-common-windows-libraries-via-winetricks)
  - [7. GUI Frontends for WINE](#7-gui-frontends-for-wine)
  - [8. Common WINE Environment Variables](#8-common-wine-environment-variables)
  - [9. Uninstalling WINE](#9-uninstalling-wine)
  - [10. Troubleshooting](#10-troubleshooting)

---

## How WINE Works

| Component      | Purpose                                                             |
| -------------- | ------------------------------------------------------------------- |
| **WINE core**  | Translates Windows API to Linux syscalls.                           |
| **wine-gecko** | HTML rendering engine (replaces Internet Explorer).                 |
| **wine-mono**  | .NET Framework implementation.                                      |
| **Winetricks** | Helper script to install common DLLs and runtime components.        |
| **DXVK**       | DirectX 9/10/11 → Vulkan translation (improves gaming performance). |

---

## 1. Install WINE

### Basic Installation (WINE Stable)

```bash
sudo pacman -S wine
```

### Alternative: WINE Staging (Better Compatibility)

`wine-staging` includes experimental patches for newer Windows applications:

```bash
sudo pacman -S wine-staging
```

> **💡 Recommendation:** Use `wine-staging` for gaming or recent Windows software. Use `wine` for stability‑critical setups.

### Install Essential Components

```bash
sudo pacman -S wine-gecko wine-mono
```

- `wine-gecko` – Required for applications that embed web content.
- `wine-mono` – Required for .NET Framework‑based applications.

> **⚠️ Note:** The complex optional dependencies command (`pacman -Si wine | sed ...`) is **not needed**. Install optional libraries only when a specific application complains.

---

## 2. Install Winetricks

Winetricks simplifies installing common Windows libraries (DirectX, Visual C++ runtimes, etc.):

```bash
sudo pacman -S winetricks
```

---

## 3. (Optional) Install DXVK for Gaming

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

> **ℹ️ Note:** DXVK requires Vulkan‑capable graphics drivers. Verify with `vulkaninfo | grep deviceName`.

---

## 4. Configure WINE

### Create a WINE Prefix

A WINE prefix is a directory that mimics a Windows C: drive. By default, it is `~/.wine`. Create a 64‑bit prefix:

```bash
winecfg
```

This command creates the default prefix if it doesn’t exist and opens the configuration window.

For a **32‑bit only prefix** (required for some older applications):

```bash
WINEPREFIX=~/wine32 WINEARCH=win32 winecfg
```

> **💡 Tip:** Use separate prefixes for different applications to avoid conflicts.

### WINE Configuration Settings

In the `winecfg` window:

| Tab              | Recommended Setting                                                       |
| ---------------- | ------------------------------------------------------------------------- |
| **Applications** | Windows version: Windows 10 or Windows 11.                                |
| **Libraries**    | Add DLL overrides for problematic libraries (e.g., `d3d10core`, `d3d11`). |
| **Graphics**     | Enable “Emulate a virtual desktop” for troublesome fullscreen apps.       |
| **Drives**       | Auto‑detect drives or add custom drive mappings.                          |

### Set Windows Version via Command Line

```bash
winecfg -v win10
```

Available versions: `win10`, `win81`, `win7`, `vista`, `winxp`.

---

## 5. Test WINE Installation

Run a simple Windows application or the built‑in WINE utilities:

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

## 6. Install Common Windows Libraries (via Winetricks)

Many Windows applications require additional libraries. Run Winetricks:

```bash
winetricks
```

Select from the menu:

- **Install a Windows DLL** – Common choices: `dotnet48`, `vcrun2019`, `d3dx9`, `d3dx11`.
- **Install a Windows application** – Steam, Notepad++, 7‑Zip, etc.

**Command‑line examples:**

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

> **⚠️ Warning:** Installing `.NET Framework` via winetricks can take 10–30 minutes and may fail. If it fails, retry or use `wine-mono` instead.

---

## 7. GUI Frontends for WINE

These tools simplify managing multiple WINE prefixes and configurations:

| Frontend        | Installation                 | Use Case                                  |
| --------------- | ---------------------------- | ----------------------------------------- |
| **Bottles**     | `yay -S bottles`             | Modern GTK‑based, easy prefix management. |
| **PlayOnLinux** | `sudo pacman -S playonlinux` | Gaming‑focused, scripted installs.        |
| **Q4Wine**      | `sudo pacman -S q4wine`      | Qt‑based, advanced settings.              |
| **Lutris**      | `sudo pacman -S lutris`      | Gaming platform with WINE integration.    |

> **💡 Recommendation:** For gaming, use **Lutris**. For general Windows apps, use **Bottles**.

---

## 8. Common WINE Environment Variables

| Variable           | Purpose                                | Example                                           |
| ------------------ | -------------------------------------- | ------------------------------------------------- |
| `WINEPREFIX`       | Specify prefix location.               | `WINEPREFIX=~/myapp wine setup.exe`               |
| `WINEARCH`         | Set architecture (`win32` or `win64`). | `WINEARCH=win32 winecfg`                          |
| `WINEDEBUG`        | Enable debug output.                   | `WINEDEBUG=+loaddll wine app.exe`                 |
| `WINEDLLOVERRIDES` | Override specific DLLs.                | `WINEDLLOVERRIDES="mscoree,mshtml=" wine app.exe` |

---

## 9. Uninstalling WINE

```bash
sudo pacman -Rns wine wine-staging wine-gecko wine-mono winetricks
```

Remove WINE prefixes (this deletes all installed Windows applications):

```bash
rm -rf ~/.wine ~/wine32 ~/.local/share/wineprefixes
```

Remove WINE application shortcuts:

```bash
rm -rf ~/.local/share/applications/wine
```

---

## 10. Troubleshooting

| Problem                                      | Solution                                                                              |
| -------------------------------------------- | ------------------------------------------------------------------------------------- |
| `wine: command not found`                    | WINE is not installed. Run `sudo pacman -S wine`.                                     |
| `wine: error while loading shared libraries` | Missing 32‑bit libraries. Enable multilib and run `sudo pacman -S lib32-glibc`.       |
| Application won't launch (silent failure)    | Run `wine app.exe 2>&1 \| tee wine.log` to capture errors.                            |
| DLL missing errors (e.g., `d3dx9_43.dll`)    | Install with `winetricks d3dx9`.                                                      |
| .NET Framework installation fails            | Use `wine-mono` instead. Or retry `winetricks dotnet48` (may take multiple attempts). |
| Black screen / graphics issues in games      | Install DXVK: `winetricks dxvk`. Ensure Vulkan drivers are installed.                 |
| Application runs very slowly                 | Disable CSMT (if using old WINE). For modern WINE, ensure DXVK is enabled.            |
| Audio crackling or missing                   | Configure audio in `winecfg` → Audio tab. Try different driver (PulseAudio, ALSA).    |
| Cannot copy/paste between Linux and WINE     | Install `winetricks` and run `winetricks riched30 riched20`.                          |
| Fonts look terrible                          | Install core fonts: `winetricks corefonts`.                                           |
| Application crashes on startup               | Try different Windows version in `winecfg` (e.g., Windows 7 instead of Windows 10).   |

---

Your WINE installation is now ready to run Windows applications on Arch Linux. Enjoy the compatibility!
