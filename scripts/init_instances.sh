#!/usr/bin/env bash
set -e

DATA_DIR=$1
PORT=$2

if [ -z "$DATA_DIR" ] || [ -z "$PORT" ]; then
  echo "Usage: $0 <data_directory> <port>"
  exit 1
fi

if [ -d "$DATA_DIR" ]; then
  echo "Data directory $DATA_DIR already exists, skipping initdb."
else
  initdb -D "$DATA_DIR"
  # Update port in postgresql.conf
  echo "port = $PORT" >> "$DATA_DIR/postgresql.conf"
fi

echo "Instance initialized at $DATA_DIR with port $PORT."
