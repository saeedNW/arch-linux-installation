# RabbitMQ Setup with Docker

RabbitMQ is a reliable open‑source message broker that implements the AMQP 0‑9‑1 protocol. Running it in a Docker container is a clean, isolated, and reproducible way to use it without polluting your host system.

> **📝 Prerequisite:** Docker must be installed and running (see the [Docker installation guide](../containers/docker.md)).

---

## Table of Contents

- [RabbitMQ Setup with Docker](#rabbitmq-setup-with-docker)
  - [Table of Contents](#table-of-contents)
  - [1. Why Run RabbitMQ in Docker?](#1-why-run-rabbitmq-in-docker)
  - [2. Basic Docker Run Command](#2-basic-docker-run-command)
  - [3. Accessing the Management UI](#3-accessing-the-management-ui)
  - [4. Persistent Data (Recommended)](#4-persistent-data-recommended)
  - [5. Docker Compose Alternative](#5-docker-compose-alternative)
  - [6. Stopping / Removing the Container](#6-stopping--removing-the-container)
  - [7. Troubleshooting](#7-troubleshooting)

---

## 1. Why Run RabbitMQ in Docker?

| Aspect            | Benefit                                        |
| ----------------- | ---------------------------------------------- |
| **Isolation**     | No Erlang or RabbitMQ dependencies on the host |
| **Portability**   | Same behaviour on any system with Docker       |
| **Clean removal** | Remove the container and everything is gone    |
| **Upgrades**      | Pull a newer image and restart                 |

The only required service is Docker itself – RabbitMQ’s dependencies (Erlang) are already inside the image.

---

## 2. Basic Docker Run Command

Run RabbitMQ with the **management plugin** enabled (provides a web UI):

```bash
docker run -d \
  --name rabbitmq \
  -p 5672:5672 \
  -p 15672:15672 \
  rabbitmq:4.0-management
```

**Explanation of options:**

| Option                    | Purpose                                                         |
| ------------------------- | --------------------------------------------------------------- |
| `-d`                      | Detached mode (runs in background).                             |
| `--name rabbitmq`         | Assigns a name to the container.                                |
| `-p 5672:5672`            | Maps the AMQP protocol port (used by clients).                  |
| `-p 15672:15672`          | Maps the Management UI HTTP port.                               |
| `rabbitmq:4.0-management` | Official RabbitMQ image with the management plugin pre‑enabled. |

> **💡 Tip:** The default login credentials for the management UI are `guest` / `guest`. These only work when connecting from `localhost`. For remote access, you must create a new user or modify the configuration.

---

## 3. Accessing the Management UI

1. Open your browser and go to: `http://localhost:15672`
2. Log in with:
   - **Username:** `guest`
   - **Password:** `guest`
3. You will see the RabbitMQ management dashboard – queues, exchanges, connections, etc.

> **⚠️ Note:** The `guest` user can only connect from `localhost` by default. To allow remote access, you need to create a custom user (see troubleshooting section).

---

## 4. Persistent Data (Recommended)

By default, RabbitMQ stores its data inside the container. When you remove the container, all queues, exchanges, and messages are lost. To persist data, attach a Docker volume or bind mount:

```bash
docker run -d \
  --name rabbitmq \
  -p 5672:5672 \
  -p 15672:15672 \
  -v rabbitmq_data:/var/lib/rabbitmq \
  rabbitmq:4.0-management
```

- `rabbitmq_data` is a named volume – data survives container removal.

To back up the volume:

```bash
docker run --rm -v rabbitmq_data:/data -v $(pwd):/backup alpine tar czf /backup/rabbitmq_backup.tar.gz -C /data .
```

---

## 5. Docker Compose Alternative

Create a `docker-compose.yml` file:

```yaml
services:
  rabbitmq:
    image: rabbitmq:4.0-management
    container_name: rabbitmq
    restart: unless-stopped
    ports:
      - '5672:5672'
      - '15672:15672'
    volumes:
      - rabbitmq_data:/var/lib/rabbitmq

volumes:
  rabbitmq_data:
```

Start with:

```bash
docker-compose up -d
```

---

## 6. Stopping / Removing the Container

Stop the container (data persists if you used a volume):

```bash
docker stop rabbitmq
```

Start it again:

```bash
docker start rabbitmq
```

Remove the container (data volume remains):

```bash
docker rm rabbitmq
```

Remove the volume as well (deletes all RabbitMQ data):

```bash
docker volume rm rabbitmq_data
```

---

## 7. Troubleshooting

| Problem                                   | Solution                                                                                                                                                                                                                                                                         |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `docker: command not found`               | Docker is not installed. Install it first.                                                                                                                                                                                                                                       |
| Port `5672` or `15672` already in use     | Change the host ports (e.g., `-p 5673:5672`).                                                                                                                                                                                                                                    |
| `guest` user cannot log in remotely       | Create a new admin user: `docker exec -it rabbitmq rabbitmqctl add_user myuser mypass` and `docker exec -it rabbitmq rabbitmqctl set_user_tags myuser administrator`. Then grant permissions: `docker exec -it rabbitmq rabbitmqctl set_permissions -p / myuser ".*" ".*" ".*"`. |
| Management UI not loading                 | Check that the container is running (`docker ps`). Ensure you are using the `management` tagged image.                                                                                                                                                                           |
| Data lost after container removal         | You did not use a volume. Add `-v rabbitmq_data:/var/lib/rabbitmq` next time.                                                                                                                                                                                                    |
| `rabbitmq:4.0-management` image not found | Pull it first: `docker pull rabbitmq:4.0-management`.                                                                                                                                                                                                                            |
| High memory usage                         | RabbitMQ uses memory for queues. Set a memory limit in Docker: `-m 512m`.                                                                                                                                                                                                        |

---

Your RabbitMQ message broker is now ready to use. Connect to it from your applications using `localhost:5672` and monitor it via the web UI on port `15672`.
