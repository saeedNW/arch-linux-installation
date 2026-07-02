# MongoDB Setup

MongoDB is a popular NoSQL database that stores data in flexible, JSON‑like documents. This guide covers two installation methods (AUR and Docker).

> **ℹ️ Note:** Arch Linux no longer provides official MongoDB packages in its main repositories. The AUR option uses a community‑maintained binary package (`mongodb-bin`). The Docker option is often simpler and more isolated.

---

## Table of Contents

- [MongoDB Setup](#mongodb-setup)
  - [Table of Contents](#table-of-contents)
  - [1. Installation Methods](#1-installation-methods)
    - [Option 1: Install via AUR (`mongodb-bin`)](#option-1-install-via-aur-mongodb-bin)
      - [Start \& Enable the MongoDB Service](#start--enable-the-mongodb-service)
      - [Verify Installation](#verify-installation)
    - [Option 2: Run MongoDB via Docker](#option-2-run-mongodb-via-docker)
      - [Create a Docker Network (Optional)](#create-a-docker-network-optional)
      - [Run MongoDB Container](#run-mongodb-container)
  - [2. Connecting to MongoDB](#2-connecting-to-mongodb)
  - [3. Troubleshooting](#3-troubleshooting)

---

## 1. Installation Methods

Choose **either** the AUR method (system‑wide installation) or the Docker method (isolated container).

---

### Option 1: Install via AUR (`mongodb-bin`)

This installs MongoDB directly on your host system using the community‑maintained binary package.

```bash
yay -S mongodb-bin
```

> **💡 Tip:** The `-bin` suffix indicates a pre‑compiled binary package – no compilation is needed.

#### Start & Enable the MongoDB Service

```bash
sudo systemctl start mongodb
sudo systemctl enable mongodb
```

#### Verify Installation

```bash
sudo systemctl status mongodb
```

The service should show `active (running)`.

> **⚠️ Note:** The service name is `mongodb` (not `mongod`). This is specific to the AUR package.

---

### Option 2: Run MongoDB via Docker

Running MongoDB in Docker isolates it from your host and is often simpler to manage.

#### Create a Docker Network (Optional)

```bash
docker network create mongo-net
```

#### Run MongoDB Container

```bash
docker run -d \
	--name mongo \
	--network mongo-net \
	-p 27017:27017 \
	-v mongo-data:/data/db \
	-e MONGO_INITDB_ROOT_USERNAME=mongo \
	-e MONGO_INITDB_ROOT_PASSWORD=root \
	mongo:latest
```

**Explanation:**

| Option                                | Purpose                                  |
| ------------------------------------- | ---------------------------------------- |
| `--network mongo-net`                 | Attaches to a custom network (optional). |
| `-p 27017:27017`                      | Exposes MongoDB’s default port.          |
| `-v mongo-data:/data/db`              | Persists data using a Docker volume.     |
| `-e MONGO_INITDB_ROOT_USERNAME=mongo` | Sets the root username.                  |
| `-e MONGO_INITDB_ROOT_PASSWORD=root`  | Sets the root password.                  |

> **💡 Tip:** To access MongoDB from other containers on the same network, use the hostname `mongo`.

---

## 2. Connecting to MongoDB

| Method                              | Connection String                                                              |
| ----------------------------------- | ------------------------------------------------------------------------------ |
| **AUR (local)**                     | `mongodb://localhost:27017` (no authentication)                                |
| **Docker (with auth)**              | `mongodb://mongo:root@localhost:27017`                                         |
| **Docker Compose (container name)** | `mongodb://mongo:root@mongo:27017` (from other containers on the same network) |

> **💡 Tip:** To connect graphically, install [MongoDB Compass](https://www.mongodb.com/products/compass) and use the same connection strings. For an AUR installation of Compass, see the separate **MongoDB Compass Setup** guide.
>
> **⚠️ Security note:** The examples use a simple password. In production, use strong credentials and consider enabling TLS.

---

## 3. Troubleshooting

| Problem                                                        | Solution                                                                                                                                                       |
| -------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `mongodb.service: command not found` (AUR)                     | The service name is `mongodb`. Use `sudo systemctl status mongodb`.                                                                                            |
| Docker container exits immediately                             | Check logs: `docker logs mongo`. Common issues: volume permissions or port conflict.                                                                           |
| Authentication failed                                          | For the Docker container, use username `mongo` and password `root`. For the AUR install, there is no default authentication – you must create a user manually. |
| MongoDB data lost after Docker container removal               | You used a volume (`mongo-data`), so data is preserved. Do not delete the volume.                                                                              |
| `mongodb-bin` fails to start because of missing `libcrypto.so` | Install `openssl-1.0` from AUR: `yay -S openssl-1.0`.                                                                                                          |

---

Your MongoDB instance is now ready for development and testing.
