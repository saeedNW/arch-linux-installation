# qBittorrent – BitTorrent Client

qBittorrent is a free, open‑source BitTorrent client that aims to provide a lightweight, feature‑rich alternative to other popular clients. It includes a built‑in search engine, RSS feed support, IP filtering, and sequential downloading. It is available in the official Arch Linux repositories, so no AUR helper is required.

---

## Table of Contents

- [qBittorrent – BitTorrent Client](#qbittorrent--bittorrent-client)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching qBittorrent](#2-launching-qbittorrent)
  - [3. Headless (Web UI) Installation](#3-headless-web-ui-installation)
  - [4. Updating qBittorrent](#4-updating-qbittorrent)
  - [5. Uninstalling qBittorrent](#5-uninstalling-qbittorrent)
  - [6. Change qBittorrent's Look](#6-change-qbittorrents-look)
    - [Built‑in Style Options](#builtin-style-options)
    - [Custom UI Themes](#custom-ui-themes)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

```bash
sudo pacman -S qbittorrent
```

This installs the **graphical** version of qBittorrent (Qt‑based). For a headless (Web UI) installation, see Section 3.

---

## 2. Launching qBittorrent

- **From the application menu** – look for “qBittorrent” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  qbittorrent
  ```

On first launch, you can accept the default settings. The main window will appear, and you can add torrents via file, magnet link, or URL.

---

## 3. Headless (Web UI) Installation

If you prefer to run qBittorrent without a graphical interface (e.g., on a server), install the **nox** version:

```bash
sudo pacman -S qbittorrent-nox
```

Then start the Web UI service:

```bash
qbittorrent-nox
```

By default, the Web UI will be available at `http://localhost:8080`. The default username is `admin` and the default password is `adminadmin` (change this immediately).

To run it as a systemd service, create a service file or use the provided one:

```bash
sudo systemctl enable qbittorrent-nox@$(whoami).service
sudo systemctl start qbittorrent-nox@$(whoami).service
```

> **💡 Tip:** The Web UI can be accessed remotely once you configure the port and firewall accordingly.

---

## 4. Updating qBittorrent

```bash
sudo pacman -Syu
```

qBittorrent will be updated along with other system packages.

---

## 5. Uninstalling qBittorrent

```bash
sudo pacman -Rns qbittorrent
```

Remove configuration files (stored in `~/.config/qBittorrent/` and `~/.local/share/qBittorrent/`):

```bash
rm -rf ~/.config/qBittorrent
rm -rf ~/.local/share/qBittorrent
```

For the headless version:

```bash
sudo pacman -Rns qbittorrent-nox
rm -rf ~/.config/qBittorrent
```

---

## 6. Change qBittorrent's Look

You can change qBittorrent's appearance either by using the built‑in style options or by applying a custom theme.

### Built‑in Style Options

qBittorrent provides a few interface styles directly, no extra downloads needed. To change the style:

1. Open **Tools → Preferences → Behavior → Interface**.
2. Find the **Style** dropdown menu.
3. Choose an option from the dropdown (e.g., `windowsvista`).
4. **Restart** qBittorrent for the change to take effect.

This method changes the overall look of the application. It may solve text visibility issues, especially after updating to a new version. For example, if qBittorrent switches to a dark mode that you find hard to read, selecting a different style can revert it to a lighter theme.

### Custom UI Themes

For more extensive theming, you can use a custom `.qbtheme` file. These themes can change colors, icons, and other GUI elements. Themes are supported since qBittorrent version 4.2.2.

**Example: Installing the Dracula Theme**

The [Dracula theme](https://draculatheme.com/qbittorrent) is a popular dark theme that provides a consistent look across many applications. To install it:

1. Download the `dracula.qbtheme` file from the [Dracula repository](https://github.com/dracula/qbittorrent/raw/master/dracula.qbtheme).
2. Open **Tools → Preferences → Behavior → Interface**.
3. Check the box **Use custom UI Theme**.
4. Next to **UI Theme file**, click the file icon and select the downloaded `dracula.qbtheme` file.
5. **Restart** qBittorrent to apply the theme.

You can find other custom themes on GitHub or through the [official qBittorrent Wiki](https://github.com/qbittorrent/qBittorrent/wiki/List-of-known-qBittorrent-themes).

> **💡 Tip:** If you want to create your own theme, refer to the [qBittorrent Wiki](https://github.com/qbittorrent/qBittorrent/wiki/Create-custom-themes-for-qBittorrent) for details on the `.qbtheme` structure and the use of `config.json` to customize specific GUI colors.

---

## 7. Troubleshooting

| Problem                                             | Solution                                                                                                                                                                                |
| --------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `qbittorrent: command not found`                    | qBittorrent is not installed. Run `sudo pacman -S qbittorrent`.                                                                                                                         |
| qBittorrent does not start (missing libraries)      | Install dependencies: `sudo pacman -S qt5-base libtorrent-rasterbar`.                                                                                                                   |
| “Unable to find an IP address” in Web UI (headless) | Check your network configuration. In the Web UI, go to **Tools → Options → Connection** and select the correct network interface.                                                       |
| Slow download speeds                                | Enable **Anonymous mode** and **Encryption** in the settings. Also check your torrent’s availability.                                                                                   |
| qBittorrent crashes when adding many torrents       | Reduce the number of simultaneous active downloads in **Tools → Options → Downloads** (set to 5‑10).                                                                                    |
| Web UI inaccessible from another machine            | Ensure the firewall allows port `8080`. For a systemd service, you may need to modify the service file to listen on all interfaces (`--webui-ip=0.0.0.0`).                              |
| No sound on torrent completion (graphical)          | Install `libcanberra` and its sound theme: `sudo pacman -S libcanberra`. Enable sound notifications in qBittorrent settings.                                                            |
| qBittorrent does not follow system theme            | qBittorrent 5.0+ automatically follows your system's light/dark mode. To override, use a custom UI theme or adjust the **Style** dropdown under **Preferences → Behavior → Interface**. |

---

Your qBittorrent client is now ready for fast, efficient torrent downloads on Arch Linux. Enjoy the speed and privacy!
