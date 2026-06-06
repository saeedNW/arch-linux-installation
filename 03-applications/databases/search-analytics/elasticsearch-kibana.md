# Elasticsearch & Kibana Setup with Docker

Elasticsearch is a distributed search and analytics engine, and Kibana is its visualisation front‑end. Running both in Docker provides an isolated, reproducible environment.

> **📝 Prerequisite:** Docker must be installed and running (see the [Docker installation guide](../../development/containers/docker.md)). These instructions are for **local development**; do not use them for production deployments.

---

## Table of Contents

- [Elasticsearch \& Kibana Setup with Docker](#elasticsearch--kibana-setup-with-docker)
  - [Table of Contents](#table-of-contents)
  - [1. Why Docker for Elasticsearch \& Kibana?](#1-why-docker-for-elasticsearch--kibana)
  - [2. System Prerequisite: Increase `vm.max_map_count`](#2-system-prerequisite-increase-vmmax_map_count)
  - [3. Create a Dedicated Docker Network](#3-create-a-dedicated-docker-network)
  - [4. Run Elasticsearch with Persistent Storage](#4-run-elasticsearch-with-persistent-storage)
  - [5. Run Kibana and Connect to Elasticsearch](#5-run-kibana-and-connect-to-elasticsearch)
  - [6. Docker Compose (Recommended)](#6-docker-compose-recommended)
  - [7. Access Kibana and Log In](#7-access-kibana-and-log-in)
  - [8. Stopping / Removing Containers](#8-stopping--removing-containers)
  - [9. Uninstalling](#9-uninstalling)
  - [10. Troubleshooting](#10-troubleshooting)

---

## 1. Why Docker for Elasticsearch & Kibana?

| Aspect              | Benefit                                              |
| ------------------- | ---------------------------------------------------- |
| **Isolation**       | No Elasticsearch or Kibana dependencies on the host. |
| **Reproducibility** | Same configuration everywhere.                       |
| **Easy updates**    | Pull a new image and restart.                        |
| **Clean removal**   | Delete containers and volumes – no leftovers.        |

No extra services are required – Docker provides everything.

---

## 2. System Prerequisite: Increase `vm.max_map_count`

Elasticsearch uses memory mapping (mmap) and requires the host’s `vm.max_map_count` kernel setting to be at least `262144`.

Check the current value:

```bash
sysctl vm.max_map_count
```

**Temporary change** (lost after reboot):

```bash
sudo sysctl -w vm.max_map_count=262144
```

**Permanent change** (survives reboots):

1. Open `/etc/sysctl.conf` with `sudo nano /etc/sysctl.conf`.
2. Add the following line:

   ```plaintext
   vm.max_map_count = 262144
   ```

3. Save and reboot.

After changing the value, restart the Docker container.

---

## 3. Create a Dedicated Docker Network

Place both containers on the same network so they can communicate by container name.

```bash
docker network create elastic
```

---

## 4. Run Elasticsearch with Persistent Storage

Bind a volume to `/usr/share/elasticsearch/data` to preserve your indices and data when the container is stopped.

**Create a data directory on the host:**

```bash
sudo mkdir -p /opt/elasticsearch
sudo chown $USER:$USER /opt/elasticsearch   # or use a Docker named volume
```

**Start Elasticsearch:**

```bash
docker run -d \
  --name elastic \
  --network elastic \
  -p 9200:9200 \
  -v /opt/elasticsearch:/usr/share/elasticsearch/data \
  -e "discovery.type=single-node" \
  -it -m 1GB \
  docker.elastic.co/elasticsearch/elasticsearch:8.16.0
```

**Explanation of options:**

| Option                                                | Purpose                                                   |
| ----------------------------------------------------- | --------------------------------------------------------- |
| `--network elastic`                                   | Attaches to the custom network.                           |
| `-p 9200:9200`                                        | Exposes the Elasticsearch HTTP API port.                  |
| `-v /opt/elasticsearch:/usr/share/elasticsearch/data` | Mounts a host directory for persistent data.              |
| `-e "discovery.type=single-node"`                     | Runs a single-node cluster (recommended for development). |
| `-e "xpack.security.enabled=false"` _(optional)_      | Disables security for simpler setup (not for production). |
| `-m 1GB`                                              | Sets a memory limit.                                      |

> **💡 Tip:** To use a Docker named volume instead of a host directory, replace `-v /opt/elasticsearch:/usr/share/elasticsearch/data` with `-v elastic_data:/usr/share/elasticsearch/data`. Docker will automatically manage the storage.

---

## 5. Run Kibana and Connect to Elasticsearch

```bash
docker run -d \
  --name kibana \
  --network elastic \
  -p 5601:5601 \
  -e ELASTICSEARCH_HOSTS=http://elastic:9200 \
  docker.elastic.co/kibana/kibana:8.16.0
```

**Explanation:**

| Option                                       | Purpose                                                              |
| -------------------------------------------- | -------------------------------------------------------------------- |
| `--network elastic`                          | Same network as Elasticsearch.                                       |
| `-p 5601:5601`                               | Exposes the Kibana web interface.                                    |
| `-e ELASTICSEARCH_HOSTS=http://elastic:9200` | Tells Kibana where to find Elasticsearch (using the container name). |

> **💡 Tip:** You can also provide the Elasticsearch URL via the environment variable `ELASTICSEARCH_URL`.

---

## 6. Docker Compose (Recommended)

Using Docker Compose is simpler and ensures consistent configuration. Create a `docker-compose.yml` file:

```yaml
services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.16.0
    container_name: elastic
    restart: unless-stopped
    ports:
      - '9200:9200'
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=false # disable security for local dev
    volumes:
      - elastic_data:/usr/share/elasticsearch/data
    mem_limit: 1g
    networks:
      - elastic

  kibana:
    image: docker.elastic.co/kibana/kibana:8.16.0
    container_name: kibana
    restart: unless-stopped
    ports:
      - '5601:5601'
    environment:
      - ELASTICSEARCH_HOSTS=http://elasticsearch:9200
    networks:
      - elastic
    depends_on:
      - elasticsearch

networks:
  elastic:
    driver: bridge

volumes:
  elastic_data:
```

Run with:

```bash
docker-compose up -d
```

---

## 7. Access Kibana and Log In

1. Open your browser and go to `http://localhost:5601`.
2. When using the security‑enabled image (default), the first startup prints a login token and an auto‑generated password for the `elastic` user.
   - Retrieve the password with:

     ```bash
     docker exec -it elastic bin/elasticsearch-reset-password -u elastic
     ```

   - Use that password and the username `elastic` to log in.

3. If you disabled security (`xpack.security.enabled=false`), no login is required.

---

## 8. Stopping / Removing Containers

Stop containers (data persists):

```bash
docker stop elastic kibana
```

Start them again:

```bash
docker start elastic kibana
```

Remove containers (volumes remain):

```bash
docker rm elastic kibana
```

Remove the volume (deletes all data):

```bash
docker volume rm elastic_data
```

---

## 9. Uninstalling

**Remove the Elasticsearch data directory:**

```bash
sudo rm -rf /opt/elasticsearch
```

**Remove Docker volumes (if used):**

```bash
docker volume rm elastic_data
```

**Remove the containers (if they still exist):**

```bash
docker rm -f elastic kibana
```

**Remove the Docker network (optional):**

```bash
docker network rm elastic
```

---

## 10. Troubleshooting

| Problem                                                        | Solution                                                                                                                                                                                                    |
| -------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `docker: command not found`                                    | Docker is not installed. Install it first.                                                                                                                                                                  |
| `max virtual memory areas vm.max_map_count [65530] is too low` | Increase `vm.max_map_count` as described in [Section 2](#2-system-prerequisite-increase-vmmax_map_count).                                                                                                   |
| Elasticsearch fails to start with memory error                 | Increase the memory limit (`-m 2GB`) or allocate more memory in Docker Desktop settings.                                                                                                                    |
| Kibana cannot connect to Elasticsearch                         | Ensure both containers are on the same network (`docker network inspect elastic`) and that `ELASTICSEARCH_HOSTS` uses the correct container name and port.                                                  |
| Port `9200` or `5601` already in use                           | Change the host‑side port mapping (e.g., `-p 9201:9200`).                                                                                                                                                   |
| Data lost after container removal                              | You used a volume. Did you delete the volume? Data is preserved unless the volume is removed.                                                                                                               |
| Kibana asks for an enrollment token                            | This happens when security is enabled. Run `docker exec -it elastic bin/elasticsearch-create-enrollment-token -s kibana` inside the Elasticsearch container to generate a token, then paste it into Kibana. |
| `xpack.security.enabled` cannot be changed after first run     | The setting is persistent. To disable security, you must re‑create the container without the volume, or edit `elasticsearch.yml` inside the container.                                                      |

---

Your Elasticsearch and Kibana stack is now ready for searching and visualising data.
