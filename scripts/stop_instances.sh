#!/usr/bin/env bash
set -e

DATA_DIR=$1

if [ -z "$DATA_DIR" ]; then
  echo "Usage: $0 <data_directory>"
  exit 1
fi

pg_ctl -D "$DATA_DIR" stop
echo "Instance stopped at $DATA_DIR."
