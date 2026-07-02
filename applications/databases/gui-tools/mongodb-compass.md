# MongoDB Compass Setup

MongoDB Compass is the official graphical user interface for exploring and managing MongoDB databases. This guide assumes you already have a running MongoDB instance (see the separate **MongoDB Setup** guide).

---

## Table of Contents

- [MongoDB Compass Setup](#mongodb-compass-setup)
  - [Table of Contents](#table-of-contents)
  - [1. Prerequisites](#1-prerequisites)
  - [2. Install MongoDB Compass](#2-install-mongodb-compass)
  - [3. Connecting to MongoDB with Compass](#3-connecting-to-mongodb-with-compass)
  - [4. Troubleshooting](#4-troubleshooting)

---

## 1. Prerequisites

- A working MongoDB instance (installed via AUR or Docker).
- The connection string for your instance (see the table below).

---

## 2. Install MongoDB Compass

On Arch Linux, you can install the Compass binary from the AUR:

```bash
yay -S mongodb-compass
```

After installation, launch Compass from your application menu or by running `mongodb-compass` in the terminal.

---

## 3. Connecting to MongoDB with Compass

Use the same connection strings you would use with any MongoDB client.

| MongoDB Setup                       | Compass Connection String              |
| ----------------------------------- | -------------------------------------- |
| **AUR (local, no authentication)**  | `mongodb://localhost:27017`            |
| **Docker (with the example auth)**  | `mongodb://mongo:root@localhost:27017` |
| **Docker Compose (container name)** | `mongodb://mongo:root@mongo:27017`     |

When the connection dialog appears in Compass, paste the appropriate string and click **Connect**.

> **💡 Tip:** If your Docker container uses a different username / password, adjust the string accordingly (e.g. `mongodb://<user>:<password>@localhost:27017`).

---

## 4. Troubleshooting

| Problem                                                   | Solution                                                                                                                                                 |
| --------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Cannot connect to MongoDB from Compass**                | Ensure the MongoDB container is running (`docker ps`). Use `localhost` as the host, and verify the port (`27017`).                                       |
| **Authentication failed**                                 | Double‑check the username and password. For the Docker example, use `mongo` / `root`. For AUR, MongoDB does not have authentication enabled by default.  |
| **Compass fails to start or shows a blank screen**        | Try launching from the terminal to see error messages: `mongodb-compass`. If issues persist, reinstall: `yay -S mongodb-compass`.                        |
| **“MongoDB not running” error even though service is up** | Check that the service name is correct (`mongodb` for the AUR package, not `mongod`). For Docker, make sure the port `27017` is exposed and not blocked. |

---

Once connected, you can visually browse databases, collections, and documents, run queries, and manage indexes.
