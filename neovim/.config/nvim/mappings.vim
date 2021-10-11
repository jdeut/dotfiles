"══════════════════════════════════════════════════
" Denite und so => <Leader>;;* 
"\   file/rec/git/modified<CR>

"vnoremap <silent> <leader><leader>a
"\   l<ESC>`<""y`>:execute "Denite -input=" . @" . " -buffer-name=files file/rec/git/tracked"<CR>

"vnoremap <silent> <leader><leader>g
"\   l<ESC>`<""y`>:execute "Denite -input=" . @" . " grep "<CR>

" nnoremap <silent> <leader><leader>f
" \   <Cmd>Denite -source-names=hide
" \   -winwidth=80 -winheight=6 floaterm<cr>
"
" tnoremap <silent> <leader><leader>f
" \   <Cmd>Denite -source-names=hide
" \   -winwidth=80 -winheight=6 floaterm<cr>


"══════════════════════════════════════════════════
" Look_and_Feel => <Leader>d* 

" nnoremap <silent> <leader>dfc
" \   :let &l:foldopen = (&l:foldclose == 'all') ? '' : 'all' <bar>
" \   :let &l:foldclose = (&l:foldclose == 'all') ? '' : 'all' <bar>
" \   if &l:foldclose == 'all' <bar> execute "normal zM" <bar>
" \   else <bar> execute "normal zR" <bar> endif <cr>
"
" nnoremap <silent> <leader>dfo
" \   :let &l:foldopen = (&l:foldopen == 'all') ? '' : 'all' <bar>
" \   if &l:foldopen == '' <bar> execute "normal zM" <bar>
" \   endif <bar> set foldopen? <cr>

"══════════════════════════════════════════════════
" Favorites 
"══════════════════════════════════════════════════
" Global Mappings 

map <C-1> <Plug>(dial-increment)
map <C-2> <Plug>(dial-decrement)
vmap <C-1> <Plug>(dial-increment)
vmap <C-2> <Plug>(dial-decrement)
map <C-3> <Plug>(dial-decrement-additional)

tnoremap <ScrollWheelUp>     <C-\><C-n><C-b>
tnoremap <2-ScrollWheelUp>   <C-\><C-n><C-b>
tnoremap <3-ScrollWheelUp>   <C-\><C-n><C-b>
tnoremap <4-ScrollWheelUp>   <C-\><C-n><C-b>
tnoremap <ScrollWheelDown>   <C-\><C-n><C-f>
tnoremap <2-ScrollWheelDown> <C-\><C-n><C-f>
tnoremap <3-ScrollWheelDown> <C-\><C-n><C-f>
tnoremap <4-ScrollWheelDown> <C-\><C-n><C-f>

" tnoremap <C-v> <C-\><C-n>"+pi

"inoremap <expr> <Tab>
"\   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab>
"\   pumvisible() ? "\<PageDown>" : compe#complete()
"inoremap <expr> <C-Tab>
"\   pumvisible() ? "\<C-p>" : compe#complete()

"inoremap <silent><expr> <M-Shift-Tab> pumvisible() ? "\<PageUp>" : ""
"inoremap <expr> <S-d> pumvisible() ? "\<PageUp>" : "\<S-d>"
"inoremap <expr> <S-f> pumvisible() ? "\<PageDown>" : "\<S-f>"

cnoremap <C-k> <Right>
cnoremap <C-j> <Left>
cnoremap ;; <cr>

    " Normal mode command(s) go… --v <-- here
    "cnoremap <C-w> <S-Right>

"cnoremap <C-h> <Left>
"cnoremap <C-l> <Right>
"cnoremap <C-Space> <S-Left>
"cnoremap <C-j> <CR>

noremap! 'o ö
noremap! 'u ü
noremap! 'a ä
noremap! '- ß
noremap! ''o Ö
noremap! ''u Ü
noremap! ''a Ä

noremap! ''9 ❰
noremap! ''0 ❱

noremap 'c C
noremap 'd D
noremap 'y Y
noremap 'a A
noremap 'i I
noremap 'o O
noremap 'g G

" noremap <Space> :
noremap! <C-k> <Left>
noremap! <C-l> <Right>

"snoremap <silent> <C-f> <Cmd>call UltiSnips#JumpForwards()<CR>

"inoremap <silent><expr> <C-f> pumvisible() ?
"\   "<C-e><C-\><C-o>:call Ulti_ExpandOrJump_and_getRes()<cr>" : ""

"inoremap <silent><expr> <C-j> pumvisible() ? 
"\   "<C-e><C-\><C-o>:call Ulti_ExpandOrJump_and_getRes()<cr>" : ""

"inoremap <silent><expr> <C-y> pumvisible() ?
"\   "<C-\><C-o>:call compe#close('<C-e>')<cr><C-y>" : "<C-y>"

