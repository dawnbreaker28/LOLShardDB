#!/usr/bin/env bash
set -e

# Configuration variables
DB_USER="postgres"      # The database superuser for connection
DB_HOST="localhost"
DB_PORT=$1
DB_NAME="lol"   # The database name to create
SCHEMA_FILE="../config/DELETE_ME_schema.sql" # The schema file to be applied

# Check if psql is available
if ! command -v psql >/dev/null 2>&1; then
    echo "Error: psql command not found. Please ensure PostgreSQL client tools are installed."
    exit 1
fi

echo "Checking database connection..."
if ! psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -c "\q" 2>/dev/null; then
    echo "Error: Unable to connect to PostgreSQL. Check if the service is running and credentials are correct."
    exit 1
fi

# Check if the database already exists
DB_EXIST=$(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -tAc "SELECT 1 FROM pg_database WHERE datname='$DB_NAME';")
if [ "$DB_EXIST" = "1" ]; then
    echo "Database '$DB_NAME' already exists. Skipping creation."
else
    echo "Creating database '$DB_NAME'..."
    createdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$DB_NAME"
fi

# Apply the schema if the file exists
if [ -f "$SCHEMA_FILE" ]; then
    echo "Applying schema from $SCHEMA_FILE..."
    psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f "$SCHEMA_FILE"
else
    echo "Schema file not found at $SCHEMA_FILE. Skipping schema creation."
fi

echo "Initialization completed."
