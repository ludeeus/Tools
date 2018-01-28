#!/bin/bash
# require JQ, run 'sudo apt install jq'

read -p "Enter the version number: " VERSION
echo "Verifying milestones..."
MILESTONES=$(curl https://api.github.com/search/issues\?q\=milestone:v$VERSION+$
if [ ! "$MILESTONES" ]; then
        echo "No milestones... aborting..."
        exit
fi

rm hassbian_config_$VERSION.md
echo "**$VERSION**  " | tee -a hassbian_config_$VERSION.md
echo "$MILESTONES" | tee -a hassbian_config_$VERSION.md