"inoremap <silent><expr> <C-e> pumvisible() ?
"\   compe#close('<C-e>') : 
"\   "<C-e><C-\><C-o>:call compe#close('<C-e>')<cr>"

"inoremap <silent><expr> <CR> compe#confirm('<CR>')
"inoremap <silent><expr> <C-e> compe#close('<C-e>')
"inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
"inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })
"
"return g:ulti_expand_or_jump_res
noremap vv V

noremap! <C-9> ❰
noremap! <C-0> ❱

nnoremap <silent> <leader><F2> <Cmd>call SynStack()<cr>

"══════════════════════════════════════════════════
" Substitute / Edit commands => <Leader>e* 

" show matches of search at top of window
noremap n nzvzz

noremap N Nzvzz

"══════════════════════════════════════════════════
" Terminal / Floaterm => <Leader>t* 

" nnoremap <silent> <leader>fnj
" \   <Cmd>FloatermNew --width=81 --height=20<CR>
"
" nnoremap <silent> <leader>fnk
" \   <Cmd>FloatermNew --width=80 --height=0.8<CR>

" nnoremap <silent> <leader>fL
" \   <Cmd>FloatermUpdate --position=bottomright<CR>
" tnoremap <silent> <leader>fL
" \   <Cmd>FloatermUpdate --position=bottomright<CR>
" nnoremap <silent> <leader>fK
" \   <Cmd>FloatermUpdate --position=top<CR>
" tnoremap <silent> <leader>fK
" \   <Cmd>FloatermUpdate --position=top<CR>
" nnoremap <silent> <leader>fJ
" \   <Cmd>FloatermUpdate --position=bottom<CR>
" tnoremap <silent> <leader>fJ
" \   <Cmd>FloatermUpdate --position=bottom<CR>
" nnoremap <silent> <leader>fH
" \   <Cmd>FloatermUpdate --position=bottomleft<CR>
" tnoremap <silent> <leader>fH
" \   <Cmd>FloatermUpdate --position=bottomleft<CR>
" nnoremap <silent> <leader>fa
" \   <Cmd>FloatermUpdate --position=auto<CR>
" tnoremap <silent> <leader>fa
" \   <Cmd>FloatermUpdate --position=auto<CR>
"<C-\><C-N> can be used to got to normal mode. Additionally <C-\><C-N> closes
"the command line window and switch to normal mode
"tnoremap <Esc> <C-\><C-n>


" nnoremap <silent> <leader>f+
" \   <Cmd>execute "FloatermUpdate".
" \   " --width="
" \   . floaterm#config#get(bufnr(), "width") .
" \   " --height="
" \   . (floaterm#config#get(bufnr(), "height")+4)<CR>
"
" tnoremap <silent> <leader>f+
" \   <Cmd>execute "FloatermUpdate".
" \   " --width="
" \   . floaterm#config#get(bufnr(), "width") .
" \   " --height="
" \   . (floaterm#config#get(bufnr(), "height")+4)<CR>
"
" nnoremap <silent> <leader>f/
" \   <Cmd>execute "FloatermUpdate".
" \   " --width="
" \   . floaterm#config#get(bufnr(), "width") .
" \   " --height="
" \   . (floaterm#config#get(bufnr(), "height")-4)<CR>
"
" tnoremap <silent> <leader>f/
" \   <Cmd>execute "FloatermUpdate".
" \   " --width="
" \   . floaterm#config#get(bufnr(), "width") .
" \   " --height="
" \   . (floaterm#config#get(bufnr(), "height")-4)<CR>
"
" nnoremap <silent> <leader>f<
" \   <Cmd>execute "FloatermUpdate".
" \   " --width="
" \   . (floaterm#config#get(bufnr(), "width") - 4).
" \   " --height="
" \   . floaterm#config#get(bufnr(), "height")<CR>
" tnoremap <silent> <leader>f<
" \   <Cmd>execute "FloatermUpdate".
" \   " --width="
" \   . (floaterm#config#get(bufnr(), "width") - 4).
" \   " --height="
" \   . floaterm#config#get(bufnr(), "height")<CR>
"
" nnoremap <silent> <leader>f>
" \   <Cmd>execute "FloatermUpdate".
" \   " --width="
" \   . (floaterm#config#get(bufnr(), "width") + 4).
" \   " --height="
" \   . floaterm#config#get(bufnr(), "height")<CR>
" tnoremap <silent> <leader>f>
" \   <Cmd>execute "FloatermUpdate".
" \   " --width="
" \   . (floaterm#config#get(bufnr(), "width") + 4).
" \   " --height="
" \   . floaterm#config#get(bufnr(), "height")<CR>
"
" nnoremap <silent> <leader>fi
" \   <Cmd>lua require("Fn/floaterm-toggle-size").toggle()<cr>
" tnoremap <silent> <leader>fi
" \   <Cmd>lua require("Fn/floaterm-toggle-size").toggle()<cr>
"
