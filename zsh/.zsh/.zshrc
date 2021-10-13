#
# Antigen setting

source "$ZDOTDIR/helper.zsh"

# set -x
zmodload zsh/zprof

autoload -Uz compinit
autoload -U colors 

# ZVM_INIT_MODE=sourcing

if [[ -n ${HOME}/.cache/.zsh/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

source_file "$ZDOTDIR/antigen.zsh"

#
# Alias
alias ls='ls --color=auto --group-directories-first'
alias lg='ls -gGhrt -w30'
alias vimr='tmux select-window -t ${USER}:1 ; vim --remote'
alias less="$PAGER"
alias zless="$PAGER"
alias qmv='qmv --format=destination-only'


#
# Zaw
zstyle ':filter-select' max-lines 10
zstyle ':filter-select' case-insensitive yes
zstyle ':filter-select' extended-search yes
zstyle ':filter-select:highlight' matched fg=green,standout
zstyle ':filter-select:highlight' selected fg=yellow,bold
# bindkey -M filterselect '^E' autosuggest-accept

# Terminal settings
# disable flow control when pressing ctrl-s
stty -ixon

#
# Options
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

#
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

#
# EXPORT

source_file "$ZDOTDIR/export.zsh"

