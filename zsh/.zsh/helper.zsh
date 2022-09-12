function source_file() {
    if [[ -f "$1" ]] ; then
        source "$1"
    else
        echo "$1 does not exist"
    fi
}
