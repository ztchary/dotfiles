# ~/.bashrc

[[ $- != *i* ]] && return

set -o vi

export GTK_THEME="Adwaita:dark"
export ADW_DISABLE_PORTAL=1

PS1errcode () {
	local ecode=$?
	if [ $ecode -ne 0 ]; then
		echo -e "\033[31mfailed ($ecode)\033[0m"
	fi
}

alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -l'
alias grep='grep --color=auto'
alias vi='vim'

PS1='\033[96m\u\033[0m@\033[96m\h \033[95m\w\033[0m $(PS1errcode)\n\$ '

