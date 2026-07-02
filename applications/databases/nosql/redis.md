# Redis Installation & Setup Guide

Redis is an open‑source, in‑memory data structure store used as a database, cache, and message broker. This guide covers two installation methods: **native (pacman)** and **Docker**.

> **ℹ️ Note:** Both methods are valid – choose the one that fits your workflow. The native method integrates with systemd; the Docker method keeps Redis isolated.

---

## Table of Contents

- [Redis Installation \& Setup Guide](#redis-installation--setup-guide)
  - [Table of Contents](#table-of-contents)
  - [1. Installation Methods](#1-installation-methods)
    - [Option 1: Install via Pacman (Native)](#option-1-install-via-pacman-native)
      - [Start \& Enable the Service](#start--enable-the-service)
      - [Verify Status](#verify-status)
    - [Option 2: Run via Docker](#option-2-run-via-docker)
  - [2. Connecting to Redis](#2-connecting-to-redis)
  - [3. Basic Redis Commands](#3-basic-redis-commands)
  - [4. Configuration](#4-configuration)
    - [Native Installation](#native-installation)
    - [Docker Installation](#docker-installation)
  - [5. Uninstalling](#5-uninstalling)
    - [Native](#native)
    - [Docker](#docker)
  - [6. Troubleshooting](#6-troubleshooting)

---

## 1. Installation Methods

### Option 1: Install via Pacman (Native)

Installs Redis as a system service.

```bash
sudo pacman -S redis
```

#### Start & Enable the Service

```bash
sudo systemctl start redis
sudo systemctl enable redis   # auto‑start on boot
```

#### Verify Status

```bash
sudo systemctl status redis
```

### Option 2: Run via Docker

Runs Redis in an isolated container with persistent storage.

```bash
docker run -d \
  --name redis \
  -p 6379:6379 \
  -v redis-data:/data \
  redis \
  redis-server --save 60 1 --loglevel warning --appendonly yes --requirepass root
```

**Explanation of options:**

| Option / Flag         | Purpose                                                |
| --------------------- | ------------------------------------------------------ |
| `-d`                  | Detached mode (runs in background).                    |
| `--name redis`        | Assigns a name to the container.                       |
| `-p 6379:6379`        | Maps the default Redis port to the host.               |
| `-v redis-data:/data` | Creates a Docker volume for persistent data.           |
| `--save 60 1`         | Snapshot to disk after at least 1 write in 60 seconds. |
| `--appendonly yes`    | Enables append‑only file persistence (safer).          |
| `--requirepass root`  | Sets the password to `root` (change in production!).   |

> **⚠️ Security note:** The password `root` is for demonstration. Use a strong password in production.

---

## 2. Connecting to Redis

| Method                                                 | Command                                   |
| ------------------------------------------------------ | ----------------------------------------- |
| **Native (pacman)**                                    | `redis-cli` (no password by default)      |
| **Native with password** (if set in `/etc/redis.conf`) | `redis-cli -a yourpassword`               |
| **Docker (with password)**                             | `docker exec -it redis redis-cli -a root` |

---

## 3. Basic Redis Commands

Once connected, try these:

```bash
SET mykey "Hello Redis"
GET mykey
EXPIRE mykey 10
TTL mykey
```

---

## 4. Configuration

### Native Installation

The configuration file is located at `/etc/redis.conf`. After editing, restart Redis:

```bash
sudo systemctl restart redis
```

Common settings to change:

- `requirepass` – set a password
- `bind` – restrict to certain network interfaces
- `maxmemory` – memory limit

### Docker Installation

To change configuration, you can either:

- Mount a custom `redis.conf` file:

  ```bash
  docker run -d --name redis -v /path/to/redis.conf:/usr/local/etc/redis/redis.conf ...
  ```

- Pass additional command‑line arguments as shown in the run command.

---

## 5. Uninstalling

### Native

```bash
sudo systemctl stop redis
sudo pacman -R redis
```

Optionally remove data and logs:

```bash
sudo rm -rf /var/lib/redis
```

### Docker

```bash
docker stop redis
docker rm redis
docker volume rm redis-data   # deletes all persisted data
```

---

## 6. Troubleshooting

| Problem                            | Solution                                                                                                                |
| ---------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `redis-cli: command not found`     | Native: Redis not installed. Install with `sudo pacman -S redis`.                                                       |
| `Connection refused`               | The Redis service is not running. Start it with `sudo systemctl start redis` (native) or `docker start redis` (Docker). |
| `NOAUTH Authentication required`   | You need to provide the password (`-a` flag).                                                                           |
| Docker container exits immediately | Check logs: `docker logs redis`. Common cause: port already in use.                                                     |
| Data lost after container removal  | You used a volume (`redis-data`). Did you delete it? Data is preserved unless you delete the volume.                    |
| `systemctl start redis` hangs      | Check if another instance is already running. Look for `redis-server` processes.                                        |

---

Your Redis instance is now ready for use – as a cache, a message broker, or a fast key‑value store.
