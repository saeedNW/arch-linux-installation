# Rclone Browser – GUI for Rclone

Rclone Browser is a simple cross‑platform GUI that provides a graphical interface to the `rclone` command‑line tool. It makes managing and synchronising files with cloud storage services (Google Drive, Dropbox, OneDrive, etc.) much easier.

> **📝 Prerequisite:** `rclone` must be installed and configured before using Rclone Browser (see the [Rclone guide](./rclone.md). The GUI interacts with your existing rclone configuration.

---

## Table of Contents

- [Rclone Browser – GUI for Rclone](#rclone-browser--gui-for-rclone)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Rclone Browser](#2-launching-rclone-browser)
  - [3. Initial Configuration via Rclone Browser](#3-initial-configuration-via-rclone-browser)
  - [4. Using Rclone Browser (Mounting \& Syncing)](#4-using-rclone-browser-mounting--syncing)
  - [5. Desktop Integration (System Tray \& Autostart)](#5-desktop-integration-system-tray--autostart)
    - [Close to System Tray](#close-to-system-tray)
    - [Add to System Startup](#add-to-system-startup)
  - [6. Updating Rclone Browser](#6-updating-rclone-browser)
  - [7. Uninstalling Rclone Browser](#7-uninstalling-rclone-browser)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Installation

Rclone Browser is available in the AUR. Install it using your preferred AUR helper (this guide uses `yay`):

```bash
yay -S rclone-browser
```

> **💡 Tip:** The package installs the GUI application; it does **not** reinstall `rclone`. You must have `rclone` already installed (see the [Rclone guide](./rclone.md)).

---

## 2. Launching Rclone Browser

- **From the application menu** – look for “Rclone Browser” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  rclone-browser
  ```

---

## 3. Initial Configuration via Rclone Browser

If you have already configured remotes using `rclone config` in the terminal, they will appear automatically. If not, you can create a new remote directly from the GUI.

1. Open Rclone Browser.
2. Click the **Config** button at the bottom left.
3. A terminal‑style configuration wizard will appear inside the application. Follow the prompts:
   - **Create a new remote?** Type `n` (no) to keep existing remotes, or `y` to create a new one. For a first‑time setup, answer `y`.
   - **Name** – Choose a name for the remote (e.g., `google`).
   - **Type of storage** – Enter the number corresponding to your provider (e.g., `13` for Google Drive).
   - **Client ID / Client Secret** – Leave empty (unless you have a custom OAuth application).
   - **Access scope** – Choose the desired access level (e.g., `1` for full access).
   - **Root folder ID** – Leave blank to sync the whole drive.
   - **Advanced settings?** – Type `n` (no).
   - **Login via browser?** – Type `y` to authenticate. Your default browser will open for login.

After successful authentication, the new remote will appear in the main window.

> **⚠️ Note:** The configuration wizard is the same as running `rclone config` in a terminal. You can also use the terminal to pre‑configure remotes if you prefer.

---

## 4. Using Rclone Browser (Mounting & Syncing)

- **Double‑click** a remote name to open it and browse its contents.
- To **mount** a remote as a local folder, select the remote, then click **Action → Mount**. Choose a mount point (e.g., `~/mydrive`). The remote will be accessible as if it were a local drive.
- To **sync** or **copy** files, you can drag and drop between the local file tree and the remote tree.

> **💡 Tip:** Mounting is the most convenient way to access cloud files directly from any application.

---

## 5. Desktop Integration (System Tray & Autostart)

Rclone Browser can minimise to the system tray and be launched automatically when you log in.

### Close to System Tray

- In the main window, click **Settings** (gear icon) → **Tray** → check **“Close to tray”**.
- To exit completely later, right‑click the tray icon and choose **Quit**.

### Add to System Startup

1. Open **Startup Applications** (or your desktop environment’s autostart settings).
2. Add a new entry with:
   - **Name:** `Rclone Browser`
   - **Command:** `rclone-browser --hidden` (starts minimised to tray)
   - **Comment:** `Rclone GUI`

Alternatively, create a `.desktop` file in `~/.config/autostart/`:

```bash
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/rclone-browser.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Rclone Browser
Exec=rclone-browser --hidden
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF
```

> **💡 Tip:** The `--hidden` flag starts the application without opening the main window (only tray icon).

---

## 6. Updating Rclone Browser

```bash
yay -Syu rclone-browser
```

This will update the package together with other AUR packages.

---

## 7. Uninstalling Rclone Browser

```bash
yay -Rns rclone-browser
```

Remove configuration files (stored in `~/.config/rclone-browser/`):

```bash
rm -rf ~/.config/rclone-browser
```

---

## 8. Troubleshooting

| Problem                                                       | Solution                                                                                                                                              |
| ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `rclone-browser: command not found`                           | The application is not installed. Re‑run `yay -S rclone-browser`.                                                                                     |
| No remotes appear                                             | You have not configured any remotes in `rclone`. Run `rclone config` in a terminal first.                                                             |
| Mount option is greyed out                                    | Ensure you have `fuse2` installed (`sudo pacman -S fuse2`) and your user is in the `fuse` group (`sudo usermod -aG fuse $USER`; log out and back in). |
| Authentication fails (Google Drive)                           | Clear the existing token: `rclone config delete <remote>` and reconfigure. Ensure you have an active internet connection.                             |
| Rclone Browser crashes on startup                             | Launch from a terminal to see error messages. Missing dependencies? Install `sudo pacman -S qt5-base qt5-svg`.                                        |
| System tray icon does not appear on some desktop environments | The tray implementation may require a compatible systray. On GNOME, install `gnome-shell-extension-appindicator`. On KDE, it should work natively.    |
| “Config” button does nothing                                  | The terminal‑based config may be hidden. Run `rclone config` in a real terminal instead.                                                              |

---

Your Rclone Browser GUI is now ready to manage your cloud storage without the command line. Enjoy easy syncs, mounts, and file transfers!
