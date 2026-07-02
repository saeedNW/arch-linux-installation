# scrcpy – Android Screen Mirroring

scrcpy (pronounced "**scr**een **c**o**py**") is a free and open‑source application that mirrors and controls Android devices via USB (or wirelessly) from a Linux, Windows, or macOS computer. It does not require root access, no app must be installed on the device, and it leaves nothing behind when you disconnect. It is available in the official Arch Linux repositories, so no AUR helper is required.

---

## Table of Contents

- [scrcpy – Android Screen Mirroring](#scrcpy--android-screen-mirroring)
  - [Table of Contents](#table-of-contents)
  - [1. Features at a Glance](#1-features-at-a-glance)
  - [2. Installation](#2-installation)
  - [3. Prerequisites on the Android Device](#3-prerequisites-on-the-android-device)
  - [4. USB Connection (Wired)](#4-usb-connection-wired)
  - [5. Wireless Connection (ADB over TCP/IP)](#5-wireless-connection-adb-over-tcpip)
    - [Android 11 and later](#android-11-and-later)
    - [Android 10 and earlier](#android-10-and-earlier)
  - [6. Common Command‑Line Options](#6-common-commandline-options)
  - [7. Key Shortcuts (Default `MOD` = `LCtrl`+`LAlt`)](#7-key-shortcuts-default-mod--lctrllalt)
  - [8. Troubleshooting](#8-troubleshooting)
  - [9. Uninstalling scrcpy](#9-uninstalling-scrcpy)

---

## 1. Features at a Glance

| Feature              | Description                                        |
| -------------------- | -------------------------------------------------- |
| **Lightweight**      | Native, displays only the device screen.           |
| **High performance** | 30~120 fps, depending on the device.               |
| **Good quality**     | 1920 × 1080 or above.                              |
| **Low latency**      | Typically 35~70 ms.                                |
| **Quick startup**    | First image appears in ≈1 second.                  |
| **Non‑intrusive**    | No permanent installation on the device.           |
| **Audio forwarding** | Works on Android 11 and later (no extra setup).    |
| **Recording**        | Save the mirrored screen to an MP4/MKV file.       |
| **Copy‑paste**       | Synchronised clipboard in both directions.         |
| **Camera mirroring** | Use your Android camera as a webcam (Android 12+). |
| **HID simulation**   | Emulate a physical keyboard, mouse, or gamepad.    |

For a full list of features, see the [official README](https://github.com/Genymobile/scrcpy).

---

## 2. Installation

scrcpy is available in the official Arch Linux repositories. Install it along with `android-tools` (which provides the `adb` binary needed for communication):

```bash
sudo pacman -S scrcpy android-tools
```

> **💡 Tip:** The `android-tools` package is a hard dependency. If you later remove it, scrcpy will not be able to connect to your device.

**Alternative AUR packages** (if you need the very latest Git version):

```bash
yay -S scrcpy-git android-tools
```

---

## 3. Prerequisites on the Android Device

1. **Android version**: API 21 (Android 5.0) or higher. Audio forwarding requires Android 11 or later.
2. **Enable Developer options**: Go to **Settings → About phone** and tap **Build number** seven times.
3. **Enable USB debugging**: In **Developer options**, turn on **USB debugging**.
4. (For some devices, especially Xiaomi) Enable **USB debugging (Security settings)** as well.

Once these are set, connect your device to the computer with a USB cable.

---

## 4. USB Connection (Wired)

1. **Verify the device is detected by ADB**:

   ```bash
   adb devices
   ```

   If this is the first connection, a prompt will appear on the Android device asking you to authorise the computer’s RSA key – accept it.

2. **Start scrcpy**:

   ```bash
   scrcpy
   ```

That’s it. The device screen will appear in its own window, and you can control it with your mouse and keyboard.

> **💡 Tip:** To stop scrcpy, close the window or press `Ctrl`+`C` in the terminal.

---

## 5. Wireless Connection (ADB over TCP/IP)

### Android 11 and later

You can connect wirelessly **without ever plugging in a USB cable** on Android 11 and newer. First, enable **Wireless debugging** in the Android **Developer options**. Then obtain the **pairing code** and **IP address + port** shown on the device.

On your computer, run:

```bash
adb pair IP:PORT   # Enter the pairing code when prompted
adb connect IP:PORT
scrcpy
```

> **ℹ️ Note:** The port shown for wireless debugging is usually something like `43221`. After pairing, you will need to run `adb connect` with that same IP and port.

### Android 10 and earlier

1. Connect the device via USB first.
2. Enable ADB over TCP/IP:

   ```bash
   adb tcpip 5555
   ```

3. Disconnect the USB cable.
4. Find your device’s IP address (Settings → About phone → Status).
5. Connect over Wi‑Fi:

   ```bash
   adb connect ANDROID_IP:5555
   scrcpy
   ```

> **⚠️ Note:** The ADB TCP/IP mode resets each time the device is rebooted. You will need to repeat the process after a restart.

---

## 6. Common Command‑Line Options

scrcpy accepts many command‑line flags. Here are the most useful ones:

| Option / Flag                | Effect                                                                                          |
| ---------------------------- | ----------------------------------------------------------------------------------------------- |
| `--no-audio`                 | Disable audio forwarding (useful if you only need video).                                       |
| `--record=file.mkv`          | Record the session to an MKV file (can be combined with `--no-display` for headless recording). |
| `--bit-rate 8M`              | Set a custom video bit rate (default is 8 Mbps).                                                |
| `--max-size 1024`            | Limit the video width/height (preserves aspect ratio).                                          |
| `--lock-video-orientation 0` | Lock orientation to the current one (e.g., 0 for natural orientation).                          |
| `--window-title "My Device"` | Give the mirror window a custom title.                                                          |
| `--always-on-top`            | Keep the scrcpy window on top of others.                                                        |
| `-s SERIAL`                  | Use a specific device when multiple are connected (`adb devices` lists the serial numbers).     |

Combine them as needed:

```bash
scrcpy --bit-rate 4M --max-size 1024 --no-audio --record=clip.mkv
```

For the complete list, run `scrcpy --help`.

---

## 7. Key Shortcuts (Default `MOD` = `LCtrl`+`LAlt`)

By default, scrcpy uses **`LCtrl`+`LAlt`** as the modifier key (`MOD`). The following shortcuts work while the scrcpy window is active.

| Action                                        | Shortcut                           |
| --------------------------------------------- | ---------------------------------- |
| Switch full‑screen mode                       | `MOD`+`f`                          |
| Rotate the device screen (landscape/portrait) | `MOD`+`r`                          |
| Resize window to 1:1 (pixel‑perfect)          | `MOD`+`g`                          |
| Turn device screen off (mirroring continues)  | `MOD`+`o`                          |
| Turn device screen on again                   | `MOD`+`Shift`+`o` (or right‑click) |
| Expand notification panel                     | `MOD`+`n`                          |
| Collapse notification panel                   | `MOD`+`Shift`+`n`                  |
| Copy from device to computer clipboard        | `MOD`+`c`                          |
| Paste computer clipboard to device            | `MOD`+`v` (or `Ctrl`+`v`)          |
| Inject computer clipboard text as key events  | `MOD`+`Shift`+`v`                  |
| Open app list (recent apps)                   | `MOD`+`s`                          |
| Press **HOME**                                | `MOD`+`h`                          |
| Press **BACK**                                | `MOD`+`b`                          |
| Press **APP_SWITCH**                          | `MOD`+`s`                          |
| Press **MENU**                                | `MOD`+`m`                          |
| Press **VOLUME_UP**                           | `MOD`+`Up`                         |
| Press **VOLUME_DOWN**                         | `MOD`+`Down`                       |
| Press **POWER**                               | `MOD`+`p`                          |
| Turn device screen off (keeps mirroring)      | `MOD`+`o`                          |
| Turn device screen on                         | `MOD`+`Shift`+`o`                  |

> **💡 Tip:** You can change the modifier key with the `--shortcut-mod` option. For example, to use only the left `Super` (Windows) key:
> `scrcpy --shortcut-mod=lsuper`.

For devices where `Ctrl`+`v` behaves unexpectedly, use `MOD`+`v` to paste the computer clipboard text as a sequence of key events. Physical keyboard simulation (HID) can be enabled with `--keyboard=uhid` and `--mouse=uhid`.

---

## 8. Troubleshooting

| Problem                                            | Solution                                                                                                                                                   |
| -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`adb: command not found`**                       | Install `android-tools`: `sudo pacman -S android-tools`.                                                                                                   |
| **`adb devices` shows “unauthorized”**             | On the Android device, look for the RSA authorisation prompt and accept it.                                                                                |
| **`adb devices` list is empty**                    | Check that USB debugging is enabled. Try a different USB cable or port. On some devices, change the USB connection mode to “File transfer (MTP)”.          |
| **“More than one device/emulator” error**          | Run `adb devices` to see all connected devices. Then specify the one to use: `scrcpy -s SERIAL` (the serial number shown by `adb devices`).                |
| **Black screen / window does not appear**          | Some apps (e.g., banking apps) deliberately prevent screen capture. This is normal and cannot be bypassed.                                                 |
| **Audio not forwarded**                            | Audio forwarding requires Android 11 or later. On older Android versions, only video is mirrored.                                                          |
| **High latency / choppy video**                    | Lower the bit rate (`--bit-rate 2M`) or reduce the resolution (`--max-size 1024`). Make sure you are using a 5 GHz Wi‑Fi network for wireless connections. |
| **Wireless connection fails after USB is removed** | Your device may automatically disable USB debugging when disconnected. Re‑enable ADB over TCP/IP every time you reboot the device.                         |
| **`ERROR: Could not find any ADB device`**         | Run `adb devices` first. If the list is empty, the USB connection is not working – check the cable and USB debugging settings.                             |

---

## 9. Uninstalling scrcpy

```bash
sudo pacman -Rns scrcpy android-tools
```

Remove any remaining configuration (scrcpy stores very little user data, typically only small state files in `~/.local/share/scrcpy/`):

```bash
rm -rf ~/.local/share/scrcpy
```

---

Your scrcpy setup is now ready to mirror and control your Android device from your Arch Linux desktop. Enjoy the speed, low latency, and freedom of this lightweight tool!
