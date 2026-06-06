# pgAdmin Setup with Docker

pgAdmin is the leading web‑based management tool for PostgreSQL. This guide assumes you already have a running PostgreSQL instance (see the separate **PostgreSQL Setup** guide). We’ll run pgAdmin in a Docker container and connect it to your database.

> **📝 Prerequisite:** Docker must be installed and a PostgreSQL server must be accessible (e.g., a Docker container named `postgres` on a custom network `pg-net`).

---

## Table of Contents

- [pgAdmin Setup with Docker](#pgadmin-setup-with-docker)
  - [Table of Contents](#table-of-contents)
  - [1. Prerequisites](#1-prerequisites)
  - [2. Run pgAdmin](#2-run-pgadmin)
  - [3. Connect pgAdmin to PostgreSQL](#3-connect-pgadmin-to-postgresql)
  - [4. Docker Compose Alternative (Recommended)](#4-docker-compose-alternative-recommended)
  - [5. Stopping / Removing the Container](#5-stopping--removing-the-container)
  - [6. Troubleshooting](#6-troubleshooting)

---

## 1. Prerequisites

- **A running PostgreSQL server** – In the examples we assume a PostgreSQL Docker container named `postgres`, attached to a network called `pg-net`. If your PostgreSQL setup differs, adjust the hostname accordingly (e.g., IP address, `host.docker.internal` for host‑running PostgreSQL, or a custom container name).
- **A Docker network** – Both containers should be on the same user‑defined network (e.g., `pg-net`) so that pgAdmin can reach PostgreSQL by container name. If you followed the PostgreSQL guide, the network already exists.

---

## 2. Run pgAdmin

```bash
docker run -d \
  --name pgadmin_container \
  --network pg-net \
  -e PGADMIN_DEFAULT_EMAIL=admin@example.com \
  -e PGADMIN_DEFAULT_PASSWORD=admin \
  -p 8081:80 \
  dpage/pgadmin4
```

**Explanation:**

| Option                        | Purpose                                                  |
| ----------------------------- | -------------------------------------------------------- |
| `--network pg-net`            | Same network as PostgreSQL (replace with your network).  |
| `-e PGADMIN_DEFAULT_EMAIL`    | Login email for pgAdmin.                                 |
| `-e PGADMIN_DEFAULT_PASSWORD` | Login password.                                          |
| `-p 8081:80`                  | Maps pgAdmin’s web interface to port `8081` on the host. |

> **💡 Tip:** If your PostgreSQL server is not in Docker, or not on the same network, use `host.docker.internal` as the host address when connecting (or the actual IP of the host).

---

## 3. Connect pgAdmin to PostgreSQL

1. Open your browser and go to `http://localhost:8081`.
2. Log in with:
   - **Email:** `admin@example.com`
   - **Password:** `admin`
3. Click **Add New Server**.
4. In the **General** tab, give it a name (e.g., `MyPostgres`).
5. In the **Connection** tab:
   - **Host name/address**: `postgres` (the container name – works because they are on the same Docker network)
   - **Port**: `5432`
   - **Maintenance database**: `postgres`
   - **Username**: `postgres`
   - **Password**: `root`
6. Click **Save**. You should now see your database server.

---

## 4. Docker Compose Alternative (Recommended)

If you’re using Docker Compose, you can include pgAdmin alongside your PostgreSQL service. A full Compose example is provided in the **PostgreSQL Setup** guide. For a pgAdmin‑only service (assuming PostgreSQL already exists on the network `pg-net`), you can use:

```yaml
services:
  pgadmin:
    image: dpage/pgadmin4
    container_name: pgadmin_container
    restart: unless-stopped
    ports:
      - '8081:80'
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@example.com
      PGADMIN_DEFAULT_PASSWORD: admin
    networks:
      - pg-net

networks:
  pg-net:
    external: true # assumes pg-net already exists
```

Run with:

```bash
docker-compose up -d
```

Then follow the connection steps in [Section 3](#3-connect-pgadmin-to-postgresql).

---

## 5. Stopping / Removing the Container

Stop the pgAdmin container:

```bash
docker stop pgadmin_container
```

Start it again:

```bash
docker start pgadmin_container
```

Remove the container (no data is stored inside it):

```bash
docker rm pgadmin_container
```

Removing the container does **not** affect your PostgreSQL databases.

---

## 6. Troubleshooting

| Problem                                     | Solution                                                                                                                                                        |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| pgAdmin shows “Unable to connect to server” | Both containers must be on the same network (`docker network inspect pg-net`). Verify the host name is `postgres` and that PostgreSQL is running.               |
| Connection refused or timeout               | If PostgreSQL is on the host (not in Docker), use `host.docker.internal` as the host address. Check that the PostgreSQL port `5432` is exposed and not blocked. |
| Port `8081` already in use                  | Change the host port mapping (e.g., `-p 8082:80`).                                                                                                              |
| Login fails at pgAdmin                      | Double‑check the `PGADMIN_DEFAULT_EMAIL` and `PGADMIN_DEFAULT_PASSWORD` you set.                                                                                |
| Forgot pgAdmin credentials?                 | Delete the container and recreate it – pgAdmin stores no state unless you mount a volume. Set new credentials via environment variables.                        |

---

pgAdmin is now ready. Connect to `http://localhost:8081` and manage your PostgreSQL databases visually.
