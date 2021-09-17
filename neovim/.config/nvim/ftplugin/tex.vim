"lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync()
setlocal linebreak "breaks by word rather than character
setlocal formatprg=latexindent\ -m\ -rv
setlocal foldlevel=1
setlocal tabstop=3
setlocal shiftwidth=0
setlocal iskeyword+=:
setlocal conceallevel=0
setlocal iskeyword+=-
setlocal foldmethod=indent

let b:ftype_tex_build_dir = 'compiled'

let g:neoyank_disable = 1

au BufNewFile,BufRead *.cls set syntax=tex

"call vimtex#syntax#p#mycustom#load()

"let g:which_key_localleader_map['e'] = {
"\   'name' : '+vimtex'
"\ }
noremap <buffer> <localleader>ei <plug>(vimtex-info-full)

noremap <buffer> <localleader>em <plug>(vimtex-toggle-main)

"let g:which_key_localleader_map['g'] = {
"\   'name' : '+Format_Browser'
"\ }

noremap <silent><buffer> <LocalLeader>gt
\   <Cmd>execute "OpenBrowserSmartSearch -tex ".expand('<cword>')<CR>

"let g:which_key_localleader_map['l'] = {
"\   'name' : '+Compile'
"\ }

noremap <silent><buffer> <localleader>ll
\   :w<cr>:VimtexCompile<cr>

noremap <silent><buffer> <localleader>rr
\   :w<cr>:VimtexCompile<cr>

noremap <buffer> <localleader>rb <Cmd>lua require('plenary.job'):new({
\       command = 'zathura',
\       args = { 
\           [[--fork]],
\           vim.fn.expand('%:h') .. [[/]] .. vim.b.ftype_tex_build_dir .. [[/]] .. vim.fn.expand('%:t:r') .. [[.pdf]],
\       }
\ }):sync()<cr>

noremap <buffer> <localleader>lg <Cmd>lua x = vim.b.vimtex.compiler
\   vim.cmd("botright vsplit " .. x.root .. [[/]] .. x.build_dir .. [[/]] .. x.target:gsub(".tex$", ".log"))<CR>

noremap <buffer> <localleader><localleader>n <Cmd>lua x = vim.b.vimtex.compiler
\   vim.cmd([[DeniteProjectDir file -no-immediately-1 -relpath=texinputs]])<CR>

function! MyTexdocHandler(context)
    call vimtex#doc#make_selection(a:context)
    if !empty(a:context.selected)
        execute '!texdoc' a:context.selected '&'
    endif
    return 1
endfunction

let g:vimtex_syntax_nospell_comments             = 1
let g:vimtex_quickfix_autoclose_after_keystrokes = 3
let g:vimtex_quickfix_open_on_warning            = 0
let g:vimtex_text_obj_variant                    = 'vimtex'
let g:vimtex_motion_enabled                      = 1
let g:vimtex_view_forward_search_on_start        = 0
let g:vimtex_view_zathura_check_libsynctex       = v:false
let g:vimtex_syntax_enabled                      = 1
let g:tex_no_error                               = 1
let g:tex_flavor                                 = 'latex'
let g:vimtex_compiler_method                     = "latexmk"
let g:vimtex_fold_enabled                        = 0
let g:vimtex_compiler_progname                   = 'nvr'
let g:vimtex_syntax_conceal_default              = 0
let g:vimtex_view_method                         = 'zathura'
let g:vimtex_view_enabled                        = 1
let g:vimtex_view_automatic                      = 0
let g:vimtex_quicktex_open_on_warning            = 0
let g:vimtex_view_general_viewer                 = 'evince'
let g:vimtex_doc_handlers                        = ['MyTexdocHandler']
let g:vimtex_subfile_start_local                 = 0
"let g:vimtex_subfile_start_local = 1
"let g:vimtex_view_general_viewer = 'evince'

"let g:vimtex_syntax_custom_cmds = [
"\   { 'name': 'adjustbox', 'argstyle': 'ital' },
"\   { 'name': 'arraycolor', 'argstyle': 'ital' },
"\   { 'name': 'color', 'argstyle': 'ital' }
"\ ]

"let g:vimtex_syntax_conceal = {
"\   'accents': g:vimtex_syntax_conceal_default,
"\   'fancy': 1,
"\   'greek': g:vimtex_syntax_conceal_default,
"\   'math_bounds': g:vimtex_syntax_conceal_default,
"\   'math_delimiters': g:vimtex_syntax_conceal_default,
"\   'math_fracs': g:vimtex_syntax_conceal_default,
"\   'math_super_sub': g:vimtex_syntax_conceal_default,
"\   'math_symbols': g:vimtex_syntax_conceal_default,
"\   'styles': g:vimtex_syntax_conceal_default,
"\   'cites': g:vimtex_syntax_conceal_default,
"\ }

