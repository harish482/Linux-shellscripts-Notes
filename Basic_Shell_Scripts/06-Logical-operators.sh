#!/bin/bash

THRESHOLD=90

echo "--- Gathering Real-Time Storage Metrics ---"

# 1. Grab the current usage percentage for critical partitions 
# (df -h parses disk space, awk extracts just the percentage number)
ROOT_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
VAR_USAGE=$(df /var | awk 'NR==2 {print $5}' | tr -d '%')
BOOT_USAGE=$(df /boot | awk 'NR==2 {print $5}' | tr -d '%')

echo "Root (/) Partition Usage:      $ROOT_USAGE%"
echo "/var Partition Usage:          $VAR_USAGE%"
echo "/boot Partition Usage:         $BOOT_USAGE%"
echo "----------------------------------------"


if [[ "$ROOT_USAGE" -lt "$THRESHOLD" && "$VAR_USAGE" -lt "$THRESHOLD" && "$BOOT_USAGE" -lt "$THRESHOLD" ]]; then
    echo "✅ HEALTH CHECK PASSED: All storage partitions are well within safe limits."
    exit 0
else
    echo "🚨 ALERT: One or more storage partitions have exceeded the ${THRESHOLD}% safety threshold!"
    echo "Action required: Clean up log files or expand disk volume immediately."
    exit 1
fi
