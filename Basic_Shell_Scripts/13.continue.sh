#!/bin/bash

# A list of months we need to process
MONTHS="Jan Feb Mar Apr May June July Aug Sept Oct Nov Dec"

for MONTH in $MONTHS
do
    echo "--------------------------------"
    echo "Checking schedule for: $MONTH"

    # IF the month is June, SKIP IT!
    if [ "$MONTH" == "June" ]
    then
        echo "⚠️ June is a Freeze Month! Skipping patches..."
        
        # 'continue' stops this turn immediately and jumps straight to July
        continue  
    fi

    echo "🚀 Starting server patches for $MONTH..."
    echo "✅ Patches successfully installed."

done
