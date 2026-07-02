# Portainer Container Management Setup Guide

Portainer is a user‑friendly container management platform that provides a web‑based UI for Docker (and Kubernetes). It simplifies deploying, monitoring, and managing containers without using the command line.

> **📝 Prerequisite:** Docker must be installed and running (see the [Docker installation guide](./docker.md).

---

## Table of Contents

- [Portainer Container Management Setup Guide](#portainer-container-management-setup-guide)
  - [Table of Contents](#table-of-contents)
  - [1. What is Portainer?](#1-what-is-portainer)
  - [2. Running Portainer as a Docker Container](#2-running-portainer-as-a-docker-container)
  - [3. Accessing the Portainer Web UI](#3-accessing-the-portainer-web-ui)
  - [4. Stopping / Removing Portainer](#4-stopping--removing-portainer)
  - [5. Updating Portainer](#5-updating-portainer)
  - [6. Using Docker Compose (Alternative)](#6-using-docker-compose-alternative)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. What is Portainer?

Portainer provides a clean web dashboard to manage:

- Containers, images, volumes, networks
- Container logs and statistics
- Access to a terminal inside containers
- Docker Compose stacks via UI

It runs as a lightweight container itself and persists its data in a Docker volume.

---

## 2. Running Portainer as a Docker Container

Run the following command to start Portainer Community Edition:

```bash
docker run -d \
    -p 8000:8000 \
    -p 9443:9443 \
    --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce
```

**Explanation of options:**

| Option                                         | Purpose                                                                    |
| ---------------------------------------------- | -------------------------------------------------------------------------- |
| `-d`                                           | Run in detached mode (background)                                          |
| `-p 8000:8000`                                 | Expose port 8000 (used for edge compute features)                          |
| `-p 9443:9443`                                 | Expose the secure web UI port (HTTPS)                                      |
| `--name portainer`                             | Assign a name to the container                                             |
| `--restart=always`                             | Automatically restart the container if it stops or the system reboots      |
| `-v /var/run/docker.sock:/var/run/docker.sock` | Mount the Docker socket so Portainer can manage the Docker daemon          |
| `-v portainer_data:/data`                      | Create and use a Docker volume for persistent data (settings, users, etc.) |
| `portainer/portainer-ce`                       | The official image for Portainer Community Edition                         |

> **⚠️ Note:** Portainer runs an HTTPS server on port 9443 by default. The older port 9000 (HTTP) is deprecated for security reasons.

---

## 3. Accessing the Portainer Web UI

1. Open your browser and go to: `https://localhost:9443`
2. If accessing remotely, replace `localhost` with your server’s IP address.
3. Your browser will warn about a self‑signed certificate – it is safe to proceed.
4. **Create an admin user** (first launch only):
   - Username: `admin`
   - Password: choose a strong password
5. After login, select “Get Started” and you will see your local Docker environment.

> **💡 Tip:** To expose Portainer on a different port, change the left‑hand side of `-p`, e.g., `-p 8080:9443`.

---

## 4. Stopping / Removing Portainer

To stop the container (without removing data):

```bash
docker stop portainer
```

To start it again:

```bash
docker start portainer
```

To remove the container (your `portainer_data` volume remains unless deleted):

```bash
docker rm portainer
```

To remove the volume as well (this deletes all Portainer configuration):

```bash
docker volume rm portainer_data
```

---

## 5. Updating Portainer

Stop and remove the existing container (data volume stays intact):

```bash
docker stop portainer
docker rm portainer
```

Then pull the latest image and run the same `docker run` command again:

```bash
docker pull portainer/portainer-ce
docker run -d ... (same as above)
```

Your previous settings and users will be preserved in `portainer_data`.

---

## 6. Using Docker Compose (Alternative)

Create a `docker-compose.yml` file:

```yaml
services:
  portainer:
    image: portainer/portainer-ce
    container_name: portainer
    restart: always
    ports:
      - '8000:8000'
      - '9443:9443'
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data

volumes:
  portainer_data:
```

Then start with:

```bash
docker-compose up -d
```

---

## 7. Troubleshooting

| Problem                                       | Solution                                                                                 |
| --------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `docker: command not found`                   | Docker is not installed. Install it first.                                               |
| `port: already in use`                        | Change the host port (e.g., `-p 9444:9443`).                                             |
| Cannot access the web UI                      | Check that the container is running: `docker ps`; inspect logs: `docker logs portainer`. |
| Self‑signed certificate warning               | Accept the risk in your browser. For production, replace with a real certificate.        |
| Portainer shows “Unable to connect to Docker” | Ensure `/var/run/docker.sock` is mounted and the `docker` user group is set correctly.   |

Your Portainer instance is now ready to manage containers through a beautiful web dashboard.
