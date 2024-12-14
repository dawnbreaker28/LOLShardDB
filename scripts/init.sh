#!/usr/bin/env bash
set -e

# Stop existing instances if they exist
pg_ctl -D $HOME/sql/lol/5432 stop || true
pg_ctl -D $HOME/sql/lol/5433 stop || true

./init_instances.sh $HOME/sql/lol/5432 5432 
./init_instances.sh $HOME/sql/lol/5433 5433 
./start_instances.sh $HOME/sql/lol/5432 5432 "$PWD/../logs/5432.log"
./start_instances.sh $HOME/sql/lol/5433 5433 "$PWD/../logs/5433.log"
./init_db.sh 5432
./init_db.sh 5433
./import_data.sh

echo "All steps completed successfully!"
