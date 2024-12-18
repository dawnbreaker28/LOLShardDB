#!/usr/bin/env bash
set -e

# Configuration
DB_USER="postgres"            # Database username
DB_NAME="lol"                 # Database name
PORTS=(5432 5433)             # List of ports to validate
EXPECTED_TABLES=("players" "teams" "matches" "playerstats" "champions" "teamhistory") # Expected tables

# Function to validate schema for a specific instance
validate_schema() {
    PORT=$1
    echo "Validating schema on port $PORT..."

    # Query the information_schema for table names
    RESULT=$(psql -h localhost -p $PORT -U $DB_USER -d $DB_NAME -tAc \
        "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';")

    # Validate if all expected tables exist
    for table in "${EXPECTED_TABLES[@]}"; do
        if [[ $RESULT != *"$table"* ]]; then
            echo "Error: Table '$table' is missing on port $PORT."
            exit 1
        fi
    done

    echo "Schema validation successful on port $PORT. Tables found:"
    echo "$RESULT"
}

# Loop through all ports and validate schema
for PORT in "${PORTS[@]}"; do
    validate_schema $PORT
done

echo "Schema validation completed successfully for all instances!"
