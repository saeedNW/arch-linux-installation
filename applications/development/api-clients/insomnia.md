# Insomnia API Client Setup Guide

Insomnia is a powerful, open‑source API client designed for testing, debugging, and designing REST, GraphQL, and gRPC APIs. It provides a clean, intuitive interface for making requests, organising workflows, and managing environment variables.

> **ℹ️ Note:** Insomnia is not available in the official Arch Linux repositories. It is most easily installed from the AUR (Arch User Repository). This guide uses `yay` as the AUR helper, following the established style of your documentation.

---

## Table of Contents

- [Insomnia API Client Setup Guide](#insomnia-api-client-setup-guide)
  - [Table of Contents](#table-of-contents)
  - [1. Install Insomnia](#1-install-insomnia)
  - [2. Verify Installation](#2-verify-installation)
  - [3. Launching Insomnia](#3-launching-insomnia)
  - [4. Updating Insomnia](#4-updating-insomnia)
  - [5. Uninstalling Insomnia](#5-uninstalling-insomnia)
  - [6. Troubleshooting](#6-troubleshooting)

---

## 1. Install Insomnia

The main AUR package for Insomnia is `insomnia-bin` [4†L2-L5]. To install it, run:

```bash
yay -S insomnia-bin
```

> **💡 Tip:** The `-bin` suffix indicates a pre‑built binary package, so no compilation is required, and installation will be fast.
>
> **Alternate package**: There is also an `insomnia-designer-bin` package that focuses specifically on OpenAPI design, but the standard `insomnia-bin` covers all features needed for general API development [7†L2-L6].

---

## 2. Verify Installation

Check that Insomnia is available on your system:

```bash
insomnia --version
```

The command should output the version number (for example, `12.1.0`).

---

## 3. Launching Insomnia

You can start Insomnia in several ways:

- **From the application menu** – Look for “Insomnia” in your desktop environment’s application launcher.
- **From the terminal** – Simply run:

  ```bash
  insomnia
  ```

> **💡 Tip:** If the `insomnia` command is not found after installation, close and reopen your terminal, or log out and back in to refresh your environment.

---

## 4. Updating Insomnia

To update Insomnia to the latest version, run the standard AUR update command:

```bash
yay -Syu insomnia-bin
```

This will update Insomnia together with any other outdated AUR packages.

---

## 5. Uninstalling Insomnia

If you need to remove Insomnia completely, use:

```bash
yay -Rns insomnia-bin
```

The `-ns` flags remove the package along with its configuration files and any unneeded dependencies.

---

## 6. Troubleshooting

| Problem                                    | Solution                                                                                                                           |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- |
| `insomnia: command not found`              | Re‑open your terminal or log out and back in. Verify that the package installed correctly by running `yay -Qi insomnia-bin`.       |
| Insomnia fails to start (blank window)     | Launch from a terminal to see any error messages. Install missing dependencies: `sudo pacman -S gtk3 libxss nss` [4†L14-L24].      |
| AUR installation fails                     | Make sure `base-devel` and `git` are installed (`sudo pacman -S --needed base-devel git`), then retry the installation [7†L9-L11]. |
| “No license field” error on plugin install | This is a known harmless issue with some plugin bundles and does not affect core functionality [1†L20-L28].                        |
| Updates are not available                  | Check the [AUR page](https://aur.archlinux.org/packages/insomnia-bin) for the latest version and any user notes.                   |
| Application does not fit the desktop theme | Insomnia uses its own embedded theme. You can adjust appearance settings inside the application preferences.                       |

---

Your Insomnia API client is now ready for testing and debugging REST, GraphQL, and gRPC APIs. Enjoy!
