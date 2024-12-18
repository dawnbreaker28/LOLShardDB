#!/usr/bin/env bash
set -e

# Stop existing instances if they exist
pg_ctl -D $HOME/sql/lol/5432 stop || true
pg_ctl -D $HOME/sql/lol/5433 stop || true

# Initialize and start PostgreSQL instances
./init_instances.sh $HOME/sql/lol/5432 5432 
./init_instances.sh $HOME/sql/lol/5433 5433 
./start_instances.sh $HOME/sql/lol/5432 5432 "$PWD/../logs/5432.log"
./start_instances.sh $HOME/sql/lol/5433 5433 "$PWD/../logs/5433.log"

# Initialize databases
./init_db.sh 5432
./init_db.sh 5433

# Import schema into both instances
SCHEMA_FILE="../config/schema.sql"

if [ -f "$SCHEMA_FILE" ]; then
    echo "Importing schema into database on port 5432..."
    psql -h localhost -p 5432 -U postgres -d lol -f "$SCHEMA_FILE"

    echo "Importing schema into database on port 5433..."
    psql -h localhost -p 5433 -U postgres -d lol -f "$SCHEMA_FILE"
else
    echo "Schema file not found at $SCHEMA_FILE. Skipping schema import."
fi

# Import data
# ./import_data.sh

echo "All steps completed successfully!"
