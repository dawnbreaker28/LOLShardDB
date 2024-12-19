#!/usr/bin/env bash

set -e  # Exit immediately if a command exits with a non-zero status.

# Define paths
VALIDATE_SCRIPT="./validate.sh"
MAIN_SCRIPT="../src/main.py"

# Step 1: Validate Database Instances
echo "========================================"
echo "Step 1: Validating PostgreSQL Instances"
echo "========================================"

if [ -f "$VALIDATE_SCRIPT" ]; then
    bash "$VALIDATE_SCRIPT"
    echo "Validation completed successfully."
else
    echo "Error: Validation script not found at $VALIDATE_SCRIPT."
    exit 1
fi

# Step 2: Run Data Import Script
echo "========================================"
echo "Step 2: Running Data Import Script"
echo "========================================"

if [ -f "$MAIN_SCRIPT" ]; then
    cd ../src || exit 1  # Change to the src directory
    python main.py
    echo "Data import completed successfully."
else
    echo "Error: main.py not found at $MAIN_SCRIPT."
    exit 1
fi

echo "========================================"
echo "All Steps Completed Successfully!"
echo "========================================"
