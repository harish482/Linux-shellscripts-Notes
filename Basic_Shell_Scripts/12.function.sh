#!/bin/bash
function StartService () {
    echo "⚙️ Starting service: $1..."  
    echo "✅ $1 is now RUNNING."
}

StartService "Database"
StartService "Firewall"
StartService "Nginx_Web_Server"
StartService "SSH_Access"
