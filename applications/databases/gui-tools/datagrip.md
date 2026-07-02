# DataGrip – Database IDE Setup Guide

DataGrip is a professional database IDE by JetBrains that provides intelligent SQL coding, database management, and powerful navigation tools. It supports **MySQL, PostgreSQL, Microsoft SQL Server, Oracle, MongoDB, and many other database engines** (any DBMS with a JDBC driver can be connected).

As of October 2025, JetBrains has made DataGrip **free for non-commercial use**, including learning, hobby development, open-source contributions, and content creation. This guide covers installation via multiple methods and activation of the free non-commercial license.

> **📝 Prerequisite:** No Java installation is required – DataGrip bundles its own JetBrains Runtime (JBR 21).

---

## Table of Contents

- [DataGrip – Database IDE Setup Guide](#datagrip--database-ide-setup-guide)
  - [Table of Contents](#table-of-contents)
  - [1. System Requirements](#1-system-requirements)
  - [2. Installation Methods](#2-installation-methods)
    - [Method A: JetBrains Toolbox (Recommended)](#method-a-jetbrains-toolbox-recommended)
    - [Method B: AUR (datagrip-bin)](#method-b-aur-datagrip-bin)
    - [Method C: Manual Tarball Installation](#method-c-manual-tarball-installation)
  - [3. First Launch \& Activation](#3-first-launch--activation)
  - [4. Activating the Non-Commercial Free License](#4-activating-the-non-commercial-free-license)
  - [5. Updating DataGrip](#5-updating-datagrip)
    - [Via Toolbox](#via-toolbox)
    - [Via AUR](#via-aur)
    - [Via Tarball](#via-tarball)
  - [6. Uninstalling DataGrip](#6-uninstalling-datagrip)
    - [Toolbox installation](#toolbox-installation)
    - [AUR installation](#aur-installation)
    - [Manual tarball installation](#manual-tarball-installation)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. System Requirements

| Component               | Minimum          | Recommended                 |
| ----------------------- | ---------------- | --------------------------- |
| **RAM**                 | 2 GB free        | 4 GB total system RAM       |
| **Disk space**          | 3.5 GB           | SSD with at least 5 GB free |
| **Monitor resolution**  | 1024×768         | 1920×1080                   |
| **Kernel**              | Linux kernel 6.x | –                           |
| **Desktop environment** | Gnome or KDE     | –                           |
| **GLIBC**               | 2.28 or later    | –                           |

> **💡 Tip:** DataGrip supports multithreading, so multi-core CPUs improve performance.
>
> **⚠️ Note:** Wayland support is in development. Most users still run DataGrip under X11. You can track progress at [JBR-3206](https://youtrack.jetbrains.com/issue/JBR-3206).

---

## 2. Installation Methods

Choose one of the following methods.

---

### Method A: JetBrains Toolbox (Recommended)

JetBrains Toolbox is the official tool for managing JetBrains products. It handles installation, updates, and rollbacks.

**Step 1 – Install JetBrains Toolbox**

From the AUR:

```bash
yay -S jetbrains-toolbox
```

The AUR package places the Toolbox binary in `/opt/jetbrains-toolbox` and symlinks it to `/usr/bin/jetbrains-toolbox`.

**Step 2 – Launch Toolbox**

```bash
jetbrains-toolbox
```

**Step 3 – Install DataGrip**

1. Click the Toolbox icon in your system tray (or application menu)
2. Click **"Available"** under DataGrip
3. Select the version (latest stable is recommended)
4. Click **Install**

> **💡 Tip:** Logging into your JetBrains Account in Toolbox will automatically activate licenses for any IDE you install.

---

### Method B: AUR (datagrip-bin)

Install pre-built DataGrip package directly from the AUR:

```bash
yay -S datagrip-bin
```

This package installs DataGrip to `/opt/datagrip` and creates a desktop launcher. The launch command is:

```bash
datagrip
```

> **💡 Tip:** The `-bin` suffix indicates a pre‑compiled binary – no compilation is required.

---

### Method C: Manual Tarball Installation

**Step 1 – Download the tarball**

Visit the [official DataGrip download page](https://www.jetbrains.com/datagrip/download/), click the **Linux** tab, and download the `.tar.gz` archive.

**Step 2 – Extract to `/opt`**

```bash
sudo tar -xzf datagrip-*.tar.gz -C /opt/
```

**Step 3 – Create a symbolic link (optional)**

```bash
sudo ln -s /opt/DataGrip-*/bin/datagrip.sh /usr/local/bin/datagrip
```

**Step 4 – Launch DataGrip**

```bash
/opt/DataGrip-*/bin/datagrip.sh
```

> **⚠️ Note:** Manual installations do not include automatic updates – you must repeat these steps for each new version.

---

## 3. First Launch & Activation

When you start DataGrip for the first time, you will see the **Licenses** dialog. You have several options:

| Option                          | Description                                                                      |
| ------------------------------- | -------------------------------------------------------------------------------- |
| **Start trial**                 | Free 30-day trial (commercial evaluation)                                        |
| **Non-commercial use**          | **Recommended** – Free for personal, educational, open-source, or hobby projects |
| **Log in to JetBrains Account** | Activate a purchased or free license using your account                          |
| **Activation code**             | Enter a paid license code                                                        |

> **⚠️ Important:** The non-commercial license is **only available in DataGrip 2025.2.4 or later**. If you don't see the "Non-commercial use" option, update to the latest version.

---

## 4. Activating the Non-Commercial Free License

DataGrip is **free for non-commercial use** for activities such as:

- Learning and self-education
- Open-source development
- Content creation
- Hobby/personal projects
- Any purpose that does not generate commercial benefit

**Activation steps:**

1. Launch DataGrip
2. On the **Licenses** dialog, select **"Non-commercial use"**
3. **Log in** with your JetBrains Account (or create one – you can use Google, GitHub, GitLab, or Bitbucket to sign up)
4. Read and accept the **Toolbox Subscription Agreement for Non-Commercial Use**
5. Click **Start Non-Commercial Use**

Your **free one-year license** is activated immediately. The license automatically renews each year if you have used DataGrip at least once during the last 6 months of the subscription period.

> **📝 Important notes about the non-commercial license:**
>
> - An **activation code cannot be generated** – activation requires an internet connection (after activation, you can use DataGrip offline)
> - The IDE sends **anonymized statistics** about feature usage to JetBrains – there is no opt-out under this license
> - The license covers **one year** and auto‑renews if active use is detected

---

## 5. Updating DataGrip

### Via Toolbox

Toolbox automatically notifies you of updates. Click **Update** next to DataGrip in the Toolbox app.

### Via AUR

```bash
yay -Syu datagrip-bin
```

### Via Tarball

Download the new version, extract it to `/opt`, and optionally update the symlink.

---

## 6. Uninstalling DataGrip

### Toolbox installation

Click the **trash icon** next to DataGrip in the Toolbox app.

### AUR installation

```bash
yay -Rns datagrip-bin
```

### Manual tarball installation

```bash
sudo rm -rf /opt/DataGrip-*
sudo rm -f /usr/local/bin/datagrip   # if symlink was created
```

To remove cached data and configurations:

```bash
rm -rf ~/.local/share/JetBrains/DataGrip*
rm -rf ~/.config/JetBrains/DataGrip*
rm -rf ~/.cache/JetBrains/DataGrip*
```

---

## 7. Troubleshooting

| Problem                                        | Solution                                                                                                                                             |
| ---------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| **"Non-commercial use" option missing**        | Update to DataGrip 2025.2.4 or later.                                                                                                                |
| **`datagrip: command not found`** (AUR)        | Log out and back in, or restart the terminal. Manually start with `/opt/datagrip/bin/datagrip`.                                                      |
| **Login redirect fails**                       | If your browser doesn't open automatically, click the **Troubles** button to generate an **authorization token** manually.                           |
| **"No free ports" error during login**         | DataGrip waits for a response on an available port. Ensure no firewall is blocking the redirect. Use the authorization token method as a workaround. |
| **Wayland issues (black screen / flickering)** | Switch to X11 for the session; Wayland support is under development. Run DataGrip with `GDK_BACKEND=x11 datagrip`.                                   |
| **DataGrip does not start** (manual install)   | Ensure `/opt/DataGrip-*` permissions are correct. Run `chmod +x /opt/DataGrip-*/bin/datagrip.sh`.                                                    |
| **Plugins not found**                          | VCS plugins (Git, SVN, Mercurial) are not bundled. Install them from **Settings → Plugins → Marketplace**.                                           |

Your DataGrip IDE is now ready for database development. Enjoy intelligent SQL editing, schema navigation, and powerful database management – completely free for your non‑commercial work.
