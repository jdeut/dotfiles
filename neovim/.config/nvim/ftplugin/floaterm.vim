if ! exists('b:floaterm_name')
    let b:floaterm_name = ''
endif

if b:floaterm_name ==# "browse_git_dirs"
    silent! tnoremap <buffer> ;i <C-d>
    silent! tnoremap <buffer> ;f <Cmd>let b:floaterm_opener="tabnew"<Cr><C-f>
    silent! tnoremap <buffer> ;o <Cmd>let b:floaterm_opener="edit"<Cr><C-o>
    silent! tnoremap <buffer> ;n <C-n>
    silent! tnoremap <buffer> ;<Space> <C-Space>
endif
