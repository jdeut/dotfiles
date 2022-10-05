declare -A hostcolor

hostcolor[mainbook]=250
hostcolor[tv]=207

export PROMPT="%B%(?.%F{46}%?%f.%F{red}%?%f) %B%F{14}%n%f%F{white}@%f%F{$hostcolor[$HOST]}%m%f:%F{blue}%~%f %F{14}%#%f %b"

export KEYTIMEOUT=0.3
export HISTSIZE=10000
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export SAVEHIST=10000
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export DIRSTACKSIZE=80
export PAGER="/usr/bin/less"
export MANPAGER=$PAGER
export MANWIDTH=80
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R'
export DESKTOP_SESSION=gnome
