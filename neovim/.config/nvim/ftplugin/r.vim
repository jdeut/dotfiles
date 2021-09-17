"lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync() 
"au FileType rnoweb exe "normal ßrf\<CR>"

setlocal foldenable
setlocal foldmethod=expr
setlocal spell
setlocal isfname-={,}

"let g:which_key_localleader_map['r'] = {
"\   'name' : '+diverse'
"\ }


nmap <buffer> <LocalLeader>rf <Plug>RStart
imap <buffer> <LocalLeader>rf <Plug>RStart
vmap <buffer> <LocalLeader>rf <Plug>RStart

nmap <buffer> <LocalLeader>rs <Plug>RStop
imap <buffer> <LocalLeader>rs <Plug>RStop
vmap <buffer> <LocalLeader>rs <Plug>RStop

nmap <buffer> <LocalLeader>rq <Plug>RClose
imap <buffer> <LocalLeader>rq <Plug>RClose
vmap <buffer> <LocalLeader>rq <Plug>RClose

nmap <buffer> <LocalLeader>aa <Plug>RSendFile

nmap <buffer> <LocalLeader>rh <Plug>RHelp

"let g:which_key_localleader_map['j'] = {
"\   'name' : '+diverse'
"\ }

noremap <silent><buffer> <LocalLeader>jgw
\   <Cmd>DeniteCursorWord -highlight-matched-char=None grep::--r<CR>
noremap <silent><buffer> <LocalLeader>jr
\  j<Cmd>Denite file/rec:R<CR>
noremap <silent><buffer> <LocalLeader>jt
\   <Cmd>Denite -buffer-name=ttfiles -no-start-filter file/ttfiles<CR>
noremap <silent><buffer> <LocalLeader>jgg
\   <Cmd>Denite -highlight-matched-char=None grep::--r<CR>
noremap <silent><buffer> <LocalLeader>jm
\   <Cmd>Denite -winwidth=50 -wincol=2 -quick-move=immediately menu:R<cr>

"let g:which_key_localleader_map['t'] = {
"\   'name' : '+test'
"\ }

noremap <silent><buffer> <LocalLeader>tt
\   <Cmd>RSend Q<CR>:w<CR>:RTestPackage<cr>

function! MySendFileToR(arg_fpath, sargs)
    if !filereadable(a:arg_fpath)
        call RWarningMsg('Error: "' . a:arg_fpath . '" doesnt exist')
        return
    endif

    let flines = readfile(a:arg_fpath)

    let fpath = a:arg_fpath . ".tmp.R"

    if filereadable(fpath)
        call RWarningMsg('Error: cannot create "' . fpath . '" because it already exists. Please, delete it.')
        return
    endif

    call writefile(flines, fpath, "s")

    if !filereadable(fpath)
        call RWarningMsg('Error: file not written:.' . fpath)
        return
    endif

    let ok = g:SendCmdToR('nvimcom:::source.and.clean("' . fpath . '", echo=TRUE)')
endfunction

let R_auto_start      = 2
let R_debug           = 0
let R_hl_term         = 1
let R_texerr          = 1
let R_args            = []
let R_bracketed_paste = 1
let Rout_more_colors  = 1
let R_hi_fun_paren    = 1
let R_hi_fun_globenv  = 2
let R_hi_fun          = 1
let R_applescript     = 0
let R_nvim_wd         = 1    " set working directory of r to vim's working dir
let R_help_w          = 80
let R_texerr          = 1
let R_synctex         = 0
let R_openhtml        = 1
let R_clear_line      = 1
let r_syntax_folding  = 0
let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk  = 1
let R_cmd             = 'R'
let R_app             = 'radian'
let R_pdfviewer       = 'zathura'
let R_nvimpager       = 'vertical'
let R_latex_build_dir = 'compiled'
let R_latexcmd        = ['latexmk']
let R_tmpdir          = '/tmp/R_tmp_dir'
let R_compldir        = '~/.cache/Nvim-R/Compl/'
let R_buffer_opts     = 'winfixwidth nobuflisted winwidth=10'
let R_cite_pattern    = '\\\(parencite\|textcite\|textcites\)\S*{'
let R_user_maps_only  = 1
"let R_nvimcom_home    = '~/.cache/Nvim-R/Nvimcom'
"let R_args_in_stline = 1
"let R_after_start = ['! tmux move-pane -b -s Primary:1.1 -t Secondary:1']

"lua 
"\   if packer_plugins["Nvim-R"] and packer_plugins['Nvim-R'].loaded then
"\       vim.g.R_source = 
"\           packer_plugins['Nvim-R'].path .. '/R/tmux_split.vim'
"\   else
"\       print('ERROR setting up nvim-r')
"\   end

"let R_source = '~/.config/dein.vim/repos/github.com/jalvesaq/Nvim-R/R/tmux_split.vim'

"packer_plugins['Nvim-R'].path .. '/R/tmux_split.vim'

let R_disable_cmds = [
\   'RMakePDFKb',
\   'RMakeAll',
\   'RMakeHTML',
\   'RMakeWord',
\   'RMakeODT',
\   'RSendLine',
\ ]
