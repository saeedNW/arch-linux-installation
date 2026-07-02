# Zookeeper & Kafka Setup with Docker

Zookeeper is a centralized service for configuration, naming, and distributed synchronization. Kafka is a distributed streaming platform for building real‑time data pipelines. Running them in Docker simplifies installation and keeps your host clean.

> **📝 Prerequisite:** Docker must be installed and running (see the [Docker installation guide](../containers/docker.md)).

---

## Table of Contents

- [Zookeeper \& Kafka Setup with Docker](#zookeeper--kafka-setup-with-docker)
  - [Table of Contents](#table-of-contents)
  - [1. Why Use Docker for Zookeeper \& Kafka?](#1-why-use-docker-for-zookeeper--kafka)
  - [2. Create a Dedicated Docker Network](#2-create-a-dedicated-docker-network)
  - [3. Run Zookeeper (with Persistent Data)](#3-run-zookeeper-with-persistent-data)
  - [4. Run Kafka (with Persistent Data)](#4-run-kafka-with-persistent-data)
  - [5. Verify the Setup](#5-verify-the-setup)
  - [6. Docker Compose (Recommended for Production)](#6-docker-compose-recommended-for-production)
  - [7. Stopping / Removing Containers](#7-stopping--removing-containers)
  - [8. Troubleshooting](#8-troubleshooting)

---

## 1. Why Use Docker for Zookeeper & Kafka?

| Aspect              | Benefit                                             |
| ------------------- | --------------------------------------------------- |
| **Isolation**       | No Java/Zookeeper/Kafka dependencies on the host.   |
| **Reproducibility** | Same environment everywhere.                        |
| **Easy updates**    | Pull a new image and restart.                       |
| **Clean removal**   | Delete containers and volumes – everything is gone. |

No extra services are required; Docker provides everything.

---

## 2. Create a Dedicated Docker Network

Placing both containers on the same user‑defined network allows them to communicate by container name and improves isolation.

```bash
docker network create kafka-net
```

---

## 3. Run Zookeeper (with Persistent Data)

```bash
docker run -d \
  --name zookeeper \
  --network kafka-net \
  -p 2181:2181 \
  -e ZOOKEEPER_CLIENT_PORT=2181 \
  -e ZOOKEEPER_TICK_TIME=2000 \
  -v zookeeper_data:/var/lib/zookeeper/data \
  -v zookeeper_log:/var/lib/zookeeper/log \
  confluentinc/cp-zookeeper:latest
```

**Explanation:**

| Option                                      | Purpose                                    |
| ------------------------------------------- | ------------------------------------------ |
| `--network kafka-net`                       | Attaches to the custom network.            |
| `-p 2181:2181`                              | Exposes Zookeeper client port to the host. |
| `-v zookeeper_data:/var/lib/zookeeper/data` | Persists Zookeeper state.                  |
| `-v zookeeper_log:/var/lib/zookeeper/log`   | Persists transaction logs.                 |

---

## 4. Run Kafka (with Persistent Data)

```bash
docker run -d \
  --name kafka \
  --network kafka-net \
  -p 9092:9092 \
  -p 29092:29092 \
  -e KAFKA_BROKER_ID=1 \
  -e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092,PLAINTEXT_HOST://localhost:29092 \
  -e KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT \
  -e KAFKA_INTER_BROKER_LISTENER_NAME=PLAINTEXT \
  -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
  -v kafka_data:/var/lib/kafka/data \
  confluentinc/cp-kafka:latest
```

**Explanation of key environment variables:**

| Variable                                 | Value                                                     | Purpose                                                          |
| ---------------------------------------- | --------------------------------------------------------- | ---------------------------------------------------------------- |
| `KAFKA_ZOOKEEPER_CONNECT`                | `zookeeper:2181`                                          | Tells Kafka how to reach Zookeeper (using the container name).   |
| `KAFKA_ADVERTISED_LISTENERS`             | `PLAINTEXT://kafka:9092,PLAINTEXT_HOST://localhost:29092` | Listeners for internal (container‑to‑container) and host access. |
| `KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR` | `1`                                                       | Single broker, so replication factor 1 is fine.                  |

> **💡 Tip:** Use `localhost:29092` from your host machine (e.g., in your application code). Use `kafka:9092` from other containers on the same network.

---

## 5. Verify the Setup

Check that both containers are running:

```bash
docker ps
```

Create a test topic:

```bash
docker exec -it kafka kafka-topics --create --topic test --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
```

Produce a message:

```bash
echo "Hello Kafka" | docker exec -i kafka kafka-console-producer --topic test --bootstrap-server localhost:9092
```

Consume the message:

```bash
docker exec -it kafka kafka-console-consumer --topic test --bootstrap-server localhost:9092 --from-beginning
```

You should see `Hello Kafka`.

---

## 6. Docker Compose (Recommended for Production)

Create a `docker-compose.yml` file:

```yaml
services:
  zookeeper:
    image: confluentinc/cp-zookeeper:latest
    container_name: zookeeper
    restart: unless-stopped
    ports:
      - '2181:2181'
    environment:
      ZOOKEEPER_CLIENT_PORT: 2181
      ZOOKEEPER_TICK_TIME: 2000
    volumes:
      - zookeeper_data:/var/lib/zookeeper/data
      - zookeeper_log:/var/lib/zookeeper/log

  kafka:
    image: confluentinc/cp-kafka:latest
    container_name: kafka
    restart: unless-stopped
    ports:
      - '9092:9092'
      - '29092:29092'
    environment:
      KAFKA_BROKER_ID: 1
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://kafka:9092,PLAINTEXT_HOST://localhost:29092
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
      KAFKA_INTER_BROKER_LISTENER_NAME: PLAINTEXT
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
    volumes:
      - kafka_data:/var/lib/kafka/data
    depends_on:
      - zookeeper

volumes:
  zookeeper_data:
  zookeeper_log:
  kafka_data:
```

Run with:

```bash
docker-compose up -d
```

---

## 7. Stopping / Removing Containers

Stop and remove containers (data volumes are preserved):

```bash
docker stop zookeeper kafka
docker rm zookeeper kafka
```

To remove the volumes as well (deletes all data):

```bash
docker volume rm zookeeper_data zookeeper_log kafka_data
```

---

## 8. Troubleshooting

| Problem                                              | Solution                                                                                      |
| ---------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `docker: command not found`                          | Docker not installed.                                                                         |
| Ports `2181`, `9092`, `29092` already in use         | Change the host port mapping (e.g., `-p 2182:2181`).                                          |
| Kafka cannot connect to Zookeeper                    | Ensure both containers are on the same network (`kafka-net`). Check with `docker logs kafka`. |
| `KAFKA_ZOOKEEPER_CONNECT` shows `Connection refused` | Start Zookeeper first, wait a few seconds, then start Kafka. Use `depends_on` in Compose.     |
| Data lost after container removal                    | You did not mount volumes. Add `-v` options as shown.                                         |
| Advertised listener misconfiguration                 | For host access, use `localhost:29092`. For other containers, use `kafka:9092`.               |

---

Your Kafka cluster is now ready to produce and consume streams. Use `localhost:29092` from your host applications.
