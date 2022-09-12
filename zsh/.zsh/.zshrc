zmodload zsh/zprof
# set -x

# HELPER
source "$ZDOTDIR/helper.zsh"
# EXPORT
source_file "$ZDOTDIR/loader/exports.zsh"

# set -x
# zmodload zsh/zprof

autoload -Uz compinit

if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit -d ${ZDOTDIR}/.zcompdump
else
	compinit -C
fi

autoload -U colors
setterm -linewrap on
#
# Zaw
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

# set +x

# STYLE
source_file "$ZDOTDIR/style/style.zsh"

# ANTIGEN
# `source_file` doesn't work for loading antigen
source "$ZDOTDIR/plugins.zsh"

# FUNCTIONS
source_file "$ZDOTDIR/loader/functions.zsh"
# Alias
source_file "$ZDOTDIR/alias.zsh"
# Last
source_file "$ZDOTDIR/last.zsh"
