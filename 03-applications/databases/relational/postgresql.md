# PostgreSQL Setup with Docker (PostGIS & PGVector included)

PostgreSQL is a powerful, open‑source object‑relational database system. This guide sets up PostgreSQL with PostGIS and PGVector extensions using Docker, providing an isolated, reproducible environment with persistent storage.

> **📝 Prerequisite:** Docker must be installed and running (see the [Docker installation guide](../../development/containers/docker.md)).

---

## Table of Contents

- [PostgreSQL Setup with Docker (PostGIS \& PGVector included)](#postgresql-setup-with-docker-postgis--pgvector-included)
  - [Table of Contents](#table-of-contents)
  - [1. Why Docker for PostgreSQL?](#1-why-docker-for-postgresql)
  - [2. Prepare a Data Directory on the Host](#2-prepare-a-data-directory-on-the-host)
  - [3. Create a Docker Network](#3-create-a-docker-network)
  - [4. Run PostgreSQL (with PostGIS \& PGVector)](#4-run-postgresql-with-postgis--pgvector)
  - [5. Enable PostGIS and PGVector Extensions](#5-enable-postgis-and-pgvector-extensions)
  - [6. Accessing the PostgreSQL Server](#6-accessing-the-postgresql-server)
  - [7. Docker Compose Alternative (Recommended)](#7-docker-compose-alternative-recommended)
  - [8. Stopping / Removing the Container](#8-stopping--removing-the-container)
  - [9. Troubleshooting](#9-troubleshooting)

---

## 1. Why Docker for PostgreSQL?

| Aspect              | Benefit                                            |
| ------------------- | -------------------------------------------------- |
| **Isolation**       | No PostgreSQL dependencies on the host.            |
| **Reproducibility** | Same configuration everywhere.                     |
| **Easy updates**    | Pull a new image and restart.                      |
| **Clean removal**   | Delete container and volume – nothing left behind. |

No extra services are required – Docker provides everything.

---

## 2. Prepare a Data Directory on the Host

Create a directory where PostgreSQL will store its data files (so data persists across container restarts).

```bash
sudo mkdir -p /opt/postgresql
sudo chown $USER:users /opt/postgresql   # adjust group to your primary group if needed
```

> **💡 Tip:** Replace `users` with your group (e.g., `wheel`). The user you run Docker with must have write access.

---

## 3. Create a Docker Network

Placing containers on the same user‑defined network allows them to communicate by container name.

```bash
docker network create pg-net
```

---

## 4. Run PostgreSQL (with PostGIS & PGVector)

We will use the image `ivanlonel/postgis-with-extensions`, which already includes PostGIS and PGVector extensions.

```bash
docker run -d \
	--name postgres \
	--network pg-net \
	-e POSTGRES_USER=postgres \
	-e POSTGRES_PASSWORD=root \
	-v /opt/postgresql:/var/lib/postgresql/data \
	-p 5432:5432 \
	ivanlonel/postgis-with-extensions
```

**Explanation of options:**

| Option                                        | Purpose                                                |
| --------------------------------------------- | ------------------------------------------------------ |
| `--network pg-net`                            | Attaches to the custom network.                        |
| `-e POSTGRES_USER=postgres`                   | Sets the superuser name.                               |
| `-e POSTGRES_PASSWORD=root`                   | Sets the superuser password.                           |
| `-v /opt/postgresql:/var/lib/postgresql/data` | Mounts the host directory for persistent data storage. |
| `-p 5432:5432`                                | Exposes PostgreSQL’s default port to the host.         |

> **⚠️ Note:** The container path `/var/lib/postgresql/data` is the default data directory for this image. Verify with `docker exec postgres ls /var/lib/postgresql/data`.

---

## 5. Enable PostGIS and PGVector Extensions

After the PostgreSQL container is running, enable the extensions:

```bash
docker exec -it postgres psql -U postgres -c "CREATE EXTENSION IF NOT EXISTS vector;"
docker exec -it postgres psql -U postgres -c "CREATE EXTENSION IF NOT EXISTS postgis;"
```

> **💡 Tip:** You can also create these extensions in a specific database by adding `-d your_database_name` before `-c`.

---

## 6. Accessing the PostgreSQL Server

From your host machine, you can connect to PostgreSQL on `localhost:5432` using any client.

**Using `psql` (if installed locally):**

```bash
psql -h localhost -p 5432 -U postgres -d postgres
```

(Enter the password `root` when prompted.)

**Using the container’s own `psql`:**

```bash
docker exec -it postgres psql -U postgres
```

To manage databases graphically, consider installing pgAdmin (see the separate **pgAdmin Setup** guide).

---

## 7. Docker Compose Alternative (Recommended)

Create a `docker-compose.yml` file for a reproducible setup (this also includes pgAdmin, but you can omit it if you only need PostgreSQL):

```yaml
services:
	postgres:
		image: ivanlonel/postgis-with-extensions
		container_name: postgres
		restart: unless-stopped
		ports:
			- '5432:5432'
		environment:
			POSTGRES_USER: postgres
			POSTGRES_PASSWORD: root
		volumes:
			- /opt/postgresql:/var/lib/postgresql/data
		networks:
			- pg-net

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
		driver: bridge
```

Run with:

```bash
docker-compose up -d
```

After starting, enable the extensions as described in [Step 5](#5-enable-postgis-and-pgvector-extensions).

---

## 8. Stopping / Removing the Container

Stop the container (data persists):

```bash
docker stop postgres
```

Start it again:

```bash
docker start postgres
```

Remove the container (the data volume remains):

```bash
docker rm postgres
```

To delete all databases as well, remove the data directory `/opt/postgresql` (or the Docker volume if you used a named volume instead).

---

## 9. Troubleshooting

| Problem                                                                   | Solution                                                                                                                                 |
| ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `docker: command not found`                                               | Docker not installed.                                                                                                                    |
| `Permission denied` when creating `/opt/postgresql`                       | Use `sudo` or choose a directory you own, e.g., `~/postgres_data`.                                                                       |
| PostgreSQL fails to start because `/var/lib/postgresql/data` is not empty | The image expects an empty data directory on first run. Remove everything from `/opt/postgresql` (backup first if needed).               |
| Cannot connect to PostgreSQL from host application                        | Ensure the port `5432` is not blocked by a firewall. Use `localhost:5432`.                                                               |
| `CREATE EXTENSION vector` fails                                           | The image `ivanlonel/postgis-with-extensions` includes PGVector. If not, use an image that bundles them, or install extensions manually. |
| Data lost after container removal                                         | You used a bind mount (`/opt/postgresql`), so data should still be there. If you used a named volume, ensure you did not delete it.      |

---

Your PostgreSQL server with PostGIS and PGVector is now ready for development and testing.
