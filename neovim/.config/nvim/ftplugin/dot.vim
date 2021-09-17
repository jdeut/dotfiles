noremap <buffer> <LocalLeader>lv
\   :silent !xdg-open %<.pdf<CR>

noremap <buffer> <LocalLeader>ll
\   :silent !dot -Tpdf % > %<.pdf<CR>
