local t = {}

local tbind = vim.fn.extend

t.get_hl_group_colors = function (hl_gr) 
   local tbl_color = {}

   local hl_id = vim.fn.hlID(hl_gr)
   local hl_id_trans = vim.fn.synIDtrans(hl_id)

   tbl_color.fg = vim.fn.synIDattr(hl_id_trans, 'fg')
   tbl_color.bg = vim.fn.synIDattr(hl_id_trans, 'bg')

   return tbl_color
end

t.onedark_colors = {
   fg      = '#111111',
   bg      = '#ffffff',
   white   = '#ffffff',
   yellow  = '#ff8000',
   purple  = '#9a12cf',
   black   = '#000000',
   gray    = '#2c2c2c',
   cyan    = '#00949e',
   green   = '#1d9a0d',
   red     = '#bb1611',
   comment = '#797979'
}

t.colors = tbind(
   t.onedark_colors,
   {
      darkyellow  = '#ff3200',
      darkblue    = '#0000aa',
      darkgray    = '#121212',
      lightyellow = '#ffffaa',
      lightred    = '#ffc5c5',
      lightgreen  = '#b4ffb4',
      lightgreen2 = '#d4ffd4',
      lightgray   = '#f3f4f2'
   }
)

local hi = {
    SignColumn = { bg = t.colors.gray }
}

vim.g.terminal_color_0  = '#2e3436'
vim.g.terminal_color_1  = '#cc0000'
vim.g.terminal_color_2  = '#4e9a06'
vim.g.terminal_color_3  = '#c4a000'
vim.g.terminal_color_4  = '#3465a4'
vim.g.terminal_color_5  = '#75507b'
vim.g.terminal_color_6  = '#0b939b'
vim.g.terminal_color_7  = '#d3d7cf'
vim.g.terminal_color_8  = '#555753'
vim.g.terminal_color_9  = '#ef2929'
vim.g.terminal_color_10 = '#8ae234'
vim.g.terminal_color_11 = '#fce94f'
vim.g.terminal_color_12 = '#729fcf'
vim.g.terminal_color_13 = '#ad7fa8'
vim.g.terminal_color_14 = '#00f5e9'
vim.g.terminal_color_15 = '#eeeeec'

