# ZCode – AI Coding Assistant

ZCode is an AI-powered development tool that combines autonomous agents with existing toolchains for planning, coding, review, and deployment. It is distributed as an Electron-based desktop application.

> **ℹ️ Note:** This guide assumes you are using **Arch Linux** or an Arch‑based distribution. Package manager commands (`yay`) are specific to Arch.

---

## Table of Contents

- [ZCode – AI Coding Assistant](#zcode--ai-coding-assistant)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching ZCode](#2-launching-zcode)
  - [3. Optional Dependencies](#3-optional-dependencies)
  - [4. Updating ZCode](#4-updating-zcode)
  - [5. Uninstalling ZCode](#5-uninstalling-zcode)
  - [6. Troubleshooting](#6-troubleshooting)

---

## 1. Installation

Install `z-code-bin` from the AUR using `yay` (or your preferred AUR helper):

```bash
yay -S z-code-bin
```

This installs the official ZCode Electron application packaged as an Arch Linux package.

---

## 2. Launching ZCode

After installation, launch ZCode:

- **From the application menu** – search for "ZCode"
- **From the terminal** – run:

  ```bash
  zcode
  ```

On first launch, sign in with your account through the app's authentication flow.

---

## 3. Optional Dependencies

Install `libappindicator-gtk3` to enable system tray icon support:

```bash
yay -S libappindicator-gtk3
```

---

## 4. Updating ZCode

ZCode updates are handled by pacman. To update:

```bash
yay -Syu
```

---

## 5. Uninstalling ZCode

```bash
yay -Rns z-code-bin
```

Remove local configuration and cache files:

```bash
rm -rf ~/.config/ZCode
rm -rf ~/.cache/ZCode
```

---

## 6. Troubleshooting

| Problem                    | Solution                                                                              |
| -------------------------- | ------------------------------------------------------------------------------------- |
| `zcode: command not found` | Close and reopen your terminal, or log out and back in.                               |
| System tray icon missing   | Install `libappindicator-gtk3` and restart ZCode.                                     |
| Application fails to start | Ensure required dependencies (`gtk3`, `libnotify`, `libsecret`, `nss`) are installed. |

---

Your ZCode AI assistant is now ready. Enjoy AI-powered planning, coding, review, and deployment on Arch Linux.
