lua vim.loader.enable()

" lua ok, packer = pcall(require, 'plugins') if ok then packer.compile() end


" lua require'autocommands'
" lua require'settings.lsp'

"══════════════════════════════════════════════════════════════════
" General Settings
"source $HOME/.config/nvim/init-custom-fn.vim
" both options are enabled by default in neovim
filetype plugin on
"syntax enable
filetype indent off
"enable 'Man' command
runtime ftplugin/man.vim

let loaded_matchit = 1

"disable beeping and flashing on error
set vb t_vb=
"set g modifierg:fruzzy#usenative=1
set gdefault
set ignorecase
set smartcase
set noswapfile

"Remember to escape | in langmap
"set langmap+=y;z
"set langmap+=z;y

set showbreak=↪\
"space:·
set listchars=tab:▸\ ,eol:\
set nolist
"tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set linebreak
"when splitting place the new window right of
"the current one
set nosplitright
"set clipboard=unnamed
"splitted window will be shown below current one
set splitbelow
set foldenable
"close folds also if it's just one screenline
" set foldminlines=0
set foldminlines=2
set scrollback=10000
set smoothscroll
set foldmarker=❰❰❰,❱❱❱
set foldmethod=marker
"set foldtext=MyFoldText()
"hide buffer instead of closing it
"execute au's like BufRead only once per opened file
set fillchars=vert:▏,foldclose:┣,eob:~
"▍
set signcolumn=auto:2
set hidden
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ "$(git rev-parse --show-toplevel)/.gitignore"
set grepformat=%f:%l:%c:%m,%f:%l:%m
"set maxium number of items to show in the popup menu
set pumheight=14
set previewheight=15
set pumblend=10
"use the 'patience' diff algorithm that looks for the
"longest common subsequence (https://vimways.org/2018/the-power-of-diff/)
set diffopt+=algorithm:patience,iblank,iwhite,context:1,vertical
"A file that matches with one of these patterns is ignored when expanding
"set wildignore=*.png,*.jpg,*.gif,*.odt,*.pdf,*.ps,*.o
set wildignore+=*~,*.pyc,*/.git/*,*.so,*.swp,*.o,*.zip,*.zwc,*.png,*.jpg,*.pdf,*.gif,*.ps,*.o,*.odt
"wrapped lines use also the column for 'relativenumber'
set cpoptions+=n
set encoding=utf-8
set matchpairs+=<:>,\':\',\":\"
set colorcolumn=80
set shada='400,/40,s100,<50,h
set shortmess=aF
" Do not force a memory flush to speedup manual writes.
set nofsync
"configure backspace to work like in other programs
set backspace=2
"add space as a valid character for filename
"especially for filename completion
"isfnane+=32 breaks filename completion
"set isfname+=32
"while typing, highlight the first match next to cursor
set incsearch
" do not continue comment after pressing o inside a comment
set formatoptions-=o
"show the effects of a command incrementally, as u type
set inccommand=split
set redrawtime=1200
set updatetime=100
"a history of the 20 previous commands and search patterns
"is definitely to short
set history=200
set equalalways
set eadirection=hor
"number of context lines above and below the cursor
set scrolloff=2
"show line number relative to the line with the cursor
set norelativenumber
set nonumber
"make sure that the statusline is always visible
set laststatus=2
"customize statusline
"set statusline=[filename=%t]\ [ftype=%Y]\ [CWD=%{getcwd()}]\ [C,L=%c,%l]
"substitute a tab with spaces
set expandtab
"Use tabstop value for shift operations
set shiftwidth=0
"Round indent to multiple of 'shiftwidth'.
set shiftround
set tabstop=4
set softtabstop=4
set autoindent
set mouse=a
"write the contents of the file on each :tag, :make etc.
set autowriteall
set autowrite
"wildmenu
set wildmenu
"options for command line completion
set wildmode=full:longest
set wildoptions=pum
"options for insert mode completion
"'menu' makes completion faster than 'menuone'
"set completeopt=menu,longest
set completeopt=menuone,noselect
"on generic completion <c-p> scan current buffer (.), open windows (w) and the
"tags file (t)
"set complete=.,w,k,t
"show info of the typed command in the lower-right corner
set showcmd
set noshowmode
"options for sessions
"do not save empty windows
"do not save all options and settings
"do not save the cwd
set sessionoptions-=curdir,options,blank
set switchbuf=useopen,vsplit
"display the last line on the screen even if the line
"is longer than the screen
set display=lastline
"time in ms that is waited for a key sequence to complete
set timeout
set timeoutlen=300
"apply to key codes
set ttimeoutlen=1
"set persistent undo
set undodir=~/.local/share/nvim/undo
set undofile
"change directory to current buffer
"set autochdir
set spelllang=de_20
set guicursor=n:block-blinkon50-Cursor,i-c:ver100-blinkon50-Cursori,v:hor100-blinkon50-Cursori
"══════════════════════════════════════════════════
" Gui Options
"══════════════════════════════════════════════════
let guifont_start = "Liga Meslo LG M DZ:h12"
let &guifont = g:guifont_start
set linespace=1
set winaltkeys=no
"hide the menu bar
set go-=m
"hide toolbar
set go-=T
"══════════════════════════════════════════════════
" Color Settings
"══════════════════════════════════════════════════
set termguicolors
set background=light
"══════════════════════════════════════════════════
" Statusline
"══════════════════════════════════════════════════
"set statusline+=%#warningmsg#
"set statusline+=%*

packadd termdebug

"set ft to c if *.h

"let g:loaded_netrw               = 1
"let g:loaded_netrwPlugin         = 1

let loaded_gzip                  = 1
let g:c_syntax_for_h             = 1
let g:termdebug_useFloatingHover = 1
let g:termdebug_wide             = 200
let g:vimsyn_folding             = 'afP'
let g:loaded_ruby_provider       = 0
let g:loaded_perl_provider       = 0
let g:loaded_python_provider     = 0
let g:loaded_node_provider       = 0
let g:python3_host_prog          = '/usr/bin/python3'

let no_plugin_maps               = 1
let mapleader                    = ';'
let maplocalleader               = '/'

let g:vimsyn_embed               = 'l'
let g:no_vim_maps                = 0

let g:nvim_config_home           = stdpath('config')

" let g:clipboard = {
" \   'name': 'myClipboard',
" \   'copy': {
" \      '+': ['wl-copy', '-f', '-t', 'text/plain'],
" \      '*': ['wl-copy', '-p', '-f', '-t', 'text/plain']
" \    },
" \   'paste': {
" \      '+': ['wl-paste', '-n'],
" \      '*': ['wl-paste', '-p', '-n']
" \   },
" \   'cache_enabled': 1,
" \ }

if exists('g:loaded_clipboard_provider')
  unlet g:loaded_clipboard_provider
  runtime autoload/provider/clipboard.vim
endif

"══════════════════════════════════════════════════════════════════
" Custom Functions
function! SetSqlSyntaxHi()
    unlet b:current_syntax
    syn include @SQL syntax/sql.vim

    syn region pandocDelimitedCodeBlock_sql
    \   start=/\_^`\{3}{\(sql\|meinsql\).\{-}\}.*\_$/
    \   end=/\_^`\{3}\_$/
    \   contains=@SQL

    "hi pandocDelimitedCodeBlock_sql guifg=#057705
endfunction

lua require'skeleton'

"══════════════════════════════════════════════════════════════════
" Autocommands (FileType specific settings, mappings, etc.)
"
augroup MY__
    au!

    "au BufRead * let b:lexima_disable = 0
    "au BufNew * lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<afile>:p')}}):sync()

    "au BufEnter * if &ft ==# 'help' | normal "zR" | wincmd L | vert resize 85 | endif
    au TextYankPost *
    \   silent! lua vim.highlight.on_yank{
    \       higroup = "IncSearch",
    \       timeout = 500,
    \       on_macro = true
    \ }

    " press <C-c> to leave the command-line window
    autocmd CmdwinEnter * noremap <buffer> <C-c> <C-\><C-N>

    " set ` mark to cursor position at mode change from [*] -> [visual]
    au ModeChanged *:[vV]* lua p = vim.api.nvim_win_get_cursor(0) vim.api.nvim_buf_set_mark(0, '`', p[1], p[2], {})
    " test with -->
    "   au ModeChanged * echomsg printf('the old mode was: %s, the new mode is: %s', v:event.old_mode, v:event.new_mode)

    "autocmd WinEnter * lua
    "\   local fts = { 'denite', 'denite-filter' } ;
    "\   local ret = vim.tbl_contains(fts, vim.bo.filetype)
    "\   if ret == false then
    "\       vim.wo.cursorline = true
    "\       vim.defer_fn(function() vim.wo.cursorline = false end, 3000)
    "\   else
    "\   end

    "═══════════════════════════════════════════════════════════════
    " Diff

    au OptionSet diff setlocal nonumber norelativenumber

    "═══════════════════════════════════════════════════════════════
    " Terminal

    "au TermOpen * call SetTerminalColors()
    au TermOpen * setlocal winhighlight=Normal:Floaterm
    au TermOpen * setlocal scl=no
    au TermOpen * setlocal nonumber
    au TermOpen * setlocal nospell
    "au TermOpen * noremap <buffer> <ScrollWheelUp>     <C-b>
    "au TermOpen * noremap <buffer> <2-ScrollWheelUp>   <C-b>
    "au TermOpen * noremap <buffer> <3-ScrollWheelUp>   <C-b>
    "au TermOpen * noremap <buffer> <4-ScrollWheelUp>   <C-b>
    "au TermOpen * noremap <buffer> <ScrollWheelDown>   <C-f>
    "au TermOpen * noremap <buffer> <2-ScrollWheelDown> <C-f>
    "au TermOpen * noremap <buffer> <3-ScrollWheelDown> <C-f>
    "au TermOpen * noremap <buffer> <4-ScrollWheelDown> <C-f>
    "au TermOpen * noremap <buffer> <RightMouse> :startinsert<cr>
    "au TermOpen * noremap <buffer> <RightRelase> <nop>
    "au TermOpen * noremap <buffer> <RightDrag> <nop>
    "au TermOpen * startinsert
    "au TermOpen * nnoremap <buffer> <leader>oc <Cmd>bd!<cr>
    "au WinEnter term://* startinsert

augroup END


lua require'style.mytcols'
" lua require'style.myhl'
lua require'plugins'
lua require'settings.diagnostics'

" highlight DiagnosticSignWarn guibg=gray
