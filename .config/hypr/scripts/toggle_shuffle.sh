#!/usr/bin/env bash

if playerctl shuffle | grep -q On; then
	notify-send "Shuffle off"
else
	notify-send "Shuffle on"
fi
playerctl shuffle toggle