"let g:vimtex_syntax_packages = {
"\   'mycustom': {'load': 2},
"\   'hyperref': {'load': 2},
"\   'natbib': {'load': 2},
"\   'babel': {'conceal': g:vimtex_syntax_conceal_default},
"\   'biblatex': {'load': 2},
"\   'tikz': {'load': 2},
"\   'tcolorbox': {'load': 2},
"\ }


" let g:vimtex_complete_ref = { 
let g:vimtex_complete_ref = {
\   'custom_patterns': [
\       '^.*\subref{s*$'
\   ]
\ }
" 

" let g:vimtex_mappings_disable         = { 
let g:vimtex_mappings_disable         = {
\   'n': ['<localleader>ll']
\ }
" 

" let g:vimtex_grammar_textidote        = { 
let g:vimtex_grammar_textidote        = {
\   'jar': '/opt/textidote/textidote.jar',
\   'args': ''
\ }
" 

" let g:vimtex_fold_types               = { 
let g:vimtex_fold_types               = {
\   'cmd_single' : {
\       'cmds' : [
\           'ctikzset',
\           'pgfkeys',
\       ],
\   },
\   'comments' : {
\       'enabled' : 1
\   },
\   'sections' : {
\       'enabled' : 1,
\       'parse_levels' : 1,
\       'parts' : [
\           'section'
\       ],
\       'sections' : [
\           'chapter',
\           'section',
\           'subsection',
\           'paragraph',
\           'makenoteparagraph'
\       ]
\   },
\   'markers': {
\       'open': '',
\       'close': '',
\   }
\ }
" 

" let g:vimtex_quickfix_ignore_filters  = [ 
let g:vimtex_quickfix_ignore_filters  = [
\   'Underfull',
\   'Overfull',
\   'inputenc Warning',
\   'fontawesome5 Warning',
\   'everypage Warning',
\   'Package hyperref Warning',
\   'Package typearea Warning: Bad type area settings!',
\ ] 


" let g:vimtex_compiler_latexmk         = { 
let g:vimtex_compiler_latexmk         = {
\   'backend' : 'nvim',
\   'callback' : 0,
\   'continuous' : 0,
\   'options' : [
\       '-synctex=0',
\ ]}  
 " 

" let g:vimtex_syntax_nospell_commands = [ 
let g:vimtex_syntax_nospell_commands = [
\   'adjustbox',
\   'backgroundsetup',
\   'parskip',
\   'arraycolor',
\   'color',
\   'textcite',
\   'taburowcolors',
\   'texttt',
\   'vphantom',
\   'subfile',
\   'tabularx',
\   'cmidrule',
\   'matrix',
\   'newadjustimage',
\   'node',
\   'KOMAoptions',
\   'automark',
\   'defaultfontfeatures',
\   'setmainfont',
\   'sisetup',
\   'theadalign',
\   'addparagraphcolumntypes',
\   'cellspacetoplimit',
\   'cellspacebottomlimit',
\   'aboverulesep',
\   'belowrulesep',
\   'AtBeginEnvironment',
\   'setlist',
\   'usetikzlibrary',
\   'forestset',
\   'usebibmacro',
\   'printnames',
\   'printfield',
\   'usebibmacro',
\   'ifnameundef',
\   'value',
\   'tcbuselibrary',
\   'colorlet',
\   'rowcolors',
\   'arabic',
\   'lightgray',
\   'defbibheading',
\   'addcontentsline',
\   'nameref',
\   'addcontentsline',
\   'DeclareLanguageMapping',
\   'definecolor',
\   'hypersetup',
\   'setkomafont',
\   'DeclareTOCStyleEntry',
\   'RedeclareSectionCommand',
\   'pagestyle',
\   'newlist',
\   'tcbset',
\   'newtcolorbox',
\   'ifpackageloaded',
\   'definecolorseries',
\   'resetcolorseries',
\   'pgfkeys',
\   'fontspec',
\   'bracketset',
\   'hypersetup',
\   'addfontfeature',
\   'etocsetstyle',
\   'etocsetnexttocdepth',
\   'pagecolor',
\   'forestoption',
\   'setlength',
\   'cellcolor',
\   'color',
\   'setbeamertemplate',
\   'newcolumntype'
\ ]
