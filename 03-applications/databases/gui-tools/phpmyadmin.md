# phpMyAdmin Setup with Docker

phpMyAdmin is a web‑based tool for managing MySQL databases. This guide assumes you already have a running MySQL instance (see the separate **MySQL Setup** guide). We’ll run phpMyAdmin in a Docker container and connect it to your MySQL server.

> **📝 Prerequisite:** Docker must be installed and running. A MySQL container (or any accessible MySQL server) must be available.

---

## Table of Contents

- [phpMyAdmin Setup with Docker](#phpmyadmin-setup-with-docker)
  - [Table of Contents](#table-of-contents)
  - [1. Prerequisites](#1-prerequisites)
  - [2. Run phpMyAdmin](#2-run-phpmyadmin)
  - [3. Access phpMyAdmin](#3-access-phpmyadmin)
  - [4. Docker Compose Alternative (Recommended)](#4-docker-compose-alternative-recommended)
  - [5. Stopping / Removing the Container](#5-stopping--removing-the-container)
  - [6. Troubleshooting](#6-troubleshooting)

---

## 1. Prerequisites

- **A running MySQL server** – In the examples we assume a MySQL Docker container named `mysql`, attached to a Docker network called `mysql-net`. If your MySQL setup is different, adjust the `PMA_HOST` environment variable accordingly (e.g., IP address or hostname).
- **A Docker network** – If both containers are on the same user‑defined network, phpMyAdmin can reach MySQL by the container name. If you followed the MySQL guide, the network `mysql-net` already exists.

---

## 2. Run phpMyAdmin

```bash
docker run -d \
  --name phpmyadmin \
  --network mysql-net \
  -e PMA_HOST=mysql \
  -p 8080:80 \
  phpmyadmin/phpmyadmin
```

**Explanation:**

| Option                | Purpose                                                                  |
| --------------------- | ------------------------------------------------------------------------ |
| `--network mysql-net` | Same network as MySQL (replace with your network name if different).     |
| `-e PMA_HOST=mysql`   | Hostname of the MySQL server. Use the container name if on same network. |
| `-p 8080:80`          | Maps phpMyAdmin’s web interface to port `8080` on the host.              |

> **💡 Tip:** If your MySQL server runs on the host (not in Docker) and you want to connect from a phpMyAdmin container on the default bridge network, use `host.docker.internal` as `PMA_HOST` (or `172.17.0.1` on Linux).

---

## 3. Access phpMyAdmin

1. Open your browser and go to `http://localhost:8080`.
2. Log in with:
   - **Username:** `root`
   - **Password:** the root password you set for MySQL (e.g., `root`).
3. You should see the phpMyAdmin dashboard and your databases.

---

## 4. Docker Compose Alternative (Recommended)

The following `docker-compose.yml` file defines both MySQL and phpMyAdmin. You can use it to start the full stack, or adapt it if you already have MySQL running separately.

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

  phpmyadmin:
    image: phpmyadmin/phpmyadmin
    container_name: phpmyadmin
    restart: unless-stopped
    ports:
      - '8080:80'
    environment:
      PMA_HOST: mysql
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

Then access phpMyAdmin at `http://localhost:8080`.

---

## 5. Stopping / Removing the Container

Stop the phpMyAdmin container:

```bash
docker stop phpmyadmin
```

Start it again:

```bash
docker start phpmyadmin
```

Remove the container:

```bash
docker rm phpmyadmin
```

Removing the container does **not** affect your MySQL databases.

---

## 6. Troubleshooting

| Problem                                          | Solution                                                                                                                                                 |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| phpMyAdmin shows “Cannot log in to MySQL server” | Ensure the MySQL container is running. Check that both containers are on the same network (`docker network inspect mysql-net`). Verify `PMA_HOST` value. |
| Connection refused or timeout                    | If MySQL is not in Docker, use `host.docker.internal` or the host’s IP as `PMA_HOST`. Make sure the MySQL port is exposed.                               |
| Port `8080` already in use                       | Change the host port mapping (e.g., `-p 8081:80`).                                                                                                       |
| Root login fails                                 | Double‑check the MySQL root password. For Docker MySQL, the password is set by `MYSQL_ROOT_PASSWORD`.                                                    |
| phpMyAdmin container exits immediately           | Check logs: `docker logs phpmyadmin`. Common cause: `PMA_HOST` cannot be resolved.                                                                       |

---

phpMyAdmin is now ready. Connect to `http://localhost:8080` and manage your databases visually.
