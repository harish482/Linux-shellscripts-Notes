#!/bin/bash
# Keep looping as long as the user answers 'yes'
ANSWER="yes"

while [ "$ANSWER" == "yes" ]
do
    echo "The server is running smoothly..."
    read -p "Keep monitoring? (yes/no): " ANSWER
done
