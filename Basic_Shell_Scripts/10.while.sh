#!/bin/bash

while true
do
    if ping -c 1 google.com > /dev/null 2>&1
    then
        echo "✅ Google is online!"
    else
        echo "❌ Internet is DOWN!"
        break
    fi
done
