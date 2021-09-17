source <sfile>:p:h/r.vim

"lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync()

hi link rnowebDelimiter MyRnowebDelimiter

function! MyHook()
  "silent call system('xdotool windowactivate ' . g:xwindow_id . ' --sync')
endfunction

nmap <buffer> <LocalLeader>rq <Plug>RClose
imap <buffer> <LocalLeader>rq <Plug>RClose
vmap <buffer> <LocalLeader>rq <Plug>RClose

nmap <buffer> <LocalLeader>ce <Plug>RESendChunk

nmap <buffer> <LocalLeader>[[ <Cmd>call RnwPreviousChunk() <bar> normal zt<cr>
nmap <buffer> <LocalLeader>]] <Cmd>call RnwNextChunk() <bar> normal zt<cr>

nmap <silent><buffer> <LocalLeader>aa
\   :!latexmk -c %:r.tex<cr><Plug>RKnit<Plug>RMakePDFK

nmap <silent><buffer> <LocalLeader>af
\   :w<cr><Plug>RKnit
