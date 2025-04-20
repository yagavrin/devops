#!/bin/bash

BASE_PORT=7000
BUS_PORT_OFFSET=10000
CONF_DIR="./conf"

echo "Create Redis Cluster config files..."

for i in $(seq 0 8); do
  PORT=$((BASE_PORT + i))
  BUS_PORT=$((PORT + BUS_PORT_OFFSET))
  NODE_DIR="${CONF_DIR}/${PORT}"

  mkdir -p "$NODE_DIR"

  cat > "${NODE_DIR}/redis.conf" <<EOF
port ${PORT}
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
appendonly yes
cluster-announce-ip redis-${PORT}
cluster-announce-port ${PORT}
cluster-announce-bus-port ${BUS_PORT}
EOF

  echo "Config created: ${NODE_DIR}/redis.conf"
done

echo "All configs are done!"
