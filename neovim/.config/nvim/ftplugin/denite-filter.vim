"acall jobstart('gxmessage "asdasd"')
"lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync() 

" lua require'cmp'.setup.buffer( { 
" \   completion = { 
" \           autocomplete = false,
" \           keyword_length = 100
" \       },
" \   experimental = {
" \           ghost_text = false
" \       },
" \   sources = { }
" \   } )

" au CompleteChanged <buffer> pclose
"
set buftype=prompt
call prompt_setprompt(bufnr(''), '')

source <sfile>:p:h/denite-common.vim

setlocal winblend=1
"setlocal signcolumn=no

inoremap <buffer> <leader><leader> <CR>
"imap <silent><buffer>
"\   <C-c> <Plug>(denite_filter_quit)
inoremap <silent><buffer>
\   <Esc> <Cmd>call denite#call_map('quit')<cr>

inoremap <silent><buffer> <leader>qa
\   <Cmd>call <SID>denite_quickfix()<cr>
inoremap <silent><buffer> <leader>a
\   <Cmd>call denite#call_map('toggle_select_all')<cr>

"inoremap <silent><buffer> <leader>x
"\   <Cmd>call denite#start([{'name': 'file/rec', 'args': []}])<cr>

inoremap <silent><buffer> <CR>
\   <Cmd>silent! call denite#call_map('do_action')<cr>
inoremap <silent><buffer> <leader><leader>
\   <Cmd>silent! call denite#call_map('do_action')<cr>

"open
inoremap <silent><buffer> <leader>q
\   <Cmd>silent! call denite#call_map('do_action', 'quickfix')<cr>
inoremap <silent><buffer> <leader>y
\   <Cmd>silent! call denite#call_map('do_action', 'yank')<cr>
inoremap <silent><buffer> <leader>r
\   <Cmd>silent! call denite#call_map('do_action', 'preview')<cr>
inoremap <silent><buffer> <leader>d
\   <Cmd>silent! call denite#call_map('do_action', 'vsplit')<cr>
inoremap <silent><buffer> <leader>s
\   <Cmd>silent! call denite#call_map('do_action', 'split')<cr>
inoremap <silent><buffer> <leader>f
\   <Cmd>silent! call denite#call_map('do_action', 'tabswitch')<cr>
inoremap <silent><buffer> <leader>t
\   <Cmd>silent! call denite#call_map('do_action', 'tabopen')<cr>

inoremap <silent><buffer> <localleader>d
\   <Cmd>silent! call denite#call_map('do_action', 'vsplitswitch')<cr>
inoremap <silent><buffer> <localleader>s
\   <Cmd>silent! call denite#call_map('do_action', 'splitswitch')<cr>

inoremap <silent><buffer> <leader>j
\   <Cmd>call denite#call_map('choose_action')<cr>

"matcher
inoremap <silent><buffer> <leader>aa
\   <Cmd>call denite#call_map('toggle_matchers', 'matcher/match_fuzzy')<cr>
inoremap <silent><buffer> <leader>as
\   <Cmd>call denite#call_map('toggle_matchers', 'matcher/substring')<cr>
inoremap <silent><buffer> <leader>ar
\   <Cmd>call denite#call_map('toggle_matchers', 'matcher/regexp')<cr>
inoremap <silent><buffer> <leader>af
\   <Cmd>call denite#call_map('toggle_matchers', 'matcher/fruzzy')<cr>
inoremap <silent><buffer> <leader>ap
\   <Cmd>call denite#call_map('toggle_matchers', 'matcher/project_files')<cr>
inoremap <silent><buffer> <leader>at
\   <Cmd>call denite#call_map('toggle_matchers', 'converter/devicons_denite_converter')<cr>

"sorter
inoremap <silent><buffer> <leader>sb
\   <Cmd>call denite#call_map('change_sorters', 'sorter/sublime')<cr>
inoremap <silent><buffer> <leader>sw
\   <Cmd>call denite#call_map('change_sorters', 'sorter/word')<cr>
inoremap <silent><buffer> <leader>sr
\   <Cmd>call denite#call_map('change_sorters', 'sorter/oldfiles')<cr>

inoremap <silent><buffer>
\   <C-n> <Cmd>call denite#increment_parent_cursor(1)<cr>
inoremap <silent><buffer>
\   <C-p> <Cmd>call denite#increment_parent_cursor(-1)<cr>
inoremap <silent><buffer>
\   <C-d> <Cmd>call denite#increment_parent_cursor(10)<cr>
inoremap <silent><buffer>
\   <C-u> <Cmd>call denite#increment_parent_cursor(-10)<cr>
