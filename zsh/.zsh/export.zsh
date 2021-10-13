
export PAGER="/usr/bin/less"
export MANPAGER=$PAGER
export MANWIDTH=80
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R'
export DESKTOP_SESSION=gnome

export IDF_PATH=~/iot/esp/esp-idf

export LUAROCKS=/usr/bin/luarocks
export LUAROCKS_LOCAL=$HOME/.local/bin/luarocks

for i in "5.1" "5.2" "5.3"; do

    if which lua$i >/dev/null 2>&1; then

        if lua$i $LUAROCKS > /dev/null 2>&1 ; then
            # echo GLOBAL $i
            LUA_LIBDIR_CPATH=$(lua$i $LUAROCKS config --lua-libdir)/lua
            LUA_CPATH="$LUA_CPATH;$LUA_LIBDIR_CPATH"
            #
            eval "LUA_PATH_${i:s/\./_/}=\"\$LUA_PATH_${i:s/\./_/};$(lua$i $LUAROCKS path --lr-path)\""
            eval "LUA_CPATH_${i:s/\./_/}=\"\$LUA_CPATH_${i:s/\./_/};$(lua$i $LUAROCKS path --lr-cpath)\""
        fi

        if [[ -x $LUAROCKS_LOCAL ]] ; then
            LUA_LIBDIR_CPATH_LOCAL=$($LUAROCKS_LOCAL --lua-version $i config --lua-libdir)/lua
            LUA_CPATH="$LUA_CPATH;$LUA_LIBDIR_CPATH_LOCA"

            # echo LOCAL $LUA_CPATH
 
            eval "LUA_PATH_${i:s/\./_/}=\"\$LUA_PATH_${i:s/\./_/};$($LUAROCKS_LOCAL --local --lua-version $i path --lr-path)\""
            eval "LUA_CPATH_${i:s/\./_/}=\"\$LUA_CPATH_${i:s/\./_/};$($LUAROCKS_LOCAL --local --lua-version $i path --lr-cpath)\""
        fi
        #
        # A=$($LUAROCKS --lua-version $i path --lr-path)
        # B=$($LUAROCKS_LOCAL --lua-version $i path --lr-path)
        #
        # echo $i $A
        # echo $i $B
        #

        eval "LUA_PATH_${i:s/\./_/}=\"\$LUA_PATH_${i:s/\./_/};./?.lua\""
        eval "LUA_CPATH_${i:s/\./_/}=\"\$LUA_CPATH_${i:s/\./_/};./?.so\""

        export "LUA_CPATH_${i:s/\./_/}"
        export "LUA_PATH_${i:s/\./_/}"


        # if [[ -d "$LUA_DIR/$i" ]]; then
        #     echo "_LUA_PATH_OLD=\${LUA_PATH_${i:s/\./_/}:+;\$LUA_PATH_${i:s/\./_/}}"
        #     eval "_LUA_PATH_OLD=\${LUA_PATH_${i:s/\./_/}:+;\$LUA_PATH_${i:s/\./_/}}"
        #     LUA_PATH_5_1="$LUA_DIR/$i/?.lua"
        # fi
        #
        # if [[ -d "$LUA_LIBDIR_CPATH/$i" ]]; then
        #     echo "_LUA_CPATH_OLD=\${LUA_CPATH_${i:s/\./_/}:+;\$LUA_CPATH_${i:s/\./_/}}"
        #     export "_LUA_CPATH_OLD=\${LUA_CPATH_${i:s/\./_/}:+;\$LUA_CPATH_${i:s/\./_/}}"
        #     eval "LUA_CPATH_${i:s/\./_/}=\"$LUA_LIBDIR_CPATH/$i/?.so${_LUA_CPATH_OLD}\""
        # fi
    fi
done
# eval $($LUAROCKS --lua-version 5.3 path --append)
# LUA_CPATH="$LUA_LIBDIR_CPATH;$LUA_CPATH"
#export LUA_PATH=";;/usr/share/lua/?/luarocks/;$(lua5.3 /usr/bin/luarocks path --lr-path)"
#export LUA_CPATH="$(lua5.3 /usr/bin/luarocks path --lr-cpath)"
#export LUA_CPATH="$(luarocks path --lr-cpath)

# 
# ZSH
export HISTFILE=$HOME/.zsh_history
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#
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

#
# FZF
export FZF_TMUX=1
export FZF_FINDER_BINDKEY='^F'
export FZF_TMUX_HEIGHT=60%
export FZF_DEFAULT_OPTS='--margin=0,1,1,1 --ansi --bind "ctrl-y:execute(wl-copy {})"'
#FZF_CTRL_R_OPTS='--margin=5 --bind "alt-enter:execute(bash -c {})+execute(sleep 5)+abort"'

#
# PERL
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

