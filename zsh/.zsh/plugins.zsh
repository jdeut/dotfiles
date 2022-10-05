ADOTDIR=$HOME/.antigen
ANTIGEN_LOG=/tmp/antigen.log

source "/usr/share/zsh-antigen/antigen.zsh"

#antigen use oh-my-zsh

antigen bundle kutsan/zsh-system-clipboard
antigen bundle zsh-users/zaw
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle Aloxaf/fzf-tab
antigen bundle mollifier/cd-gitroot
antigen bundle willghatch/zsh-cdr
antigen bundle m42e/zsh-histdb-fzf
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle larkery/zsh-histdb

antigen apply

_histdb_root=$ADOTDIR/bundles/larkery/zsh-histdb

for i in $_histdb_root/{sqlite-history,histdb-interactive}.zsh ; do
    source_file "$i"
done


# source use:"{sqlite-history,histdb-interactive}.zsh"
#
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi
#
# zplug load

