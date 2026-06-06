# Dockhand – Container Management Web UI

Dockhand is a lightweight, self‑hosted web interface for managing Docker containers, images, volumes, and networks. It provides a clean dashboard and is designed to be easy to deploy as a single container.

> **📝 Prerequisite:** Docker must be installed and running (see the [Docker installation guide](./docker.md)).

---

## Table of Contents

- [Dockhand – Container Management Web UI](#dockhand--container-management-web-ui)
  - [Table of Contents](#table-of-contents)
  - [1. What is Dockhand?](#1-what-is-dockhand)
  - [2. Running Dockhand as a Docker Container](#2-running-dockhand-as-a-docker-container)
  - [3. Accessing the Dockhand Web UI](#3-accessing-the-dockhand-web-ui)
  - [4. Configuration \& Persistent Data](#4-configuration--persistent-data)
  - [5. Stopping / Removing Dockhand](#5-stopping--removing-dockhand)
  - [6. Updating Dockhand](#6-updating-dockhand)
  - [7. Using Docker Compose (Alternative)](#7-using-docker-compose-alternative)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. What is Dockhand?

Dockhand is a minimalistic container management tool that exposes a web dashboard on port 3000 inside the container. It connects to the Docker daemon through the mounted socket and stores its own configuration in a Docker volume.

**Key features:**

- Web‑based container, image, volume, and network management
- Lightweight (single container)
- Persistent data via Docker volume
- Easy to update

---

## 2. Running Dockhand as a Docker Container

Run the following command to start Dockhand:

```bash
docker run -d \
  --name dockhand \
  --restart unless-stopped \
  -p 9443:3000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v dockhand_data:/app/data \
  fnsys/dockhand:latest
```

**Explanation of options:**

| Option                                         | Purpose                                                                       |
| ---------------------------------------------- | ----------------------------------------------------------------------------- |
| `-d`                                           | Run in detached mode (background).                                            |
| `--name dockhand`                              | Assign a name to the container.                                               |
| `--restart unless-stopped`                     | Automatically restart the container unless it is manually stopped.            |
| `-p 9443:3000`                                 | Map host port `9443` to container port `3000` (where Dockhand serves its UI). |
| `-v /var/run/docker.sock:/var/run/docker.sock` | Mount the Docker socket so Dockhand can manage the Docker daemon.             |
| `-v dockhand_data:/app/data`                   | Create and mount a Docker volume for persistent data (user settings, etc.).   |
| `fnsys/dockhand:latest`                        | The official Dockhand image.                                                  |

> **💡 Tip:** You can change the host port (left side of `-p`) to any free port, e.g., `-p 8080:3000`.

---

## 3. Accessing the Dockhand Web UI

1. Open your browser and go to: `http://localhost:9443`
   (If accessing remotely, replace `localhost` with your server’s IP address.)
2. The first time you access the UI, you may be asked to set up an admin user or simply be presented with the dashboard – it depends on the version. (Refer to Dockhand’s documentation for the exact initial screen.)
3. You should see an overview of your Docker environment: containers, images, volumes, etc.

> **⚠️ Note:** By default Dockhand uses HTTP, not HTTPS. If you need encrypted access, put a reverse proxy (like Nginx or Caddy) in front of it.

---

## 4. Configuration & Persistent Data

- **Docker socket mount** – required for Dockhand to communicate with the Docker daemon.
- **`dockhand_data` volume** – stores user preferences, saved filters, and other application data. The container path `/app/data` is where Dockhand writes its state.

To inspect the volume:

```bash
docker volume inspect dockhand_data
```

To back up the configuration:

```bash
docker run --rm -v dockhand_data:/data -v $(pwd):/backup alpine tar czf /backup/dockhand_data_backup.tar.gz -C /data .
```

---

## 5. Stopping / Removing Dockhand

Stop the container (data volume is preserved):

```bash
docker stop dockhand
```

Start it again:

```bash
docker start dockhand
```

Remove the container (data volume remains):

```bash
docker rm dockhand
```

To remove the volume as well (this deletes all Dockhand configuration):

```bash
docker volume rm dockhand_data
```

---

## 6. Updating Dockhand

Stop and remove the existing container:

```bash
docker stop dockhand
docker rm dockhand
```

Pull the latest image:

```bash
docker pull fnsys/dockhand:latest
```

Then run the same `docker run` command again (from section 2). Your data volume remains intact.

> **💡 Tip:** For zero‑downtime updates, use a reverse proxy and orchestrate a rolling update, but for a simple setup, the stop/remove/run approach is sufficient.

---

## 7. Using Docker Compose (Alternative)

Create a `docker-compose.yml` file:

```yaml
services:
  dockhand:
    image: fnsys/dockhand:latest
    container_name: dockhand
    restart: unless-stopped
    ports:
      - '9443:3000'
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - dockhand_data:/app/data

volumes:
  dockhand_data:
```

Then start with:

```bash
docker-compose up -d
```

To update with Compose:

```bash
docker-compose pull
docker-compose up -d
```

---

## 8. Troubleshooting

| Problem                                         | Solution                                                                                                                                   |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `docker: command not found`                     | Docker is not installed. Install it first.                                                                                                 |
| `port is already allocated`                     | Change the host port (e.g., `-p 9444:3000`).                                                                                               |
| Cannot access web UI                            | Check that the container is running: `docker ps`. Inspect logs: `docker logs dockhand`.                                                    |
| `Permission denied` when mounting Docker socket | Your user needs to be in the `docker` group (`sudo usermod -aG docker $USER`), or run the container with `sudo`.                           |
| `No such image` or `pull access denied`         | The image name might have changed. Check [Dockhand on Docker Hub](https://hub.docker.com/r/fnsys/dockhand) for the correct tag.            |
| Data not persisted after container removal      | Make sure you used the volume `dockhand_data:/app/data`. If you used a bind mount instead, data would be lost.                             |
| UI shows errors about missing capabilities      | Dockhand may need additional permissions. Try running the container with `--privileged` (not recommended) or consult the project’s GitHub. |

---

Your Dockhand container management UI is now ready. Enjoy the simple, web‑based control of your Docker environment!
