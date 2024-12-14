#!/usr/bin/env bash
set -e

DATA_DIR=$1
PORT=$2
LOGFILE=$3

if [ -z "$DATA_DIR" ] || [ -z "$PORT" ] || [ -z "$LOGFILE" ]; then
  echo "Usage: $0 <data_directory> <port> <logfile>"
  exit 1
fi

pg_ctl -D "$DATA_DIR" -l "$LOGFILE" start -o "-p $PORT"
echo "Instance started at $DATA_DIR on port $PORT."
