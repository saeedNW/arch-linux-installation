# RedisInsight – GUI for Redis

RedisInsight is a graphical user interface (GUI) for managing Redis databases. It allows you to visualise data, monitor performance, and run commands without the command line. This guide installs the desktop version from the AUR.

> **ℹ️ Note:** RedisInsight is not available in the official Arch Linux repositories. The AUR package `redisinsight-bin` provides a pre‑built binary.

---

## Table of Contents

- [RedisInsight – GUI for Redis](#redisinsight--gui-for-redis)
  - [Table of Contents](#table-of-contents)
  - [1. Installation](#1-installation)
  - [2. Launching RedisInsight](#2-launching-redisinsight)
  - [3. Connecting to Redis](#3-connecting-to-redis)
  - [4. Updating RedisInsight](#4-updating-redisinsight)
  - [5. Uninstalling](#5-uninstalling)
  - [6. Troubleshooting](#6-troubleshooting)

---

## 1. Installation

Install `redisinsight-bin` using your AUR helper. This guide uses `yay`:

```bash
yay -S redisinsight-bin
```

> **💡 Tip:** The `-bin` suffix indicates a pre‑compiled binary – no compilation is required.

---

## 2. Launching RedisInsight

You can start RedisInsight in several ways:

- **From the application menu** – look for “RedisInsight” in your desktop environment’s launcher.
- **From the terminal** – run:

  ```bash
  redisinsight
  ```

> **💡 Tip:** If the `redisinsight` command is not found, close and reopen your terminal, or log out and back in.

---

## 3. Connecting to Redis

When RedisInsight starts, you will be prompted to add a Redis database.

- **Local Redis (no password):** host `localhost`, port `6379`
- **Docker Redis (with password):** host `localhost`, port `6379`, password as set (e.g., `root` from the Docker guide)

RedisInsight will discover databases automatically on the local network in some cases.

---

## 4. Updating RedisInsight

To update to the latest version:

```bash
yay -Syu redisinsight-bin
```

---

## 5. Uninstalling

Remove the package and its configuration:

```bash
yay -Rns redisinsight-bin
```

---

## 6. Troubleshooting

| Problem                                       | Solution                                                                                                                                                        |
| --------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `redisinsight: command not found`             | Re‑open terminal or log out and back in. Check if the package installed correctly with `yay -Qi redisinsight-bin`.                                              |
| The application does not start (blank window) | Launch from a terminal to see error messages. Install missing dependencies: `sudo pacman -S gtk3 libxss nss`.                                                   |
| Cannot connect to Redis                       | Ensure Redis is running (see [Redis guide](../nosql/redis.md)). Check the host, port, and password.                                                             |
| RedisInsight shows “Connection refused”       | The Redis server is not listening on the expected port. Verify with `redis-cli ping` (if native) or `docker exec -it redis redis-cli -a root ping` (if Docker). |
| AUR installation fails                        | Make sure `base-devel` and `git` are installed: `sudo pacman -S --needed base-devel git`.                                                                       |

---

Your RedisInsight GUI is now ready to manage your Redis databases visually.
