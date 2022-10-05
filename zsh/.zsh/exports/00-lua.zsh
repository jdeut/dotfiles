export LUAROCKS=luarocks
export LUAROCKS_LOCAL=luarocks

function _luarocks() {
    $LUAROCKS --lua-version $@
}

for i in "5.1" "5.2" "5.3" "5.4"; do

    echo HHHH
    # echo $_LUA_PATH
    # echo $_LUA_CPATH

    echo ---------------------------------------------------

    if which lua$i >/dev/null 2>&1; then

        _LUA_PATH=
        _LUA_CPATH=

        if _luarocks $i > /dev/null 2>&1 ; then
            _LUA_PATH="$(_luarocks $i path --lr-path)"
            _LUA_CPATH="$(_luarocks $i path --lr-cpath)"
        fi

        # if [[ -x $LUAROCKS_LOCAL ]] ; then
        #     # LUA_LIBDIR_CPATH_LOCAL=$($LUAROCKS_LOCAL --lua-version $i config --lua-libdir)/lua
        #     # LUA_CPATH="$LUA_CPATH;$LUA_LIBDIR_CPATH_LOCAL"
        #
        #     # echo LOCAL $LUA_CPATH
        #
        #     _LUA_PATH="$_LUA_PATH;$(_luarocks $i --local path --lr-path)"
        #     _LUA_CPATH="$_LUA_CPATH;$(_luarocks $i --local path --lr-cpath)"
        # fi

        VAR_LUA_PATH="LUA_PATH_${i:s/\./_/}"
        VAR_LUA_CPATH="LUA_CPATH_${i:s/\./_/}"

        eval "export ${VAR_LUA_PATH}=\"$_LUA_PATH;./?.lua;/home/johannes/.local/share/lua/$i/?.lua\""
        eval "export ${VAR_LUA_CPATH}=\"$_LUA_CPATH;./?.so;/home/johannes/.local/lib/lua/$i/?.so\""

        # echo ${$VAR_LUA_PATH}
        # echo ${$VAR_LUA_CPATH}
    fi
done

# export LUA_PATH_5_3="$LUA_PATH_5_3;/home/johannes/.local/share/lua/5.3/?.lua"
# export LUA_CPATH_5_3="$LUA_CPATH_5_3;/home/johannes/.local/lib/lua/5.3/?.so"

# eval $($LUAROCKS --lua-version 5.3 path --append)
# LUA_CPATH="$LUA_LIBDIR_CPATH;$LUA_CPATH"
#export LUA_PATH=";;/usr/share/lua/?/luarocks/;$(lua5.3 /usr/bin/luarocks path --lr-path)"
#export LUA_CPATH="$(lua5.3 /usr/bin/luarocks path --lr-cpath)"
#export LUA_CPATH="$(luarocks path --lr-cpath)

