#!/bin/bash

sudo yum install nginx cron* -y

function StartService () {
    echo "⚙️ Attempting to start: $1..."  
    
    # 1. Run the systemctl command
    systemctl start "$1" > /dev/null 2>&1
    
    # 2. CRITICAL: Save the result immediately into a variable!
    STATUS=$?
    
    # 3. Take our real-time pause
    sleep 1 
    
    # 4. Check the SAVED variable instead of $?
    if [ $STATUS -eq 0 ]
    then
        echo "✅ $1 is now RUNNING."
    else
        echo "❌ ERROR: Failed to start $1 (Service might not exist)!"
    fi
    echo "----------------------------------------"
}

echo "=== STARTING SERVER SERVICES ==="
StartService "nginx"
StartService "sshd"
StartService "crond"
echo "=== SERVICE SEQUENCE COMPLETED ==="
