# Flatpak – Universal Package Manager

Flatpak is a universal packaging system that allows developers to distribute applications for Linux systems. It provides a sandboxed environment for applications, ensuring better security and compatibility across different distributions. It is available in the official Arch Linux `extra` repository, so no AUR helper is required.

> **ℹ️ Note:** Flatpak applications run in isolated containers, which means they have limited access to your system by default. You can manage permissions using `Flatseal` or the command line.

---

## Table of Contents

- [Flatpak – Universal Package Manager](#flatpak--universal-package-manager)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Add Flathub Repository](#2-add-flathub-repository)
  - [3. Verification](#3-verification)
  - [4. Basic Flatpak Commands](#4-basic-flatpak-commands)
  - [5. Searching for Applications](#5-searching-for-applications)
  - [6. Installing an Application](#6-installing-an-application)
  - [7. Running Installed Applications](#7-running-installed-applications)
  - [8. Updating Flatpak \& Applications](#8-updating-flatpak--applications)
  - [9. Managing Permissions (Flatseal)](#9-managing-permissions-flatseal)
  - [10. Uninstalling Flatpak](#10-uninstalling-flatpak)
  - [11. Troubleshooting](#11-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S flatpak
```

This installs the core Flatpak package and its dependencies.

> **💡 Tip:** After installation, you may need to log out and back in for the session to recognise Flatpak applications.

---

## 2. Add Flathub Repository

Flathub is the official repository for Flatpak applications. Add it to your system:

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

> **💡 Tip:** The `--if-not-exists` flag prevents duplicate entries.

---

## 3. Verification

Check that Flatpak is installed correctly and the Flathub remote is available:

```bash
flatpak --version
flatpak remotes
```

Expected output should show `flathub` in the list of remotes.

---

## 4. Basic Flatpak Commands

| Command                            | Purpose                                   |
| ---------------------------------- | ----------------------------------------- |
| `flatpak search <term>`            | Search for applications                   |
| `flatpak install flathub <app-id>` | Install an application                    |
| `flatpak run <app-id>`             | Run an installed application              |
| `flatpak list`                     | List installed applications               |
| `flatpak update`                   | Update all installed Flatpak applications |
| `flatpak uninstall <app-id>`       | Remove an application                     |
| `flatpak uninstall --unused`       | Remove unused runtimes                    |

---

## 5. Searching for Applications

Search for an application by name or description:

```bash
flatpak search firefox
```

The output includes the **Application ID** (e.g., `org.mozilla.firefox`), version, and a brief description.

---

## 6. Installing an Application

Use the Application ID from the search result:

```bash
flatpak install flathub org.mozilla.firefox
```

> **⚠️ Note:** Some Flatpak applications may require additional permissions (e.g., access to files, microphone, camera). You can adjust these later with `Flatseal` (see Section 9).

---

## 7. Running Installed Applications

- **From the terminal**:

  ```bash
  flatpak run org.mozilla.firefox
  ```

- **From the application menu** – most Flatpak applications automatically create a `.desktop` entry and appear in your launcher.

> **💡 Tip:** To run an application with a specific permission override (e.g., allow filesystem access), use the `--filesystem=host` flag:
>
> ```bash
> flatpak run --filesystem=host org.mozilla.firefox
> ```

---

## 8. Updating Flatpak & Applications

Update Flatpak itself and all installed applications:

```bash
flatpak update
```

To update only a specific application:

```bash
flatpak update org.mozilla.firefox
```

> **💡 Tip:** You can schedule automatic updates using a systemd timer or cron job.

---

## 9. Managing Permissions (Flatseal)

**Flatseal** is a graphical tool that allows you to review and modify permissions for Flatpak applications.

Install Flatseal:

```bash
flatpak install flathub com.github.tchx84.Flatseal
```

Launch Flatseal from your application menu or run:

```bash
flatpak run com.github.tchx84.Flatseal
```

From Flatseal, you can grant or revoke permissions such as:

- Filesystem access (e.g., `~/Documents`, `~/Downloads`, whole system)
- Network access
- Audio recording
- Webcam / camera
- Bluetooth
- DBus session bus access

> **⚠️ Warning:** Granting broad permissions (like `--filesystem=host`) reduces the security benefits of sandboxing. Only grant what is necessary.

---

## 10. Uninstalling Flatpak

Remove Flatpak itself:

```bash
sudo pacman -Rns flatpak
```

If you also want to remove all installed Flatpak applications and data:

```bash
rm -rf ~/.local/share/flatpak
sudo rm -rf /var/lib/flatpak
```

---

## 11. Troubleshooting

| Problem                                         | Solution                                                                                                                                                     |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `flatpak: command not found`                    | Flatpak is not installed. Run `sudo pacman -S flatpak`.                                                                                                      |
| `error: No remote refs found for ‘flathub’`     | Add the Flathub repository (see Section 2).                                                                                                                  |
| Application does not appear in application menu | Run `flatpak run <app-id>` once to generate the `.desktop` entry. Log out and back in if it still does not appear.                                           |
| Application cannot access your files            | Grant filesystem permissions using Flatseal, or run with `--filesystem=host`.                                                                                |
| Flatpak applications use a different theme      | Install the Flatpak version of your theme (if available) or use `flatpak override --user --filesystem=~/.themes` and set `GTK_THEME=mytheme`.                |
| “Not enough disk space” when installing         | Flatpak stores applications in `/var/lib/flatpak` (system‑wide) and `~/.local/share/flatpak` (user). Clean up unused runtimes: `flatpak uninstall --unused`. |
| `error: GPG verification failed`                | The Flathub GPG key may be outdated. Update it: `sudo flatpak remote-modify flathub --gpg-import=https://flathub.org/repo/flathub.gpg`.                      |

---

Your Flatpak installation is now ready to run thousands of sandboxed, cross‑distribution applications. Enjoy the security and convenience of universal packaging!
