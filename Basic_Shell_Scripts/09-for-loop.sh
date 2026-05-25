#!/bin/bash

for server in "Server-A" "Server-B" "Server-C" "Server-D" "Server-E"
do
    echo "Checking $server..."
    if [ "$server" == "Server-C" ]
    then
        echo "❌ ALERT: $server is broken!"
        break 
    fi
    echo "✅ $server is running fine."
done
