# ~/.bashrc

set -o vi
shopt -s autocd cdspell
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

export GTK_THEME="Adwaita:dark"
export ADW_DISABLE_PORTAL=1

PS1errcode () {
	local ecode=$?
	if [ $ecode -ne 0 ]; then
		echo -e " \e[31mfailed ($ecode)"
	fi
}

alias ls='ls --color=auto'
alias la='ls -lA'
alias grep='grep --color=auto'
alias vi='vim'

. .secret_aliases

PS1='\e[96m\h\e[95m\w$(PS1errcode)\e[m\n\$ '

