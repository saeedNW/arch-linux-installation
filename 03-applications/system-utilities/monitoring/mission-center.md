# Mission Center – System Monitor

Mission Center is a modern, user‑friendly system monitoring application inspired by the Windows Task Manager. It provides real‑time graphs and statistics for CPU, memory, disk, network, and GPU usage, all in a clean GTK4 interface.

> **ℹ️ Note:** Mission Center is available in the official Arch Linux `extra` repository, so no AUR helper is required.

---

## Table of Contents

- [Mission Center – System Monitor](#mission-center--system-monitor)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching Mission Center](#2-launching-mission-center)
  - [3. Basic Usage](#3-basic-usage)
  - [4. Updating Mission Center](#4-updating-mission-center)
  - [5. Uninstalling Mission Center](#5-uninstalling-mission-center)
  - [6. Troubleshooting](#6-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S mission-center
```

This installs the latest stable version from the `extra` repository. The package includes all necessary dependencies (GTK4, libadwaita, etc.).

---

## 2. Launching Mission Center

- **From the application menu** – look for “Mission Center” in your desktop environment’s launcher (it works best on GNOME, but runs on any desktop).
- **From the terminal** – run:

  ```bash
  mission-center
  ```

> **💡 Tip:** You can pin it to your dock or panel for quick access.

---

## 3. Basic Usage

When you open Mission Center, you will see several tabs:

| Tab         | Information Displayed                                                |
| ----------- | -------------------------------------------------------------------- |
| **CPU**     | Per‑core usage, frequency, load average, process list sorted by CPU. |
| **Memory**  | RAM and swap usage, memory‑hungry processes.                         |
| **Disk**    | Disk read/write speeds, partition usage, I/O activity.               |
| **Network** | Real‑time upload/download speeds, interface details.                 |
| **GPU**     | GPU usage, memory usage, temperature (if supported).                 |

**Interactive features:**

- Click on any process to see more details or end it (similar to system monitor).
- Right‑click on a graph to reset the view or change the time scale.
- Use the search bar to filter processes.

> **💡 Tip:** Mission Center uses the same data sources as GNOME System Monitor, but presents it in a more modern, visually appealing way.

---

## 4. Updating Mission Center

```bash
sudo pacman -Syu
```

Mission Center will be updated along with other system packages.

---

## 5. Uninstalling Mission Center

```bash
sudo pacman -Rns mission-center
```

Remove configuration files (stored in `~/.config/mission-center/` and `~/.cache/mission-center/`):

```bash
rm -rf ~/.config/mission-center
rm -rf ~/.cache/mission-center
```

---

## 6. Troubleshooting

| Problem                                           | Solution                                                                                                                                                                         |
| ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `mission-center: command not found`               | The package is not installed. Run `sudo pacman -S mission-center`.                                                                                                               |
| Mission Center does not start (missing libraries) | Install missing dependencies: `sudo pacman -S gtk4 libadwaita`.                                                                                                                  |
| GPU tab shows no data                             | Your GPU may not have a supported monitoring interface. Ensure `nvidia-smi` (NVIDIA) or `radeontop` (AMD) works separately. Install `libdrm` and `glmark2` for better detection. |
| High CPU usage from Mission Center itself         | This is normal for real‑time monitoring. You can reduce the update interval in **Settings → Refresh rate**.                                                                      |
| No network traffic displayed                      | Ensure you have permission to read network statistics. Install `libgudev` and `gobject-introspection`.                                                                           |
| Interface looks different than screenshots        | The application follows your system’s light/dark theme. You can override it by setting `GTK_THEME=Adwaita:dark mission-center`.                                                  |
| Crashes when ending a process                     | This may be a permissions issue. Try running with `sudo mission-center` (not recommended for regular use). Instead, use the command line `kill -9 <PID>`.                        |

---

Your Mission Center installation is now ready to monitor every aspect of your system with a clean, intuitive interface – a worthy successor to traditional system monitors.