local syntax = {
   NonText          = { fg = t.colors.fg, bg = t.colors.bg },
   Folded           = { fg = t.colors.black, bg = t.colors.lightgreen, style = 'italic' },
   FoldColumn       = { fg = t.colors.red, bg = 'blue', style = 'bold' },
   VertSplit        = tbind({ fg = t.colors.black, style = 'bold' }, hi.SignColumn),

   EndOfBuffer      = { bg = t.colors.lightgray, fg = t.colors.cyan, style = 'italic' },

   IndentBlankline  = { fg = t.colors.purple },

   WhichKey          = { fg = t.colors.darkyellow, style = 'bold' },
   WhichKeyFloat     = { bg = t.colors.lightgreen },
   WhichKeyGroup     = { fg = t.colors.darkblue },
   WhichKeyDesc      = { fg = t.colors.darkgray },
   WhichKeyValue     = { fg = t.colors.red },
   WhichKeySeparator = { fg = t.colors.comment },

   FloatBorder = { fg = t.colors.red, bg = t.colors.lightgreen },

   WildMenu    = { fg = t.colors.green, style = 'italic' },

   RegTitle  = { fg = t.colors.green, style = 'italic' },
   RegName   = { fg = t.colors.green, style = 'italic' },
   RegPrefix = { fg = t.colors.green, style = 'italic' },

   HopNextKey   = { bg = t.colors.lightyellow, fg = t.colors.black, style = 'bold' },
   HopNextKey1  = { bg = t.colors.lightgreen, fg = t.colors.red, style = 'bold' },
   HopNextKey2  = { bg = t.colors.lightglightgreen2, fg = t.colors.red },
   HopUnmatched = { fg = t.colors.comment },

   ColorColumn = { bg = t.colors.lightgray },

   rainbowcol1 = { fg = '#c400f3', style = 'bold' },
   rainbowcol2 = { fg = '#5b0092', style = 'bold' },
   rainbowcol3 = { fg = '#0000aa', style = 'bold' },
   rainbowcol4 = { fg = t.colors.green, style = 'bold' },
   rainbowcol5 = { fg = t.colors.darkyellow, style = 'bold' },
   rainbowcol6 = { fg = '#bb6f00', style = 'bold' },
   rainbowcol7 = { fg = '#aa0000', style = 'bold' },

   TabLineSel       = { fg = t.colors.black, bg = t.colors.white },
   TabLine          = { fg = t.colors.comment, bg = '#3e4452' },
   TabLineFill      = { bg = '#3e4452' },

   SpellBad         = { style = 'undercurl', sp = t.colors.green },
   SpellRare01      = { bg = '#552525', style = 'undercurl', sp = '#5aaa60' },
   SpellRare02      = { bg = '#402526', style = 'undercurl', sp = '#3a6a30' },
   SpellRare03      = { bg = '#292426', style = 'undercurl', sp = '#2a5a30' },

   Search           = { bg = t.colors.lightyellow, style = 'italic' },
   IncSearch        = { bg = t.colors.lightred, style = 'bold'  },

   HlSearchLens     = { bg = t.colors.lightgray, fg = t.colors.yellow },
   HlSearchLensNear = { bg = 'yellow', fg = t.colors.black, style = 'bold' },

   Whitespace       = { fg = '#353522' },

   Cursor           = { bg = '#22f022', style = 'bold'},
   Cursori          = { bg = t.colors.purple },
   TermCursor       = { bg = '#22f022', style = 'bold'},
   Cursori          = { bg = t.colors.purple },
   TermCursorNC     = { bg = t.colors.purple },

   DeniteCursorLine = { bg = '#483232' },
   DenitePathHead   = { fg = '#3233ff' },
   DenitePathTail   = { fg = '#ff7032' },

   SpecialKey = { fg = t.colors.darkyellow },

   PmenuSbar  = { fg = t.colors.red, bg = t.colors.lightgreen, style = 'bold' },

   rnowebChunk        = { fg = t.colors.red },
   rnowebSexpr        = { fg = t.colors.red },
   rnowebDelimiter    = { fg = t.colors.cyan },
   rnowebDelimiterEnd = { fg = t.colors.cyan, style = 'bold' },

   FloatermBorder = { fg = '#9696ff', bg = t.colors.black, style = 'bold' },
   Floaterm       = { bg = t.colors.black, fg = '#00ff00' },
   Ranger         = { bg = t.colors.black, fg = '#ffffff' },
   RnvimrNormal   = { bg = t.colors.black, fg = '#ffffff' },
   RnvimrCurses   = { bg = t.colors.black, fg = '#ececec' },

   MyQfNormal      = { fg = '#d8d8d2', bg = '#323232' },
   MyQfLineNr      = { fg = '#f0f08a', bg = '#674842' },
   MyQfEndOfBuffer = { fg = t.colors.red, bg = t.colors.yellow },
   MyQfNonText     = { fg = t.colors.cyan, style = 'italic' },

   qfFileName = { fg = t.colors.purble },
   qfLineNr = { fg = t.colors.purble, bg = t.colors.bg },
   qfSeparator = { fg = t.colors.black },
   QuickFixLine = { bg = t.colors.lightred },

   SignColumn = { bg = hi.SignColumn.bg },
   LineNr     = tbind({ fg = '#90908a', style = 'bold' }, hi.SignColumn),

   DiagnosticSignError = tbind({ fg = t.colors.red }, hi.SignColumn ),
   DiagnosticSignWarn  = tbind({ fg = t.colors.yellow }, hi.SignColumn ),
   DiagnosticSignInfo  = tbind({ fg = t.colors.cyan }, hi.SignColumn ),
   DiagnosticSignHint  = tbind({ fg = t.colors.cyan }, hi.SignColumn ),

   VimtexFrametitle = { fg = '#000000', bg = '#f0f08a', style = 'bold'},

   GitSignsAdd    = tbind({ fg = t.colors.green, style = 'bold' }, hi.SignColumn ),
   GitSignsDelete = tbind({ fg = t.colors.red, style = 'bold'}, hi.SignColumn ),
   GitSignsChange = tbind({ fg = t.colors.yellow, style = 'bold'}, hi.SignColumn ),

   GitSignsCurrentLineBlame = { fg = '#504945', style = 'italic' },

   GitSignsAddLn            = { bg = '#acffac' },
   GitSignsChangeLn         = { bg = '#ffff8c' },
   GitSignsDeleteLn         = { bg = '#ffdfdf' }
}

local function highlight(group, color)
   local style = color.style and 'gui=' .. color.style or 'gui=NONE'
   local fg    = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
   local bg    = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
   local sp    = color.sp and 'guisp=' .. color.sp or ''

   vim.api.nvim_command(
      [[highlight ]] 
      .. group .. ' ' .. style .. ' '
      .. fg .. ' ' .. bg .. ' ' .. sp
   )
end

vim.cmd('au FileType denite-filter setlocal winhighlight=Normal:Folded')
vim.cmd('au FileType denite,denite-filter setlocal winhighlight=CursorLine:DeniteCursorLine')

t.hook = function()
    for group,hi in pairs(syntax) do
        highlight(group, hi)
    end
end

return t
