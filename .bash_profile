[[ -f ~/.bashrc ]] && . ~/.bashrc
if tty | grep -q tty1; then
	start-hyprland
	exit
fi

