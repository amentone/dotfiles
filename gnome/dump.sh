#!/bin/bash

if ! type /usr/bin/dconf > /dev/null; then
    echo "dconf command not found"
    exit 1
fi

/usr/bin/dconf dump / > gnome_settings.backup
