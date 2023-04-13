" let g:vimtex_syntax_packages = {
" \   'hyperref': {'load': 2},
" \   'mycustom': {'load': 2}
" \   'natbib': {'load': 2},
" \   'babel': {'conceal': 0},
" \   'biblatex': {'load': 2},
" \   'tikz': {'load': 2},
" \   'tcolorbox': {'load': 2}
" \ }
"lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync()
"breaks by word rather than character

function! MyHandler(context)
    call vimtex#doc#make_selection(a:context)
    if !empty(a:context.selected)
        execute 'silent !texdoc' a:context.selected '&'
    endif
    return 1
endfunction

au BufNewFile,BufRead *.cls set syntax=tex

"call vimtex#syntax#p#mycustom#load()
"
augroup vimtex_event_4
    au!
    au User VimtexEventViewReverse call jobstart(['run-raise-bridge.sh', 'nvim'], {'detach': v:true })
    au User VimtexEventViewReverse normal! zMzvzz
    au User VimtexEventViewReverse normal! zR
    " au User VimtexEventViewReverse call jobstart(['gxmessage', 'hui'], {'detach': v:true })
augroup END

let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
\ 'build_dir' : 'compiled',
\ 'callback' : 1,
\ 'continuous' : 0,
\ 'exeutable' : 'latexmk',
\ 'hooks' : [],
\ 'options' : [
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--noraise --unique file:@pdf#src:@line@tex'
let g:vimtex_view_forward_search_on_start = 1

" let g:vimtex_view_general_viewer                 = 'zathura'
" let g:vimtex_view_zathura_check_libsynctex       = v:true
let g:vimtex_view_enabled        = 1
let g:vimtex_view_method         = 'general'
let g:vimtex_view_automatic      = 1
let g:vimtex_imaps_enabled       = 0

let g:tex_no_error                               = 1
let g:vimtex_syntax_enabled                      = 1
let g:vimtex_syntax_nospell_comments             = 1
let g:vimtex_quickfix_autoclose_after_keystrokes = 3
let g:vimtex_quickfix_open_on_warning            = 0
let g:vimtex_text_obj_variant                    = 'vimtex'
let g:vimtex_motion_enabled                      = 1
let g:vimtex_fold_enabled                        = 0
let g:vimtex_quicktex_open_on_warning            = 0
let g:vimtex_doc_handlers                        = ['MyHandler']
let g:vimtex_subfile_start_local                 = 1
" let g:vimtex_subfile_start_local                 = 0
" let g:vimtex_syntax_conceal_default              = 0
" let g:vimtex_doc_handlers                        = ['MyTexdocHandler']
"let g:vimtex_view_general_viewer = 'evince'
" let g:vimtex_compiler_progname                   = 'nvr'

hi link texCFrametitleArg VimtexFrametitle
hi link texCSubfileArg VimtexFrametitle


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

let g:vimtex_fold_types = {
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

let g:vimtex_syntax_custom_cmds = [
\  { 'name' : 'adjustbox', 'argspell' : 0 },
\  { 'name' : 'directlua', 'argspell' : 0 },
\  { 'name' : 'addtobeamertemplate', 'argspell' : 0 },
\  { 'name' : 'ctikzset', 'argspell' : 0 },
\  { 'name' : 'ctikzsetstyle', 'argspell' : 0 },
\  { 'name' : 'text', 'argspell' : 0 },
\  { 'name' : 'backgroundsetup', 'argspell' : 0 },
\  { 'name' : 'parskip', 'argspell' : 0 },
\  { 'name' : 'arraycolor', 'argspell' : 0 },
\  { 'name' : 'color', 'argspell' : 0 },
\  { 'name' : 'textcite', 'argspell' : 0 },
\  { 'name' : 'taburowcolors', 'argspell' : 0 },
\  { 'name' : 'texttt', 'argspell' : 0 },
\  { 'name' : 'vphantom', 'argspell' : 0 },
\  { 'name' : 'subfile', 'argspell' : 0 },
\  { 'name' : 'tabularx', 'argspell' : 0 },
\  { 'name' : 'cmidrule', 'argspell' : 0 },
\  { 'name' : 'matrix', 'argspell' : 0 },
\  { 'name' : 'newadjustimage', 'argspell' : 0 },
\  { 'name' : 'node', 'argspell' : 0 },
\  { 'name' : 'rowcolor', 'argspell' : 0 },
\  { 'name' : 'NiceTabular', 'argspell' : 0 },
\  { 'name' : 'NiceTabularX', 'argspell' : 0 },
\  { 'name' : 'KOMAoptions', 'argspell' : 0 },
\  { 'name' : 'automark', 'argspell' : 0 },
\  { 'name' : 'defaultfontfeatures', 'argspell' : 0 },
\  { 'name' : 'setmainfont', 'argspell' : 0 },
\  { 'name' : 'sisetup', 'argspell' : 0 },
\  { 'name' : 'theadalign', 'argspell' : 0 },
\  { 'name' : 'addparagraphcolumntypes', 'argspell' : 0 },
\  { 'name' : 'cellspacetoplimit', 'argspell' : 0 },
\  { 'name' : 'cellspacebottomlimit', 'argspell' : 0 },
\  { 'name' : 'aboverulesep', 'argspell' : 0 },
\  { 'name' : 'belowrulesep', 'argspell' : 0 },
\  { 'name' : 'AtBeginEnvironment', 'argspell' : 0 },
\  { 'name' : 'setlist', 'argspell' : 0 },
\  { 'name' : 'usetikzlibrary', 'argspell' : 0 },
\  { 'name' : 'forestset', 'argspell' : 0 },
\  { 'name' : 'usebibmacro', 'argspell' : 0 },
\  { 'name' : 'printnames', 'argspell' : 0 },
\  { 'name' : 'printfield', 'argspell' : 0 },
\  { 'name' : 'usebibmacro', 'argspell' : 0 },
\  { 'name' : 'ifnameundef', 'argspell' : 0 },
\  { 'name' : 'value', 'argspell' : 0 },
\  { 'name' : 'tcbuselibrary', 'argspell' : 0 },
\  { 'name' : 'colorlet', 'argspell' : 0 },
\  { 'name' : 'rowcolors', 'argspell' : 0 },
\  { 'name' : 'arabic', 'argspell' : 0 },
\  { 'name' : 'lightgray', 'argspell' : 0 },
\  { 'name' : 'defbibheading', 'argspell' : 0 },
\  { 'name' : 'addcontentsline', 'argspell' : 0 },
\  { 'name' : 'nameref', 'argspell' : 0 },
\  { 'name' : 'addcontentsline', 'argspell' : 0 },
\  { 'name' : 'DeclareLanguageMapping', 'argspell' : 0 },
\  { 'name' : 'definecolor', 'argspell' : 0 },
\  { 'name' : 'hypersetup', 'argspell' : 0 },
\  { 'name' : 'setkomafont', 'argspell' : 0 },
\  { 'name' : 'DeclareTOCStyleEntry', 'argspell' : 0 },
\  { 'name' : 'RedeclareSectionCommand', 'argspell' : 0 },
\  { 'name' : 'pagestyle', 'argspell' : 0 },
\  { 'name' : 'newlist', 'argspell' : 0 },
\  { 'name' : 'tcbset', 'argspell' : 0 },
\  { 'name' : 'newtcolorbox', 'argspell' : 0 },
\  { 'name' : 'ifpackageloaded', 'argspell' : 0 },
\  { 'name' : 'definecolorseries', 'argspell' : 0 },
\  { 'name' : 'resetcolorseries', 'argspell' : 0 },
\  { 'name' : 'pgfkeys', 'argspell' : 0 },
\  { 'name' : 'fontspec', 'argspell' : 0 },
\  { 'name' : 'bracketset', 'argspell' : 0 },
\  { 'name' : 'hypersetup', 'argspell' : 0 },
\  { 'name' : 'addfontfeature', 'argspell' : 0 },
\  { 'name' : 'etocsetstyle', 'argspell' : 0 },
\  { 'name' : 'etocsetnexttocdepth', 'argspell' : 0 },
\  { 'name' : 'pagecolor', 'argspell' : 0 },
\  { 'name' : 'forestoption', 'argspell' : 0 },
\  { 'name' : 'setlength', 'argspell' : 0 },
\  { 'name' : 'cellcolor', 'argspell' : 0 },
\  { 'name' : 'color', 'argspell' : 0 },
\  { 'name' : 'setbeamertemplate', 'argspell' : 0 },
\  { 'name' : 'newcolumntype', 'argspell' : 0},
\  { 'name' : 'RealisticCapacitor', 'argspell' : 0 },
\  { 'name' : 'xusebox', 'argspell' : 0, 'argstyle' : 'ital' }
\ ]
