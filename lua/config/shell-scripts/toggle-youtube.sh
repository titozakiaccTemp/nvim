#!/bin/bash

WID=$(xdotool search --name "Zen Browser" | sed -n '1p')
# Check if the window ID was found
if [ -z "$WID" ]; then
	echo "Window not found!"
	exit 1
fi

xdotool key --window $WID space
