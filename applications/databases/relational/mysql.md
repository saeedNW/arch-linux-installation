# MySQL Setup with Docker

MySQL is a popular open‑source relational database management system. This guide shows you how to run MySQL inside a Docker container with persistent storage and basic configuration.

> **📝 Prerequisite:** Docker must be installed and running (see the [Docker installation guide](../../development/containers/docker.md)).

---

## Table of Contents

- [MySQL Setup with Docker](#mysql-setup-with-docker)
  - [Table of Contents](#table-of-contents)
  - [1. Why Docker for MySQL?](#1-why-docker-for-mysql)
  - [2. Prepare a Data Directory on the Host](#2-prepare-a-data-directory-on-the-host)
  - [3. Create a Docker Network (Optional)](#3-create-a-docker-network-optional)
  - [4. Run MySQL with Persistent Storage](#4-run-mysql-with-persistent-storage)
  - [5. Accessing the MySQL Server](#5-accessing-the-mysql-server)
  - [6. Docker Compose Alternative (Recommended)](#6-docker-compose-alternative-recommended)
  - [7. Stopping / Removing the Container](#7-stopping--removing-the-container)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Why Docker for MySQL?

| Aspect              | Benefit                                     |
| ------------------- | ------------------------------------------- |
| **Isolation**       | No MySQL dependencies on the host.          |
| **Reproducibility** | Same configuration everywhere.              |
| **Easy updates**    | Pull a new image and restart.               |
| **Clean removal**   | Delete container and volume – no leftovers. |

No extra services are required – Docker provides everything.

---

## 2. Prepare a Data Directory on the Host

Create a directory where MySQL will store its database files (so data persists across container restarts).

```bash
sudo mkdir -p /opt/mysql
sudo chown $USER:users /opt/mysql   # adjust group to your primary group if needed
```

> **💡 Tip:** Replace `users` with your group (e.g., `wheel`). The user you run Docker with must have write access.

---

## 3. Create a Docker Network (Optional)

A user‑defined network makes it easy to connect other containers (like phpMyAdmin) later.

```bash
docker network create mysql-net
```

If you only need MySQL and no other containers, you can skip this step and omit `--network` in the run command.

---

## 4. Run MySQL with Persistent Storage

```bash
docker run -d \
  --name mysql \
  --network mysql-net \
  -e MYSQL_ROOT_PASSWORD="root" \
  -v /opt/mysql:/var/lib/mysql \
  -p 3306:3306 \
  mysql
```

**Explanation of options:**

| Option                          | Purpose                                                |
| ------------------------------- | ------------------------------------------------------ |
| `--network mysql-net`           | Attaches to the custom network (optional).             |
| `-e MYSQL_ROOT_PASSWORD="root"` | Sets the root password (change this in production!).   |
| `-v /opt/mysql:/var/lib/mysql`  | Mounts the host directory for persistent data storage. |
| `-p 3306:3306`                  | Exposes MySQL’s default port to the host.              |

> **⚠️ Security note:** Do not use `root` as password in production. Use a strong password and consider creating a dedicated user.

---

## 5. Accessing the MySQL Server

From your host machine, you can connect to MySQL on `localhost:3306` using any MySQL client.

**Using the MySQL command‑line client (if installed locally):**

```bash
mysql -h 127.0.0.1 -P 3306 -u root -p
```

Enter the password (`root` in this example).

If you don’t have the client installed, you can use the container’s own client:

```bash
docker exec -it mysql mysql -u root -p
```

> **💡 Tip:** To manage MySQL graphically, consider installing [phpMyAdmin](https://www.phpmyadmin.net/) (see the separate **phpMyAdmin Setup** guide).

---

## 6. Docker Compose Alternative (Recommended)

Create a `docker-compose.yml` file for a reproducible setup:

```yaml
services:
  mysql:
    image: mysql
    container_name: mysql
    restart: unless-stopped
    ports:
      - '3306:3306'
    environment:
      MYSQL_ROOT_PASSWORD: root
    volumes:
      - /opt/mysql:/var/lib/mysql
    networks:
      - mysql-net

networks:
  mysql-net:
    driver: bridge
```

Run with:

```bash
docker-compose up -d
```

---

## 7. Stopping / Removing the Container

Stop the container (data persists):

```bash
docker stop mysql
```

Start it again:

```bash
docker start mysql
```

Remove the container (the data volume remains):

```bash
docker rm mysql
```

To delete all databases as well, remove the data directory `/opt/mysql` (or the Docker volume if you used one).

---

## 8. Troubleshooting

| Problem                                                    | Solution                                                                                                                       |
| ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `docker: command not found`                                | Docker not installed.                                                                                                          |
| `Permission denied` when creating `/opt/mysql`             | Use `sudo` or choose a directory you own, e.g., `~/mysql_data`.                                                                |
| MySQL fails to start because `/var/lib/mysql` is not empty | The image expects an empty data directory on first run. Remove everything from `/opt/mysql` (backup first if needed).          |
| Port `3306` already in use                                 | Change the host port mapping (e.g., `-p 3307:3306`).                                                                           |
| Root login fails                                           | Check the password you set in `MYSQL_ROOT_PASSWORD`. If you changed it later, the variable only applies on first run.          |
| Data lost after container removal                          | You used a bind mount (`/opt/mysql`), so data should still be there. If you used a named volume, ensure you did not delete it. |

---

Your MySQL server is now ready for development and testing. Connect to `localhost:3306` from any client.
