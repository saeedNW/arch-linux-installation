# Albert – Application Launcher

Albert is a fast, keyboard‑driven application launcher for Linux systems. It allows you to quickly search and launch applications, files, bookmarks, and perform web searches directly from your desktop. It is highly extensible through Python plugins.

> **ℹ️ Note:** Albert is not available in the official Arch Linux repositories, but can be installed from the AUR. This guide uses `yay` as the AUR helper.

---

## Table of Contents

- [Albert – Application Launcher](#albert--application-launcher)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Albert](#2-launching-albert)
  - [3. Basic Configuration](#3-basic-configuration)
  - [4. Using Albert](#4-using-albert)
  - [5. Adding Plugins (Optional)](#5-adding-plugins-optional)
  - [6. Adding Albert to System Startup](#6-adding-albert-to-system-startup)
  - [7. Updating Albert](#7-updating-albert)
  - [8. Uninstalling Albert](#8-uninstalling-albert)
  - [9. Troubleshooting](#9-troubleshooting)

---

## 1. Installation

Install the `albert` package from the AUR:

```bash
yay -S albert
```

> **💡 Tip:** The AUR package builds Albert from source, which may take a few minutes. An alternative pre‑compiled binary package `albert-bin` is also available.

---

## 2. Launching Albert

- **From the application menu** – look for “Albert” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  albert
  ```

On first launch, Albert will start in the background (system tray). You will see its icon in the notification area.

---

## 3. Basic Configuration

Right‑click the Albert tray icon and select **Settings** (or launch `albert` from the terminal and press `Ctrl+,`). The settings window allows you to customise the launcher:

- **Hotkey** – Set the keyboard shortcut to show/hide Albert. Default is `Alt+Space`.
- **Theme** – Choose between built‑in themes (`Arc Dark`, `Arc Light`, etc.).
- **Frontend** – Select the interface style (e.g., `WidgetBox`).
- **Plugins** – Enable or disable extensions (applications, files, bookmarks, Python, etc.).
- **Triggers** – Define trigger characters for specific searches (e.g., `?` for web search).

> **💡 Tip:** If you want Albert to work with the **Dock** item (macOS‑style dock), enable **Show on dock** in the **Frontend** settings.

---

## 4. Using Albert

Once configured, press your hotkey (e.g., `Alt+Space`) to open the launcher. Start typing:

| Action                  | Example                                                              |
| ----------------------- | -------------------------------------------------------------------- |
| Launch an application   | Type `firefox` → press `Enter`                                       |
| Open a file or folder   | Type `~/Documents` → press `Enter`                                   |
| Search the web          | Type `? arch linux` → press `Enter` (requires **Web Search** plugin) |
| Run a terminal command  | Type `= pacman -Syu` → press `Enter` (requires **Command** plugin)   |
| Calculate an expression | Type `= 2+2` (with the **Python** or **Calculator** plugin)          |

The results appear instantly as you type. Use the arrow keys to navigate and `Enter` to select.

---

## 5. Adding Plugins (Optional)

Albert’s functionality can be extended with Python plugins. They are stored in `~/.local/share/albert/plugins/`. The AUR package includes a few official plugins. To install additional community plugins, refer to the [Albert Plugins Repository](https://github.com/albertlauncher/plugins).

Example: Install a plugin from a Git repository:

```bash
git clone https://github.com/albertlauncher/plugins.git ~/.local/share/albert/plugins/myplugin
```

Then restart Albert and enable the plugin in **Settings → Plugins**.

> **⚠️ Note:** Plugins written in Python require `python` and may have additional dependencies. Check each plugin’s documentation.

---

## 6. Adding Albert to System Startup

To have Albert start automatically when you log in, add it to your desktop environment’s autostart.

- **GNOME / KDE / XFCE**: Open **Startup Applications** → Add → Name: `Albert`, Command: `albert`, Comment: `Application launcher`.
- **Manual method** (create a `.desktop` file):

```bash
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/albert.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Albert
Exec=albert
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF
```

After adding, log out and back in, or restart your session for the change to take effect.

> **💡 Tip:** If you prefer Albert to start minimised to the system tray, use the command `albert --daemon` in the autostart entry.

---

## 7. Updating Albert

```bash
yay -Syu albert
```

This will update Albert along with any other AUR packages.

---

## 8. Uninstalling Albert

```bash
yay -Rns albert
```

Remove configuration files (stored in `~/.config/albert/` and `~/.local/share/albert/`):

```bash
rm -rf ~/.config/albert
rm -rf ~/.local/share/albert
```

---

## 9. Troubleshooting

| Problem                                     | Solution                                                                                                                                                 |
| ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `albert: command not found`                 | Albert is not installed. Run `yay -S albert`.                                                                                                            |
| Albert does not appear when pressing hotkey | Check that the hotkey is correctly set in **Settings → Hotkey**. Also verify that no other application is stealing the shortcut.                         |
| Tray icon missing (especially on GNOME)     | GNOME may hide the tray icon. Install `gnome-shell-extension-appindicator` and enable the extension. Or restart Albert with `albert &`.                  |
| Albert uses too much CPU                    | Disable plugins you do not need. In particular, the **Files** plugin can be heavy if it indexes many directories. Exclude large folders in its settings. |
| Python plugins do not load                  | Ensure `python` is installed (`sudo pacman -S python`). Also check that the plugin files have correct permissions.                                       |
| Results are slow or incomplete              | Restart Albert with `albert --restart`. If the problem persists, reset the configuration by deleting `~/.config/albert/albert.conf`.                     |
| Albert does not remember window position    | In **Frontend** settings, try switching to a different frontend (e.g., from `WidgetBox` to `FramelessWidget`).                                           |

---

Your Albert installation is now ready to launch everything with just a few keystrokes. Enjoy the lightning‑fast workflow!
