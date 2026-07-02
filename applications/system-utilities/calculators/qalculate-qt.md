# Qalculate! – Powerful Desktop Calculator

Qalculate! is a multi‑purpose desktop calculator that handles everything from basic arithmetic to complex symbolic math, unit conversions, currency exchange rates, and plotting. It is available in the official Arch Linux `extra` repository, so no AUR helper is required.

> **ℹ️ Note:** Qalculate! offers three interfaces: a modern Qt GUI (`qalculate-qt`), a traditional GTK GUI (`qalculate-gtk`), and a powerful command‑line interface (`qalc`). All share the same calculation engine.

---

## Table of Contents

- [Qalculate! – Powerful Desktop Calculator](#qalculate--powerful-desktop-calculator)
	- [Table of Contents](#table-of-contents)
	- [1. Installation](#1-installation)
	- [2. Launching Qalculate](#2-launching-qalculate)
	- [3. Basic Usage](#3-basic-usage)
		- [Graphical Interface (Qt/GTK)](#graphical-interface-qtgtk)
		- [Command‑Line Interface (qalc)](#commandline-interface-qalc)
	- [4. Advanced Features \& Examples](#4-advanced-features--examples)
	- [5. Updating Qalculate](#5-updating-qalculate)
	- [6. Uninstalling Qalculate](#6-uninstalling-qalculate)
	- [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

Install the component(s) you need:

```bash
# Qt frontend (recommended for most users)
sudo pacman -S qalculate-qt

# GTK frontend (alternative)
sudo pacman -S qalculate-gtk

# Command‑line interface only (included in the library)
sudo pacman -S libqalculate
```

> **💡 Tip:** `libqalculate` provides the calculation engine and the CLI tool `qalc`. The GUI packages depend on it and will be pulled in automatically.

---

## 2. Launching Qalculate

| Interface   | Terminal command |
| ----------- | ---------------- |
| **Qt GUI**  | `qalculate-qt`   |
| **GTK GUI** | `qalculate-gtk`  |
| **CLI**     | `qalc`           |

You can also launch from your application menu: look for **“Qalculate! Qt”** or **“Qalculate! GTK”**.

---

## 3. Basic Usage

### Graphical Interface (Qt/GTK)

1. Type an expression in the main input field.
2. Press **Enter** or click the **=** button.
3. The result appears instantly, with a history of previous calculations.

You can also:

- Use the built‑in menus to insert functions, constants, or units.
- Customise decimal precision, angle mode (degrees/radians), and output formats from **Preferences**.

### Command‑Line Interface (qalc)

Run an interactive session:

```bash
qalc
```

Or perform a one‑shot calculation:

```bash
qalc "5 + 5"
qalc "sin(45°)"
```

> **💡 Tip:** Press `Ctrl+C` to exit the interactive mode.

---

## 4. Advanced Features & Examples

Qalculate! supports a very natural, human‑readable syntax. All examples work in both GUI and CLI.

| Category                                    | Example input          | Result                          |
| ------------------------------------------- | ---------------------- | ------------------------------- |
| **Basic arithmetic**                        | `(32 + 5) * 7`         | `259`                           |
| **Percentages**                             | `50 + 25%`             | `62.5`                          |
| **Currency conversion** (requires internet) | `100 USD to EUR`       | `x EUR` (live rate)             |
| **Unit conversion**                         | `5 km to mi`           | `3.10686 mi`                    |
| **Scientific functions**                    | `sin(pi/2)`            | `1`                             |
| **Integrals**                               | `integrate(1/x)`       | `ln(x)`                         |
| **Derivatives**                             | `derivative(ln(x), x)` | `1/x`                           |
| **Solve equations**                         | `solve(x^2 = 25, x)`   | `x = -5 ∨ x = 5`                |
| **Base conversion**                         | `toHex(255)`           | `0xFF`                          |
| **Date/time operations**                    | `now + 3 weeks`        | `2026-06-26T12:00:00` (example) |

> **⚠️ Note:** Currency conversion requires an active internet connection. Qalculate! fetches live exchange rates from online sources.

---

## 5. Updating Qalculate

```bash
sudo pacman -Syu
```

All Qalculate! components are updated together with your system.

---

## 6. Uninstalling Qalculate

```bash
sudo pacman -Rns qalculate-qt qalculate-gtk libqalculate
```

Remove leftover configuration files (optional):

```bash
rm -rf ~/.config/qalculate-qt
rm -rf ~/.config/qalculate-gtk
```

---

## 7. Troubleshooting

| Problem                                      | Solution                                                                                                                                  |
| -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| **GUI does not start**                       | Install a sound theme (required by Qt): `sudo pacman -S sound-theme-freedesktop`.                                                         |
| **`qalc: command not found`**                | You installed only the GUI package without `libqalculate`. Run `sudo pacman -S libqalculate`.                                             |
| **Currency conversion fails**                | Ensure you have an internet connection. Qalculate! also needs to download exchange rates – wait a few seconds or restart the application. |
| **The result looks wrong (syntax error)**    | Update the built‑in data cache: `pkgfile --update`, then restart Qalculate!.                                                              |
| **CLI shows strange symbols**                | Your terminal font may lack Unicode support. Install a font like `noto-fonts-emoji` and set your terminal to use it.                      |
| **Graphical calculator window is too small** | Resize the window normally. You can also adjust the default size in **Preferences → Display**.                                            |
| **Cannot type certain symbols (e.g., °)**    | Use the character picker from the GUI menu, or type `deg` for degrees (e.g., `sin(45 deg)`).                                              |

---

Your Qalculate! installation is now ready to tackle everything from simple sums to symbolic calculus. Enjoy the most versatile calculator on the Linux desktop!
