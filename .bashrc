# ~/.bashrc

[[ $- != *i* ]] && return

set -o vi
shopt -s autocd cdspell

export GTK_THEME="Adwaita:dark"
export ADW_DISABLE_PORTAL=1

PS1errcode () {
	local ecode=$?
	if [ $ecode -ne 0 ]; then
		echo -e " \e[31mfailed ($ecode)"
	fi
}

alias ls='ls --color=auto'
alias la='ls -la'
alias grep='grep --color=auto'
alias vi='vim'

if [ -f .secret_aliases ]; then
	source .secret_aliases
fi

PS1='\e[96m\h\e[95m\w$(PS1errcode)\e[m\n\$ '

