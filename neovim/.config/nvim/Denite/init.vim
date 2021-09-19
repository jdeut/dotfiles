call denite#custom#option('_', {
\   'auto_resize':                 v:true,
\   'floating_preview':            v:true,
\   'empty':                       v:false, 
\   'immediately_1':               v:true,
\   'start_filter':                v:true,
\   'match_highlight':             v:true,
\   'preview_height':              8,
\   'filter_split_direction':      'floating',
\   'highlight_window_background': 'Folded',
\   'highlight_matched_range':     'DeniteHighlightMatchedRange',
\   'highlight_matched_char':      'DeniteHighlightMatchedChar',
\   'highlight_prompt':            'DeniteSignColumn',
\   'highlight_preview_line':      'Visual',
\   'highlight_filter_background': 'Folded',
\   'prompt':                      '$ ',
\   'source_names':                'short',
\   'split':                       'floating_relative_cursor',
\   'statusline':                  v:false,
\   'winrow':                      2,
\   'wincol':                      10,
\   'winminheight':                4,
\   'winheight':                   11,
\   'winwidth':                    89,
\   'vertical_preview':            v:false
\ })

function! s:denite_quickfix()
    "call jobstart('gxmessage "asdasd"')
    call denite#call_map('toggle_select_all')
    call denite#call_map('do_action', 'quickfix')
endfunction


function! s:custom_action_testthat(context)
    if exists('a:context["targets"][0]["word"]')
    " for denite dirmark.
        RSend Q
        execute 
\           "RSend devtools::test_file("
\               "'" . a:context['targets'][0]['word'] . "', "
\               "reporter = c('location', 'summary')"
\           ")"
    endif
endfunction


function! s:custom_action_manage_cases(context)
  " for denite dirmark.
    if exists('a:context["targets"][0]["word"]')
        RSend Q
        execute 
\           "RSend basename("
\                   "'" . a:context['targets'][0]['word'] . "'"
\           ") %>% basename() %>% "
    endif
endfunction

"-------------------------------------------------------------------
" Menus
"-------------------------------------------------------------------
let s:menus = {}
let s:menus.custom = {
\   'description': 'std',
\   'command_candidates': [
\       [
\           'EasyAlign',
\           'EasyAlign'
\       ],
\       [
\           'Set no highlight',
\           'set nohls'
\       ],
\       [
\           'Paste and decrypt (gpg -d)',
\           '%:FloatermNew --width=80 --height=40 gpg -d'
\       ]
\   ]
\ }
let s:menus.R = {
\   'description': 'std',
\   'command_candidates': [
\       [
\           'vdiffr::manage_cases',
\           'RSend vdiffr::manage_cases()'
\       ]
\   ]
\ }

"-------------------------------------------------------------------
" Custom Actions
"-------------------------------------------------------------------
call denite#custom#action(
\   'file',
\   'run-manage-cases',
\   function('s:custom_action_manage_cases')
\ )

call denite#custom#action(
\   'file,directory',
\   'runtestthatcase',
\   function('s:custom_action_testthat')
\ )

"-------------------------------------------------------------------
" Custom Aliases
"-------------------------------------------------------------------
call denite#custom#alias(
\   'source',
\   'file/rec/git/tracked',
\   'file/rec'
\ )

"call denite#custom#alias(
"\   'source',
"\   'file/rec/git/tracked',
"\   'file/rec'
"\ )

call denite#custom#alias(
\   'source',
\   'file/rec/git/modified',
\   'file/rec'
\ )

call denite#custom#alias(
\   'source',
\   'file/ttfiles',
\   'file/rec'
\ )

"-------------------------------------------------------------------
" Custom Var
"-------------------------------------------------------------------
call denite#custom#var(
\   'file/rec/git/tracked',
\   'command',
\   [
\       'dash', '-c', 
\       'git ls-files | xargs ls -t -1'
\   ]
\ )

call denite#custom#var(
\   'file/rec/git/modified',
\   'command',
\   [
\       'dash', '-c', 
\       'git ls-files --modified | xargs ls -t -1'
\   ]
\ )

call denite#custom#var(
\   'file/ttfiles', {
\   'command': [
\       'Rscript', 
\       '--no-init-file',
\       '-e', 
\       "library(testthat); testthat::find_test_scripts(testthat::test_path()) %>% paste0(collapse = '', sep = '\n') %>% cat"
\   ]}
\ )

call denite#custom#var(
\   'menu', 
\   'menus', 
\   s:menus
\ )

call denite#custom#var('grep', {
\   'command':        [ 'ag' ],
\   'default_opts':   [ '-i', '--vimgrep' ],
\   'recursive_opts': [  ],
\   'pattern_opt':    [  ],
\   'separator':      [ '--' ],
\   'final_opts':     [  ],
\ })

call denite#custom#var('buffer', 'only_modified', 0)
call denite#custom#var('buffer', 'exclude_filetypes', [''])
call denite#custom#var('buffer', 'date_format', '%H:%M %d-%m-%Y')

call denite#custom#filter(
\   'matcher/ignore_globs',
\   'ignore_globs', 
\   [ 
\       '__pycache__/',
\       'tags',
\       'packer_compiled.vim',
\       '.git/',
\       '*.png',
\       '*.pdf',
\       '*.jpg',
\       '*.csv',
\       '*.rds',
\       '*.Rproj',
\       '*.pdf',
\       '*.pdf',
\       '*.xcf',
\       '*.zip',
\       '*.gz',
\       '*.gnumeric',
\       '*.sch',
\       '*.db',
\       '*.sqlite',
\       'jqueryui-[0-9.]*/',
\       'bootstrap-[0-9.]*/',
\       'jquery-[0-9].*/',
\       'readthedown-[0-9.]*/',
\       'navigation-[0-9.]*/'
\   ]
\ )

call denite#custom#source(
\    'file,file/rec/git/tracked,file/rec/git/modified',
\    'matchers',
\    [
\       'matcher/fruzzy'
\    ]
\ )

call denite#custom#source(
\   'command_history,help',
\   'sorters', 
\   [
\       'sorter/rank'
\   ]
\ )

"call denite#custom#source(
"\   'file/old',
"\   'sorters', 
"\   [
"\       'sorter/oldfiles',
"\       'sorter/path'
"\   ]
"\ )

call denite#custom#source(
\   'file/old',
\   'converters', 
\   [
\       'converter/relative_abbr'
\   ]
\ )

call denite#custom#source(
\   'file,buffer,file/rec/git/tracked,file/rec/git/modified', 
\   'sorters', 
\   [
\       'sorter/oldfiles'
\   ]
\ )

call denite#custom#source(
\   'file/rec,buffer,file/rec/git/tracked,file/rec/git/modified',
\   'converters',
\   [
\       'devicons_denite_converter'
\   ]
\ )
