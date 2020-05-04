#i!/bin/bash

if ! type codium > /dev/null; then
  echo "VSCodium: command not found, check if the program has been installed!"
else
	codium --install-extension Shan.code-settings-sync
	if [[ $# -eq 0 && -z "$1" ]]; then
	    echo "Missed token argument!"
		exit 1
	fi

	token=$1
	VS_config=~/.config/VSCodium/User
	gistconf=gist.conf
	syncconf=syncLocalSettings.json

	if [ ! -f $VS_config/settings.json ]; then
		echo -e "{\n}" > $VS_config/settings.json
	fi
	echo "$VS_config/settings.json: OK"
	
	
	if [ -f $syncconf ]; then
		cp $syncconf $VS_config/
		echo "$syncconf: OK"
	else 
		echo "Error: $syncconf doesn't exist!"
		if [ ! -f $VS_config/syncLocalSettings.json ]; then
			echo "Error: $VS_config/syncLocalSettings.json doesn't exist!"
			exit 1
		fi
	fi

	sed -i "/token/c \"token\":\"$token\"," $VS_config/syncLocalSettings.json
	echo "VSCodium: sync settings imported!"

	if [ -f $gistconf ]; then
		echo "$gistconf: OK"
		sed -i -e "/{/r $gistconf" $VS_config/settings.json
		echo "VSCodium: gist settings imported!"
	else
		echo "Check if $gistconf exists and the read permission is granted!"
		exit 1
	fi
fi
