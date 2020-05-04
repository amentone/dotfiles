#!/bin/bash

if ! type /usr/bin/dconf > /dev/null; then
    echo "Error: dconf command not found!"
    exit 1
fi

conf=$1

if [ -f $conf ]; then
    /usr/bin/dconf load / < $conf
else
    echo "Error: no such configuration file!"
fi
