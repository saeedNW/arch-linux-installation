# Docker & Docker Compose Installation Guide

Docker is a platform for developing, shipping, and running applications inside containers. Docker Compose allows you to define and run multi‑container applications with a YAML file.

> **ℹ️ Note:** Both Docker and Docker Compose are available in the official Arch Linux repositories, so no AUR helper is needed.

---

## Table of Contents

- [Docker \& Docker Compose Installation Guide](#docker--docker-compose-installation-guide)
  - [Table of Contents](#table-of-contents)
  - [1. Install Docker](#1-install-docker)
  - [2. Enable and Start Docker Service](#2-enable-and-start-docker-service)
  - [3. Verify Docker Installation](#3-verify-docker-installation)
  - [4. Manage Docker Without `sudo` (Optional)](#4-manage-docker-without-sudo-optional)
  - [5. Test Docker Installation](#5-test-docker-installation)
  - [6. Install Docker Compose](#6-install-docker-compose)
  - [7. Verify Docker Compose Installation](#7-verify-docker-compose-installation)
  - [8. Basic Docker \& Compose Commands](#8-basic-docker--compose-commands)
  - [9. Uninstalling](#9-uninstalling)
  - [10. Troubleshooting](#10-troubleshooting)

---

## 1. Install Docker

```bash
sudo pacman -S docker
```

This installs the Docker daemon (`dockerd`) and the CLI (`docker`).

---

## 2. Enable and Start Docker Service

```bash
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

- `enable` – starts Docker automatically on system boot.
- `start` – starts the service immediately.

Check the service status:

```bash
sudo systemctl status docker.service
```

---

## 3. Verify Docker Installation

```bash
sudo docker --version
```

Expected output: `Docker version xx.x.x`

---

## 4. Manage Docker Without `sudo` (Optional)

To avoid typing `sudo` for every Docker command, add your user to the `docker` group.

> **⚠️ Warning:** The `docker` group grants root‑equivalent privileges. Only add trusted users.

```bash
sudo usermod -aG docker $USER
```

Then activate the group change (without logging out):

```bash
newgrp docker
```

Now test without `sudo`:

```bash
docker --version
```

> **💡 Tip:** If you still get a permission error, log out and back in (or reboot).

---

## 5. Test Docker Installation

Run a simple test container:

```bash
docker run hello-world
```

If Docker is working correctly, you will see a welcome message explaining that the installation appears to be working.

---

## 6. Install Docker Compose

Docker Compose is available as a separate package:

```bash
sudo pacman -S docker-compose
```

> **📝 Note:** The package `docker-compose` provides the legacy Python version (v1). The newer `docker compose` plugin (v2) is included with Docker itself when using the `docker` package from Arch? Actually, on Arch, `docker-compose` is the v1 standalone binary. For the v2 plugin (part of Docker CLI), you would need `docker-compose-plugin` or use `docker compose` (without hyphen). The user installed `docker-compose`, so we follow that.

We'll assume they want the standalone binary.

---

## 7. Verify Docker Compose Installation

```bash
docker compose --version
```

Expected output: `docker compose version x.x.x`

---

## 8. Basic Docker & Compose Commands

| Task                                      | Command                      |
| ----------------------------------------- | ---------------------------- |
| List running containers                   | `docker ps`                  |
| List all containers                       | `docker ps -a`               |
| List images                               | `docker images`              |
| Stop a container                          | `docker stop <container-id>` |
| Remove a container                        | `docker rm <container-id>`   |
| Remove an image                           | `docker rmi <image-id>`      |
| Pull an image without running             | `docker pull <image>`        |
| Build and start services (docker-compose) | `docker-compose up -d`       |
| Stop services                             | `docker-compose down`        |
| View logs                                 | `docker-compose logs -f`     |

---

## 9. Uninstalling

To remove Docker and its data:

```bash
sudo pacman -R docker docker-compose
```

Optionally, remove containers, images, and networks:

```bash
sudo rm -rf /var/lib/docker
```

---

## 10. Troubleshooting

| Problem                                                      | Solution                                                                                           |
| ------------------------------------------------------------ | -------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `Cannot connect to the Docker daemon`                        | The service is not running. Start it with `sudo systemctl start docker`.                           |
| `Permission denied` even after adding user to `docker` group | Log out and back in, or restart your session.                                                      |
| `docker-compose: command not found`                          | Install it with `sudo pacman -S docker-compose`.                                                   |
| `docker run hello-world` fails with “pull access denied”     | Check your internet connection. The image is public.                                               |
| `Unable to find image`                                       | Verify that Docker can reach the registry. Try `docker pull hello-world` explicitly.               |
| `the backing file system is unsupported` (Btrfs users)       | Arch Linux uses Btrfs by default for many installations. Docker supports Btrfs; check `docker info | grep Storage`. If it shows `overlay2`, it’s fine. If not, you may need to reconfigure. |

---

Your Docker environment is now ready for containerised development.
