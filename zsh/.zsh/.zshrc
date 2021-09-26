# more or less interactive shell configuration

# Antigen setting ❰❰❰

autoload -U compinit colors 

compinit -d "$HOME/.cache/.zsh/zcompdump"

ADOTDIR=$HOME/.antigen

source '/usr/share/zsh-antigen/antigen.zsh'

#antigen use oh-my-zsh

FZF_FINDER_BINDKEY='^F'

antigen bundles <<EOBUNDLES 
    Aloxaf/fzf-tab
    zsh-users/zsh-autosuggestions
    mollifier/cd-gitroot
    willghatch/zsh-cdr
    zsh-users/zaw
    zsh-users/zsh-syntax-highlighting
    jeffreytse/zsh-vi-mode
EOBUNDLES

#antigen theme michelebologna
antigen apply
# ❱❱❱

# Alias ❰❰❰
alias ls='ls --color=auto --group-directories-first'
alias lg='ls -gGhrt -w30'
alias vimr='tmux select-window -t ${USER}:1 ; vim --remote'
alias less="$PAGER"
alias zless="$PAGER"
alias qmv='qmv --format=destination-only'
# ❱❱❱

# Zaw ❰❰❰
zstyle ':filter-select' max-lines 10
zstyle ':filter-select' case-insensitive yes
zstyle ':filter-select' extended-search yes
zstyle ':filter-select:highlight' matched fg=green,standout
zstyle ':filter-select:highlight' selected fg=yellow,bold

# bindkey -M filterselect '^E' autosuggest-accept
# ❱❱❱

# Terminal settings ❰❰❰
# disable flow control when pressing ctrl-s
stty -ixon
# ❱❱❱

# Options ❰❰❰
setopt extendedglob
setopt autocd
#setopt termguicolors

# Completion
setopt list_ambiguous
# Pushd
setopt pushd_ignore_dups
# Reloads the history whenever you use it
setopt share_history
# prevent histroy from recording duplicates
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_find_no_dups
setopt hist_save_no_dups
# ❱❱❱

# Key Bindings
function zvm_after_init() {
    FZF_TMUX=0
    source $ZDOTDIR/fzf/fzf.zsh
    # source $ZDOTDIR/fzf/completion.zsh

    # remove conflicting key bindings
    bindkey -rM viins '^R'

    zvm_bindkey vicmd '^O' fzf-cdr
    zvm_bindkey viins '^O' fzf-cdr

    zvm_bindkey vicmd '^R' fzf-history-widget
    zvm_bindkey viins '^R' fzf-history-widget
    
    zvm_bindkey vicmd '^f' fzf-cd-widget
    zvm_bindkey viins '^f' fzf-cd-widget
}


function zvm_after_lazy_keybindings() {

    zvm_bindkey filterselect '^[' send-break

    # zvm_bindkey vicmd ']r' fzf-history-widget
    # zvm_bindkey viins ']r' fzf-history-widget


    # zvm_bindkey vicmd ']l' "ddilg^M"
    # zvm_bindkey viins ']l' "^[ddilg^M"

    #zvm_bindkey viins '\\\\' '^v\\'
    #bindkey -M viins -s '#' 'asdasdasd'
}

###
### EXPORT
###

export PAGER="/usr/bin/less"
export MANPAGER=$PAGER
export MANWIDTH=80
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R'
export DESKTOP_SESSION=gnome
export IDF_PATH=~/iot/esp/esp-idf

eval $($HOME/.local/bin/luarocks --lua-version 5.3 path)
#export LUA_PATH=";;/usr/share/lua/?/luarocks/;$(lua5.3 /usr/bin/luarocks path --lr-path)"
#export LUA_CPATH="$(lua5.3 /usr/bin/luarocks path --lr-cpath)"
#export LUA_CPATH="$(luarocks path --lr-cpath)"
# ----------------------------------------------------------------------------
# ZSH
export HISTFILE=$HOME/.zsh_history
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# set VIMODE according to the current mode (default “[i]”)
export PROMPT="%B%F{yellow}%?%f %B%n:%~ %# %b"
export ZVM_KEYTIMEOUT=0.3
export KEYTIMEOUT=0.3
export ZVM_CURSOR_STYLE_ENABLED=true
export HISTSIZE=10000
export SAVEHIST=10000
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export DIRSTACKSIZE=80
# ----------------------------------------------------------------------------
# FZF
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=60%
export FZF_DEFAULT_OPTS='--margin=0,1,1,1 --ansi --bind "ctrl-y:execute(wl-copy {})"'
#FZF_CTRL_R_OPTS='--margin=5 --bind "alt-enter:execute(bash -c {})+execute(sleep 5)+abort"'
# ----------------------------------------------------------------------------
# PERL
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

