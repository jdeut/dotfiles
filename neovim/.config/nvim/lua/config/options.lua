local o = vim.opt

o.gdefault = true
o.ignorecase = true
o.smartcase = true
o.swapfile = false

-- "Remember to escape | in langmap
-- "set langmap+=y;z
-- "set langmap+=z;y

o.showbreak           = "↪ "
-- "space:·
-- tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
o.listchars           = "tab:▸ ,eol: "
o.list                = false
o.linebreak           = true
-- when splitting place the new window right of
-- the current one
o.splitright          = false
-- set clipboard      = unnamed
-- splitted window will be shown below current one
o.splitbelow          = true
o.foldenable          = true
-- close folds also if it's just one screenline
--  set foldminlines  = 0
o.foldminlines        = 2
o.scrollback          = 10000
o.smoothscroll        = true
o.foldmarker          = "❰❰❰,❱❱❱"
o.foldmethod          = "marker"
-- set foldtext       = MyFoldText()
-- hide buffer instead of closing it
-- execute au's like BufRead only once per opened file
o.fillchars           = "vert:▏,foldclose:┣,eob:~"
-- ▍
o.signcolumn          = "auto:2"
o.hidden              = true
o.grepprg             = [[rg --vimgrep --no-heading --smart-case "$(git rev-parse --show-toplevel)/.gitignore"]]
o.grepformat          = "%f:%l:%c:%m,%f:%l:%m"
-- set maxium number of items to show in the popup menu
o.pumheight           = 14
o.previewheight       = 15
o.pumblend            = 10
-- use the 'patience' diff algorithm that looks for the
-- longest common subsequence (https://vimways.org/2018/the-power-of-diff/)
o.diffopt:append{"algorithm:patience","iblank","iwhite","context:1","vertical"}
-- A file that matches with one of these patterns is ignored when expanding
-- set wildignore     = *.png,*.jpg,*.gif,*.odt,*.pdf,*.ps,*.o
o.wildignore:append{"*~","*.pyc","*/.git/*","*.so","*.swp","*.o","*.zip","*.zwc","*.png","*.jpg","*.pdf","*.gif","*.ps","*.o","*.odt"}
-- wrapped lines use also the column for 'relativenumber'
-- o.cpoptions:append{"n"}
o.encoding            = "utf-8"
o.matchpairs          = [[<:>,':',":"]]
o.colorcolumn         = "80"
o.shada               = [['400,/40,s100,<50,h]]
o.shortmess           = "aF"
--  Do not force a memory flush to speedup manual writes.
o.fsync               = false
-- configure backspace to work like in other programs
o.backspace           = "2"
-- add space as a valid character for filename
-- especially for filename completion
-- isfnane           += 32 breaks filename completion
-- set isfname       += 32
-- while typing, highlight the first match next to cursor
o.incsearch           = true
--  do not continue comment after pressing o inside a comment
o.formatoptions:remove{"o"}
-- show the effects of a command incrementally, as u type
o.inccommand          = "split"
o.redrawtime          = 1200
o.updatetime          = 100
-- a history of the 20 previous commands and search patterns
-- is definitely to short
o.history             = 200
o.equalalways         = true
o.eadirection         = "hor"
-- number of context lines above and below the cursor
o.scrolloff           = 2
-- show line number relative to the line with the cursor
o.relativenumber      = false
o.number              = false
-- make sure that the statusline is always visible
o.laststatus          = 2
-- customize statusline
-- set statusline     = [filename=%t]\ [ftype=%Y]\ [CWD=%{getcwd()}]\ [C,L=%c,%l]
-- substitute a tab with spaces
o.expandtab           = true
-- Use tabstop value for shift operations
o.shiftwidth          = 0
-- Round indent to multiple of 'shiftwidth'.
o.shiftround          = true
o.tabstop             = 4
o.softtabstop         = 4
o.autoindent          = true
o.mouse               = "a"
-- write the contents of the file on each :tag, :make etc.
o.autowriteall        = true
o.autowrite           = true
-- wildmenu
o.wildmenu            = true
-- options for command line completion
o.wildmode            = [[full:longest]]
o.wildoptions         = "pum"
-- options for insert mode completion
-- 'menu' makes completion faster than 'menuone'
-- set completeopt    = menu,longest
o.completeopt         = "menuone,noselect"
-- on generic completion <c-p> scan current buffer (.), open windows (w) and the
-- tags file (t)
-- set complete       = .,w,k,t
-- show info of the typed command in the lower-right corner
o.showcmd             = true
o.showmode            = false
-- options for sessions
-- do not save empty windows
-- do not save all options and settings
-- do not save the cwd
o.sessionoptions:remove{"curdir","options","blank"}
o.switchbuf           = "useopen,vsplit"
-- display the last line on the screen even if the line
-- is longer than the screen
o.display             = "lastline"
-- time in ms that is waited for a key sequence to complete
o.timeout             = true
o.timeoutlen          = 300
-- apply to key codes
o.ttimeoutlen         = 1
-- set persistent undo
o.undodir             = vim.fs.joinpath(vim.fn.stdpath('data'), 'undo')
o.undofile            = true
-- change directory to current buffer
-- set autochdir
o.spelllang           = "de_20"
o.guicursor           = "n:block-blinkon50-Cursor,i-c:ver100-blinkon50-Cursori,v:hor100-blinkon50-Cursori"
-- ══════════════════════════════════════════════════
--  Gui Options
-- ══════════════════════════════════════════════════
o.guifont             = "Liga Meslo LG M DZ:h12"
o.linespace           = 1
o.winaltkeys          = "no"
-- ══════════════════════════════════════════════════
--  Color Settings
-- ══════════════════════════════════════════════════
o.termguicolors       = true
o.background          = "light"
