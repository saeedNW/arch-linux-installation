# DroidCam – Use Your Android Phone as a Webcam

DroidCam is a tool that turns your Android or iOS device into a high-quality wireless webcam for your computer. This guide covers installing the AUR package on Arch Linux, loading the necessary kernel modules, connecting via Wi‑Fi or USB, and troubleshooting common issues.

---

## Table of Contents

- [DroidCam – Use Your Android Phone as a Webcam](#droidcam--use-your-android-phone-as-a-webcam)
  - [Table of Contents](#table-of-contents)
  - [1. What is DroidCam?](#1-what-is-droidcam)
  - [2. Installation](#2-installation)
  - [3. Kernel Modules (Virtual Camera Driver)](#3-kernel-modules-virtual-camera-driver)
    - [3.1. Load the Module Manually](#31-load-the-module-manually)
    - [3.2. Load the Module Automatically at Boot](#32-load-the-module-automatically-at-boot)
  - [4. Connecting Your Phone](#4-connecting-your-phone)
    - [4.1. Android Setup](#41-android-setup)
    - [4.2. Connect Over Wi‑Fi](#42-connect-over-wifi)
    - [4.3. Connect Over USB (Android only)](#43-connect-over-usb-android-only)
  - [5. Launching DroidCam](#5-launching-droidcam)
  - [6. Audio Forwarding (Optional)](#6-audio-forwarding-optional)
  - [7. Updating DroidCam](#7-updating-droidcam)
  - [8. Uninstalling DroidCam](#8-uninstalling-droidcam)
  - [9. Troubleshooting](#9-troubleshooting)

---

## 1. What is DroidCam?

DroidCam is a client‑server application that uses your phone’s camera as a webcam on your Linux PC. It supports both Wi‑Fi and USB connections, and can also forward the phone’s microphone. The video appears as a standard `/dev/video*` device, so it works with any application that supports a webcam (Zoom, OBS, Meet, Discord, etc.).

---

## 2. Installation

The `droidcam` package is available in the Arch User Repository (AUR). Install it with your preferred AUR helper; this guide uses `yay`:

```bash
yay -S droidcam
```

The package pulls in the required dependencies automatically: `bluez-libs`, `gtk2`, `v4l2loopback`, and `ffmpeg` (for video processing).

> **💡 Tip:** The AUR package includes a convenience script that installs the virtual camera driver and sets up a desktop entry. However, you must still load the kernel module yourself or configure it to load at boot.

---

## 3. Kernel Modules (Virtual Camera Driver)

DroidCam creates a virtual webcam device using the **Video4Linux (V4L2)** loopback driver. This module must be loaded before you start the DroidCam client.

### 3.1. Load the Module Manually

Load the required modules:

```bash
sudo modprobe videodev
sudo modprobe v4l2loopback
```

To verify that the modules are loaded:

```bash
lsmod | grep v4l2loopback
```

### 3.2. Load the Module Automatically at Boot

To avoid loading the module manually after every reboot, create a configuration file:

```bash
echo "v4l2loopback" | sudo tee /etc/modules-load.d/v4l2loopback.conf
```

After creating this file, the module will be loaded automatically on every boot.

---

## 4. Connecting Your Phone

### 4.1. Android Setup

- Install the **DroidCam** app from the [Google Play Store](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam) or the [official website](https://www.dev47apps.com/).
- Open the app – the main screen will show your device’s IP address (e.g., `192.168.1.101:4747`).

> **💡 Tip:** For the best experience, ensure your phone and computer are on the same Wi‑Fi network.

### 4.2. Connect Over Wi‑Fi

This is the most common and easiest method.

1. Launch the DroidCam client on your Linux PC (see [Launching DroidCam](#5-launching-droidcam)).
2. In the connection window, enter the **IP address** displayed in the Android app and leave the port as `4747`.
3. Click **Connect**. You should see your phone’s video feed appear.

### 4.3. Connect Over USB (Android only)

If your Wi‑Fi is unreliable, you can use USB tethering.

1. Enable **USB tethering** on your Android device (Settings → Network & internet → Hotspot & tethering).
2. Connect your phone to the PC via USB.
3. On the phone, install and open **DroidCam**. Note the IP address (usually `192.168.42.129` or similar).
4. Launch DroidCam on the PC and enter that IP address (port `4747`).

This method often provides lower latency and a more stable connection.

---

## 5. Launching DroidCam

You can start the client in two ways:

- **From your desktop environment’s application menu** – look for **DroidCam**.
- **From the terminal**:

  ```bash
  droidcam
  ```

A connection window will appear. Enter your phone’s IP address (and port if different) and click **Connect**.

Once connected, you can use your phone as a webcam in any application that supports standard V4L2 devices. The virtual camera appears as `DroidCam` (or `/dev/video0`).

> **💡 Tip:** To close the video feed, press `Ctrl+C` in the terminal where `droidcam` is running, or close the application window.

---

## 6. Audio Forwarding (Optional)

DroidCam can also forward your phone’s microphone to the PC using the Linux ALSA Loopback sound card.

**Install the sound support** (run from the directory where the AUR package placed the scripts):

```bash
sudo /opt/droidcam/install-sound
```

This script loads the ALSA loopback module and creates a virtual microphone device. After installation, you may need to restart PulseAudio or PipeWire:

```bash
pulseaudio -k   # if using PulseAudio
systemctl --user restart pipewire   # if using PipeWire
```

> **⚠️ Note:** Audio forwarding can be quirky and may conflict with other sound devices. If you experience problems, it is often simpler to use a regular external microphone alongside DroidCam for video only.

---

## 7. Updating DroidCam

Update DroidCam through your AUR helper together with other packages:

```bash
yay -Syu
```

---

## 8. Uninstalling DroidCam

```bash
yay -Rns droidcam
```

To remove configuration files (if you also want to delete them):

```bash
rm -rf ~/.droidcam
```

---

## 9. Troubleshooting

| Problem                                               | Solution                                                                                                                                                            |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`v4l2loopback` module not found**                   | Install `v4l2loopback-dkms` and the appropriate kernel headers: `sudo pacman -S v4l2loopback-dkms linux-headers`. Then rebuild the module: `sudo dkms autoinstall`. |
| **Droidcam/v4l2loopback device not found**            | After a kernel update, you must **reboot** for the new kernel modules to load.                                                                                      |
| **No video in other applications** (Zoom, Meet, etc.) | Ensure the DroidCam client is running and connected. Then in the target application, select **DroidCam** as the camera device.                                      |
| **PipeWire does not show the virtual camera**         | Install `pipewire-v4l2` and restart PipeWire: `systemctl --user restart pipewire`. Also check `helvum` to confirm the device appears.                               |
| **Audio does not work**                               | Run `sudo /opt/droidcam/install-sound` again. After that, restart your sound server and select the **Loopback** or **DroidCam** microphone in your application.     |
| **The module does not load at boot**                  | Verify that the file `/etc/modules-load.d/v4l2loopback.conf` exists and contains the line `v4l2loopback`.                                                           |
| **`droidcam` command not found**                      | The AUR package may not have placed the binary in your `PATH`. Locate it with `find /opt -name droidcam` and run it directly (e.g., `/opt/droidcam/droidcam`).      |
| **High CPU usage**                                    | Reduce the video resolution on the DroidCam phone app (e.g., from 720p to 480p). Also lower the quality setting in the PC client.                                   |

---

Your DroidCam setup is now ready. Enjoy using your phone’s camera as a high‑quality, wireless webcam on Arch Linux!
