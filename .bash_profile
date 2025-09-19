[[ -f ~/.bashrc ]] && . ~/.bashrc
if tty | grep -q tty1; then
	hyprland
	exit
fi

