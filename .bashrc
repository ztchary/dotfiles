set -o vi
shopt -s cdspell autocd
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

export GTK_THEME="Adwaita:dark"
export ADW_DISABLE_PORTAL=1

PS1errcode() {
	local ecode=$?
	if [ $ecode -ne 0 ]; then
		echo -e " \e[92m$ecode"
	fi
}

PS1='\e[96m\h\e[95m$PWD$(PS1errcode)\e[m\n$ '

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export EDITOR='nvim'
export VISUAL='nvim'
export TERM='xterm-256color'
export COLORTERM='truecolor'

alias vim='nvim'
alias vi='nvim'

. ~/.bash_aliases

