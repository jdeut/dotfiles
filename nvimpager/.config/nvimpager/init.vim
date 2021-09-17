set runtimepath+=~/.local/share/nvimpager/runtime/
filetype plugin on
syntax on
let mapleader='#'
let maplocalleader='ü'

set langmap=öäÖÄ-;{}[]/
set ignorecase
set smartcase
set termguicolors
"colorscheme srcery

nnoremap <silent> <leader>vh
\   :set hlsearch! hlsearch?<cr>

let g:tex_flavor = 'latex'
