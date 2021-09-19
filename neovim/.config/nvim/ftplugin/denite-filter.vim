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
" source <sfile>:p:h/denite-common.vim

setlocal winblend=1

