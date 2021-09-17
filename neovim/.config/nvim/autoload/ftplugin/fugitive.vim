function ftplugin#fugitive#close()
    if winnr() == 1 
        if tabpagenr() != tabpagenr('$')
            close
            tabprevious
        else
            close
        endif
    else
        close
    endif
endfunction


