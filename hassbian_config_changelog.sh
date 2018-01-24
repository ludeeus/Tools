[ -f /usr/bin/jq ] || echo "jq missing, run 'sudo apt install jq'" && exit

read -p "Enter the version number: " VERSION
echo "Verifying milestones..."
MILESTONES=$(curl https://api.github.com/search/issues\?q\=milestone:v$VERSION+type:pr+repo:home-assistant/hassbian-scripts | jq -r '.items[]| "[#" +(.number|tostring) +"](" + .html_url + ") " + .title + " [@" + (.user | .login + "](" + .html_url + ")  ")')
if [ ! "$MILESTONES" ]; then
	echo "No milestones... aborting..."
	exit
fi

rm hassbian_config_$VERSION.md
echo "**$VERSION**  " | tee -a hassbian_config_$VERSION.md
echo "$MILESTONES" | tee -a hassbian_config_$VERSION.md
