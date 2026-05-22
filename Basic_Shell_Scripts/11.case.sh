#!/bin/sh

# Ask the user for input so they aren't staring at a blank screen
echo "Please enter environment (dev, uat, prod):"
read ENV

case "$ENV" in
    dev)
        DB_SERVER="dev-db.local"
        API_URL="https://dev-api.company.com"
        ;;
    uat)
        DB_SERVER="uat-db.company.internal"
        API_URL="https://uat-api.company.com"
        ;;
    prod)
        DB_SERVER="prod-db-cluster.company.com"
        API_URL="https://api.company.com"
        ;;
    *)
        # The '*' acts like an "else". It catches any invalid inputs.
        echo "Error: Invalid input! Use: dev, uat, or prod"
        exit 1
        ;;
esac

# 3. Print the results
echo "--- Running on environment: $ENV ---"
echo "Database: $DB_SERVER"
echo "API Endpoint: $API_URL"
