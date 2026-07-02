# GIMP – GNU Image Manipulation Program

GIMP (GNU Image Manipulation Program) is a powerful open‑source image editing software. It is available in the official Arch Linux `extra` repository, so no AUR helper is required.

> **ℹ️ Note:** GIMP is highly configurable. You can change keybindings, themes, and even the entire user interface to mimic Adobe Photoshop.

---

## Table of Contents

- [GIMP – GNU Image Manipulation Program](#gimp--gnu-image-manipulation-program)
	- [Table of Contents](#table-of-contents)
	- [1. Installation](#1-installation)
	- [2. Launching GIMP](#2-launching-gimp)
	- [3. Basic Configuration](#3-basic-configuration)
	- [4. Change GIMP’s Look – Photoshop‑like Layout (PhotoGIMP)](#4-change-gimps-look--photoshoplike-layout-photogimp)
		- [Step 1 – Install GIMP (if not already done)](#step-1--install-gimp-if-not-already-done)
		- [Step 2 – Run GIMP at Least Once](#step-2--run-gimp-at-least-once)
		- [Step 3 – Download PhotoGIMP](#step-3--download-photogimp)
		- [Step 4 – Extract and Overwrite the Configuration](#step-4--extract-and-overwrite-the-configuration)
		- [Step 5 – Launch GIMP and Enjoy the New Layout](#step-5--launch-gimp-and-enjoy-the-new-layout)
	- [5. Optional Photoshop Keybindings Only (Without Full Theme)](#5-optional-photoshop-keybindings-only-without-full-theme)
	- [6. Uninstalling GIMP](#6-uninstalling-gimp)
	- [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S gimp
```

This installs the latest stable version of GIMP from the official repositories.

> **💡 Tip:** For language‑specific help files, you can also install `gimp-help-<language>` (e.g. `gimp-help-en` for English).

---

## 2. Launching GIMP

- **From the application menu** – look for “GIMP” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  gimp
  ```

---

## 3. Basic Configuration

- **Single‑Window Mode** – By default, GIMP uses multiple floating windows. To switch to a single‑window interface (similar to Photoshop), go to **Windows → Single‑Window Mode**.
- **Theme & Icon Size** – In **Edit → Preferences → Interface**, you can change the theme (Dark, Light, Gray) and adjust icon sizes.
- **Toolbox Layout** – You can rearrange tool dialogs by dragging them into the dockable areas.

---

## 4. Change GIMP’s Look – Photoshop‑like Layout (PhotoGIMP)

[PhotoGIMP](https://github.com/Diolinux/PhotoGIMP) is a free, community‑driven patch that transforms GIMP into a layout that feels familiar to Adobe Photoshop users. It reorganises tools, applies Photoshop keyboard shortcuts, adds a custom splash screen, and maximises canvas space.

> **⚠️ Important:** PhotoGIMP **overwrites** GIMP’s configuration files. If you have custom settings you want to keep, back them up first.

### Step 1 – Install GIMP (if not already done)

```bash
sudo pacman -S gimp
```

### Step 2 – Run GIMP at Least Once

GIMP needs to generate its configuration folders before PhotoGIMP can overwrite them. Launch GIMP once (the default layout appears), then close it.

```bash
gimp
# Close after first start
```

### Step 3 – Download PhotoGIMP

Download the latest PhotoGIMP `.zip` file for Linux:

```bash
curl -L -o ~/Downloads/PhotoGIMP-linux.zip https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/PhotoGIMP-linux.zip
```

### Step 4 – Extract and Overwrite the Configuration

Extract the `.zip` file directly into your home folder (`~`). The archive will place files into `~/.config/GIMP/3.0/` and `~/.local/`. When prompted, choose **“Overwrite”**.

```bash
cd ~
unzip -o ~/Downloads/PhotoGIMP-linux.zip
```

> **💡 Tip:** The PhotoGIMP release is for GIMP 3.0. If you are using an older GIMP (2.10), the config path would be `~/.config/GIMP/2.10/` instead. The steps remain the same; adjust the folder accordingly.

### Step 5 – Launch GIMP and Enjoy the New Layout

```bash
gimp
```

You should now see a Photoshop‑like interface with a single‑column toolbar on the left and tool adjustments / layer windows on the right. Keyboard shortcuts are also replaced with Photoshop defaults.

---

## 5. Optional Photoshop Keybindings Only (Without Full Theme)

If you only want the keybindings (not the full interface), you can extract just the relevant part from the PhotoGIMP archive. The `menurc` file (keyboard shortcuts) is included in the theme. After downloading PhotoGIMP, extract only the `menurc` file and copy it to your GIMP configuration directory.

```bash
unzip -j ~/Downloads/PhotoGIMP-linux.zip "*/config/GIMP/3.0/menurc" -d ~/.config/GIMP/3.0/
```

After restarting GIMP, your shortcuts will match the Photoshop layout.

---

## 6. Uninstalling GIMP

```bash
sudo pacman -Rns gimp
```

Remove leftover configuration files (optional):

```bash
rm -rf ~/.config/GIMP
rm -rf ~/.local/share/gimp
```

If you installed PhotoGIMP and want to revert to the default GIMP settings, delete the `~/.config/GIMP/3.0` folder (or restore from a backup).

---

## 7. Troubleshooting

| Problem                                                 | Solution                                                                                                                                                                             |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `gimp: command not found`                               | GIMP is not installed. Run `sudo pacman -S gimp`.                                                                                                                                    |
| GIMP does not start                                     | Install missing libraries: `sudo pacman -S gtk3 libgexiv2`.                                                                                                                          |
| PhotoGIMP does not apply (no layout change)             | Make sure you ran GIMP at least once before applying PhotoGIMP. Also check the GIMP version – PhotoGIMP is for GIMP 3.0. For GIMP 2.10, the config folder is `~/.config/GIMP/2.10/`. |
| “Permission denied” when extracting PhotoGIMP           | You may need to extract without `sudo`. Use `unzip -o ~/Downloads/PhotoGIMP-linux.zip` in your home folder.                                                                          |
| PhotoGIMP applied but shortcuts still use GIMP defaults | The shortcut file (`menurc`) may not have been overwritten. Manually copy it: `cp ~/.local/share/PhotoGIMP/3.0/config/GIMP/3.0/menurc ~/.config/GIMP/3.0/`.                          |
| GIMP crashes after applying PhotoGIMP                   | Corrupted configuration. Delete `~/.config/GIMP/3.0` and reapply PhotoGIMP.                                                                                                          |
| Fonts look blurry                                       | Go to **Edit → Preferences → Interface → Theme** and increase the **Icon Size** or adjust **Font DPI** settings.                                                                     |

---

Your GIMP installation is now ready for professional image editing – with the look and feel of Photoshop if you choose. Enjoy the freedom of open‑source creativity!
