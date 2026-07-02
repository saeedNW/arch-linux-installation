# LibreOffice – Office Suite (Stable Version)

LibreOffice is a powerful, open‑source office suite that provides word processing, spreadsheets, presentations, vector graphics, and database management. Arch Linux offers two versions: **still** (the older, rock‑solid release) and **fresh** (the latest stable release). This guide covers the **still** version, which is recommended for production environments.

> **ℹ️ Note:** The `libreoffice-still` package is available in the official Arch Linux `extra` repository – no AUR helper is required.

---

## Table of Contents

- [LibreOffice – Office Suite (Stable Version)](#libreoffice--office-suite-stable-version)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching LibreOffice](#2-launching-libreoffice)
  - [3. Language Packs](#3-language-packs)
  - [4. Spell Checking Dictionaries](#4-spell-checking-dictionaries)
  - [5. Updating LibreOffice](#5-updating-libreoffice)
  - [6. Uninstalling LibreOffice](#6-uninstalling-libreoffice)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S libreoffice-still
```

This installs the entire suite including:

- Writer (word processor)
- Calc (spreadsheets)
- Impress (presentations)
- Draw (vector graphics)
- Base (database)
- Math (formula editor)

> **💡 Tip:** If you prefer the **latest features** (but potentially less tested), you can install `libreoffice-fresh` instead.

---

## 2. Launching LibreOffice

- **From the application menu** – look for the LibreOffice components (e.g., “LibreOffice Writer”, “LibreOffice Calc”).
- **From the terminal** – run the specific component:

| Component               | Command                 |
| ----------------------- | ----------------------- |
| Writer (word processor) | `libreoffice --writer`  |
| Calc (spreadsheet)      | `libreoffice --calc`    |
| Impress (presentations) | `libreoffice --impress` |
| Draw (vector graphics)  | `libreoffice --draw`    |
| Base (database)         | `libreoffice --base`    |
| Math (formula editor)   | `libreoffice --math`    |

You can also open a file directly:

```bash
libreoffice /path/to/document.odt
```

---

## 3. Language Packs

To use LibreOffice in a language other than English, install the corresponding language pack. All language packs are named `libreoffice-still-<lang>`.

For example, to install German:

```bash
sudo pacman -S libreoffice-still-de
```

List all available language packs:

```bash
pacman -Ss libreoffice-still- | grep -v "libreoffice-still$"
```

> **💡 Tip:** The language pack also installs the **user interface** translation and help files in that language.

---

## 4. Spell Checking Dictionaries

Spell checking requires separate dictionary packages. Install `hunspell` dictionaries for your language.

For example, to install English (US) and German dictionaries:

```bash
sudo pacman -S hunspell-en_US hunspell-de
```

For a complete list of available dictionaries:

```bash
pacman -Ss hunspell-
```

> **⚠️ Note:** Some language packs include a basic dictionary, but installing the dedicated `hunspell-<lang>` package ensures full spell‑check coverage.

---

## 5. Updating LibreOffice

```bash
sudo pacman -Syu
```

LibreOffice will be updated together with your other system packages.

---

## 6. Uninstalling LibreOffice

```bash
sudo pacman -Rns libreoffice-still
```

Optionally, remove language packs and dictionaries that you installed separately.

Remove user configuration files (stored in `~/.config/libreoffice/`):

```bash
rm -rf ~/.config/libreoffice
```

---

## 7. Troubleshooting

| Problem                                                           | Solution                                                                                                                                                        |
| ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `libreoffice: command not found`                                  | LibreOffice is not installed. Run `sudo pacman -S libreoffice-still`.                                                                                           |
| The interface is in English even after installing a language pack | Open **Tools → Options → Language Settings → Languages** and set the **User interface** to your preferred language. Also ensure the language pack is installed. |
| Spell checking does not work                                      | Install the appropriate `hunspell-<lang>` dictionary and select it in **Tools → Options → Language Settings → Writing Aids**.                                   |
| LibreOffice does not start (crashes)                              | Launch from a terminal to see error messages. Missing dependencies: `sudo pacman -S gtk3`.                                                                      |
| JDBC / database drivers missing for Base                          | Install `java-runtime` and `jre-openjdk`. For specific database drivers, install `libreoffice-still-sdk` (development kit).                                     |
| Writer uses a weird default font                                  | Go to **Tools → Options → LibreOffice Writer → Basic Fonts (Western)** and change to a standard font like Liberation Serif/Sans.                                |

---

Your LibreOffice installation is now ready for professional document creation. Enjoy the freedom of a full‑featured office suite on Arch Linux!
