#!/usr/bin/env bash

# Exit on error
set -e

# Variables for PostgreSQL connection
DB_HOST="localhost"       # Host where PostgreSQL is running
DB_PORT="5432"            # PostgreSQL port
DB_USER="postgres"        # PostgreSQL username
DB_NAME="lol"             # Target database name
SQL_FILE="../test/sample.sql" # Path to the SQL file to run

# Check if the SQL file exists
if [ ! -f "$SQL_FILE" ]; then
    echo "Error: SQL file '$SQL_FILE' does not exist."
    exit 1
fi

# Run the SQL script
echo "Running SQL script: $SQL_FILE on database: $DB_NAME"
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f "$SQL_FILE"

# Confirm execution
if [ $? -eq 0 ]; then
    echo "SQL script executed successfully!"
else
    echo "Error running SQL script."
fi
