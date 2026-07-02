# Android Platform Tools (ADB & Fastboot)

The **Android SDK Platform Tools** include `adb` (Android Debug Bridge) and `fastboot`. They are essential for communicating with Android devices, flashing firmware, debugging apps, and unlocking bootloaders.

> **ℹ️ Note:** On Arch Linux, the package `android-tools` provides both ADB and Fastboot. It is available in the official `extra` repository – no AUR helper is required.

---

## Table of Contents

- [Android Platform Tools (ADB \& Fastboot)](#android-platform-tools-adb--fastboot)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Setting Up ADB (Android Debug Bridge)](#2-setting-up-adb-android-debug-bridge)
    - [2.1. Enable USB Debugging on Your Device](#21-enable-usb-debugging-on-your-device)
    - [2.2. Authorise the Computer](#22-authorise-the-computer)
    - [2.3. Basic ADB Commands](#23-basic-adb-commands)
  - [3. Using Fastboot](#3-using-fastboot)
    - [3.1. Boot into Fastboot Mode](#31-boot-into-fastboot-mode)
    - [3.2. Common Fastboot Commands](#32-common-fastboot-commands)
  - [4. Udev Rules for Device Access (Optional)](#4-udev-rules-for-device-access-optional)
  - [5. Wireless ADB (Android 11+)](#5-wireless-adb-android-11)
  - [6. Uninstalling](#6-uninstalling)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. Installation

Install the `android-tools` package:

```bash
sudo pacman -S android-tools
```

This installs `adb`, `fastboot`, and other utilities (e.g., `etc1tool`, `ext4_utils`).

> **💡 Tip:** The official `android-sdk-platform-tools` from Google is not packaged separately; `android-tools` is the Arch Linux equivalent.

---

## 2. Setting Up ADB (Android Debug Bridge)

### 2.1. Enable USB Debugging on Your Device

1. On the Android device, go to **Settings → About phone**.
2. Tap **Build number** 7 times to enable **Developer options**.
3. Go back to **Settings → System → Developer options** (or directly **Developer options**).
4. Enable **USB debugging**.

> **⚠️ Note:** On some devices (especially Xiaomi), you also need to enable **USB debugging (Security settings)**.

### 2.2. Authorise the Computer

Connect the device to your computer via USB. Run:

```bash
adb devices
```

On the first connection, a prompt will appear on the Android device: **Allow USB debugging?** – check “Always allow from this computer” and tap **Allow**.

After authorisation, `adb devices` will show:

```plaintext
List of devices attached
XXXXXXXXXX    device
```

### 2.3. Basic ADB Commands

| Command                         | Purpose                                     |
| ------------------------------- | ------------------------------------------- |
| `adb devices`                   | List connected devices (with their status)  |
| `adb shell`                     | Open a Unix shell on the device             |
| `adb install app.apk`           | Install an APK file                         |
| `adb uninstall com.example.app` | Uninstall an application                    |
| `adb logcat`                    | View device logs                            |
| `adb pull /sdcard/file.txt .`   | Copy a file from the device to the computer |
| `adb push file.txt /sdcard/`    | Copy a file from the computer to the device |
| `adb reboot`                    | Reboot the device                           |
| `adb reboot bootloader`         | Reboot into fastboot mode                   |

> **💡 Tip:** Use `adb --help` to see all available options.

---

## 3. Using Fastboot

Fastboot is used to flash partitions, unlock the bootloader, and manage firmware updates when the device is in **fastboot mode**.

### 3.1. Boot into Fastboot Mode

- From a running system: `adb reboot bootloader`
- Manual method: Turn off the device, then press and hold **Volume Down + Power** (varies per device).

Once in fastboot mode, verify the connection:

```bash
fastboot devices
```

Example output:

```plaintext
XXXXXXXXXX    fastboot
```

### 3.2. Common Fastboot Commands

| Command                                | Purpose                                                                  |
| -------------------------------------- | ------------------------------------------------------------------------ |
| `fastboot devices`                     | List devices in fastboot mode                                            |
| `fastboot reboot`                      | Reboot the device normally                                               |
| `fastboot reboot bootloader`           | Reboot back to fastboot (useful after some operations)                   |
| `fastboot flash boot boot.img`         | Flash a boot image                                                       |
| `fastboot flash recovery recovery.img` | Flash a recovery image                                                   |
| `fastboot flash system system.img`     | Flash the system partition                                               |
| `fastboot erase cache`                 | Erase the cache partition                                                |
| `fastboot oem unlock`                  | Unlock the bootloader (requires OEM unlock enabled in Developer options) |
| `fastboot oem lock`                    | Re‑lock the bootloader (⚠️ wipes data)                                   |

> **⚠️ Warning:** Unlocking the bootloader will wipe all user data on the device and may void the warranty. Proceed with caution.

---

## 4. Udev Rules for Device Access (Optional)

By default, running `adb` or `fastboot` without `sudo` works for most users because Arch Linux includes a system‑wide udev rule that covers many Android devices. If you experience permission errors (`adb devices` shows `no permissions`), you can add a custom udev rule.

**Step 1 – Identify the device vendor ID**

Plug in the device and run:

```bash
lsusb
```

Look for your device (e.g., `Google Inc.`). The vendor ID is the 4‑digit hex number (e.g., `18d1` for Google).

**Step 2 – Create a udev rule**

```bash
sudo nano /etc/udev/rules.d/51-android.rules
```

Add the following line (replace `18d1` with your vendor ID):

```plaintext
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="adbusers"
```

**Step 3 – Reload udev rules**

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```

**Step 4 – Add your user to the `adbusers` group (if used)** and restart the ADB server:

```bash
sudo groupadd adbusers
sudo usermod -aG adbusers $USER
adb kill-server
```

Log out and back in for the group change to take effect.

---

## 5. Wireless ADB (Android 11+)

On Android 11 and later, you can connect ADB **without a USB cable** after pairing once.

1. On the device, go to **Developer options** → **Wireless debugging** → enable it.
2. Under **Wireless debugging**, note the **IP address and port** (e.g., `192.168.1.100:43221`).
3. On your computer, pair with the device:

   ```bash
   adb pair IP:PORT
   ```

   Enter the **pairing code** shown on the device.

4. After pairing, connect:

   ```bash
   adb connect IP:PORT
   ```

5. Verify with `adb devices` – the device should appear as `IP:PORT device`.

Wireless ADB remains enabled until the device is rebooted. On Android 10 and earlier, you must connect via USB first and run `adb tcpip 5555`.

---

## 6. Uninstalling

```bash
sudo pacman -Rns android-tools
```

Remove any custom udev rules if you created them:

```bash
sudo rm /etc/udev/rules.d/51-android.rules
```

---

## 7. Troubleshooting

| Problem                              | Solution                                                                                                                                                                                |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `adb: command not found`             | Install `android-tools` (`sudo pacman -S android-tools`).                                                                                                                               |
| `adb devices` shows `no permissions` | Add a udev rule (see Section 4). Also ensure you are not running `adb` as root (`sudo adb` will not see user‑authorised devices).                                                       |
| Device shows as `unauthorized`       | On the Android device, revoke USB debugging authorisations (Developer options → Revoke USB debugging authorisations), reconnect, and accept the new prompt.                             |
| `adb devices` list is empty          | Try a different USB cable or port. Enable **File transfer (MTP)** mode on the device. On some devices, toggle USB debugging off/on.                                                     |
| `fastboot` does not see the device   | Ensure you have booted into fastboot mode. Use a USB 2.0 port. On some devices, you may need to install specific drivers (but Arch Linux generally works).                              |
| Wireless ADB fails after reboot      | You must re‑pair the device after every reboot. On Android 11+, the pairing code is shown under **Wireless debugging**; on older versions, you need a USB cable to restart `adb tcpip`. |
| `adb shell` gives “error: closed”    | The ADB server may have crashed. Run `adb kill-server` then `adb devices` again.                                                                                                        |

---

Your Android Platform Tools are now ready for debugging, flashing, and controlling Android devices from your Arch Linux terminal. Enjoy the power of ADB and Fastboot!
