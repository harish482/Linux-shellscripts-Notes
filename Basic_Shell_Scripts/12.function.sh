#!/bin/bash

# NOTE: This script must be run as root (sudo) because it manages real services!

function StartService () {
    echo "⚙️ Attempting to start: $1..."  

    sudo systemctl start "$1" > /dev/null 2>&1
    
    sleep 1 

    if [ $? -eq 0 ]
    then
        echo "✅ $1 is now RUNNING."
    else
        echo "❌ ERROR: Failed to start $1!"
    fi
}

echo "=== STARTING SERVER SERVICES ==="

StartService "nginx"
StartService "ssh"
StartService "cron"

echo "=== SERVICE SEQUENCE COMPLETED ==="
