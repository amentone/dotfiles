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

	if [ -f $VS_config/settings.json ]; then
		echo "$VS_config/settings.json: OK"
		if [ -f $syncconf ]; then
			echo "$syncconf: OK"
			sed -i "/token/c \"token\":\"$token\"," $syncconf/syncLocalSettings.json
			echo "VSCodium: sync settings imported!"
		fi
		if [ -f $gistconf ]; then
			echo "$gistconf: OK"
			sed -i -e "/{/r $gistconf" $VS_config/settings.json
			echo "VSCodium: gist settings imported!"
		else
			echo "Check if $gistconf exists and the read permission is granted!"
		fi
	else
		echo "Check if $VS_config/settings.json exists and the read permission is granted!"
	fi
fi
