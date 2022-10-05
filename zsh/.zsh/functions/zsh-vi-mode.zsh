#
# Key Bindings

function zvm_after_init() {
    FZF_TMUX=0

    # remove conflicting key bindings
    bindkey -rM viins '^R'

    zvm_bindkey vicmd '^O' fzf-cdr
    zvm_bindkey viins '^O' fzf-cdr

    zvm_bindkey vicmd '^R' histdb-fzf-widget
    zvm_bindkey viins '^R' histdb-fzf-widget

    zvm_bindkey vicmd '^F' fzf-cd-widget
    zvm_bindkey viins '^F' fzf-cd-widget

    zvm_bindkey vicmd '^T' _histdb-isearch main
    zvm_bindkey viins '^T' _histdb-isearch main

    zvm_bindkey viins '^V' edit-command-line
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
