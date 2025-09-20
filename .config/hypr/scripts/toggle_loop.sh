#!/usr/bin/env bash

if playerctl loop | grep -q Track; then
	playerctl loop Playlist
	notify-send "Loop off"
else
	playerctl loop Track
	notify-send "Loop on"
fi
