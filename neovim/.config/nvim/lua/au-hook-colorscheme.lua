local t = {}

t.get_hl_group_colors = function (hl_gr) 
    local tbl_color = {}

    local hl_id = vim.fn.hlID(hl_gr)
    local hl_id_trans = vim.fn.synIDtrans(hl_id)

    tbl_color.fg = vim.fn.synIDattr(hl_id_trans, 'fg')
    tbl_color.bg = vim.fn.synIDattr(hl_id_trans, 'bg')

    return tbl_color
end

local colors = {
    SignColumn = { bg = '#504945' }
    -- SignColumn = { bg = '#00ff45' }
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
    Folded           = { fg = '#000000', bg = '#bfbfbf', style = 'italic' },
    FoldColumn       = { fg = 'red', bg = 'blue', style = 'bold' },
    VertSplit        = { bg = '#a7a7a7', fg = '#b000a0', style = 'bold' },

    IndentBlankline  = { fg = '#f740a4' },

    WhichKeyFloat    = { bg = '#bafeba'},
    WhichKeyGroup    = { fg = '#000000'},
    WhichKeyValue    = { fg = '#f00000'},
    WhichKeySeparator = { fg = '#858585'},

    WildMenu         = { bg = 'none', fg = '#00ff00', style = 'italic' },

    RegTitle         = { fg = '#00ff00', style = 'italic' },
    RegName          = { fg = '#00ff00', style = 'italic' },
    RegPrefix        = { fg = '#00ff00', style = 'italic' },

    FloatBorder      = { bg = 'None', fg = 'red' },

    HopNextKey       = { bg = '#a4ffa4', fg = '#ff00ff', style = 'bold' },
    HopNextKey2      = { bg = '#a4ffa4', fg = '#ff0012', style = 'bold' },
    HopNextKey1      = { bg = '#a4ffa4', fg = '#ff0012', style = 'bold' },
    HopUnmatched     = { fg = '#ffdfbf' },

    -- DiagnosticError = { fg = '#ff00ff' },
    -- DiagnosticWarn  = { fg = '#ff0012' },
    -- DiagnosticInfo  = { fg = '#ff0012' },
    -- DiagnosticHint  = { fg = '#ff0012' },

    ColorColumn      = { bg = '#e9e9e9', fg = 'NONE', style = 'bold' },

    rainbowcol1      = { fg = '#ff2a2f' },
    rainbowcol2      = { fg = '#073de6' },
    rainbowcol3      = { fg = '#12d22e' },
    rainbowcol4      = { fg = '#ff9900' },
    rainbowcol5      = { fg = '#ae81ff' },
    rainbowcol6      = { fg = '#d70084' },
    rainbowcol7      = { fg = '#00adad' },


    TabLineSel       = { fg = '#000000', bg = '#ffffff' },
    TabLine          = { fg = '#abb2bf', bg = '#3e4452' },
    TabLineFill      = { bg = '#3e4452' },

    SpellBad         = { style = 'undercurl', sp = '#5aaa60' },
    SpellRare01      = { bg = '#552525', style = 'undercurl', sp = '#5aaa60' },
    SpellRare02      = { bg = '#402526', style = 'undercurl', sp = '#3a6a30' },
    SpellRare03      = { bg = '#292426', style = 'undercurl', sp = '#2a5a30' },

    Search           = { fg = 'NONE', bg = '#f0f08a', style = 'italic' },
    IncSearch        = { fg = 'NONE', bg = '#ff4f4a', style = 'bold'  },

    Whitespace       = { fg = '#353522' },

    Cursor           = { fg = 'NONE', bg = '#12df12', style = 'bold'},
    Cursori          = { fg = 'NONE', bg = '#000000' },

    DeniteCursorLine = { bg = '#483232' },
    DenitePathHead   = { fg = '#3233ff' },
    DenitePathTail   = { fg = '#ff7032' },

    SpecialKey       = { fg = '#ff9002' },

    PmenuSbar        = { style = 'bold', fg = 'red', bg = 'green' },

    rnowebChunk        = { fg = '#c84656' },
    rnowebSexpr        = { fg = '#c84656' },
    rnowebDelimiter    = { fg = vim.g.terminal_color_6 },
    rnowebDelimiterEnd = { fg = vim.g.terminal_color_6, bg = 'NONE', style = 'bold' },

    FloatermBorder = { bg = 'NONE', fg = '#9696ff', style = 'bold' },
    Floaterm       = { bg = 'black', fg = '#00ff00' },
    Ranger         = { bg = 'black', fg = '#ffffff' },
    RnvimrNormal   = { bg = 'black', fg = '#ffffff' },
    RnvimrCurses   = { bg = 'black', fg = '#dcdcdc' },
    MYQFNormal     = { fg = '#d8d8d2', bg = '#121212' },
    MYQFLineNr     = { fg = '#f0f08a', bg = '#674842' },
    LineNr         = { fg = '#90908a', bg = '#3c3d37', style = 'italic' },

    SignColumn               = { fg = 'NONE', bg = colors.SignColumn.bg },

    DiagnosticSignError      = { fg = '#ff0000', bg = colors.SignColumn.bg },
    DiagnosticSignWarn       = { fg = '#ffaa12', bg = colors.SignColumn.bg },
    DiagnosticSignInfo       = { fg = '#1383ff', bg = colors.SignColumn.bg },
    DiagnosticSignHint       = { fg = '#1383ff', bg = colors.SignColumn.bg },

    GitSignsAdd              = { fg = '#00ff00', style = 'bold', bg = colors.SignColumn.bg },
    GitSignsDelete           = { fg = '#ee1022', style = 'bold', bg = colors.SignColumn.bg },
    GitSignsChange           = { fg = '#ffff00', style = 'bold', bg = colors.SignColumn.bg },

    GitSignsCurrentLineBlame = { fg = '#504945', style = 'italic', bg = 'NONE' },

    GitSignsAddLn            = { fg = 'NONE', bg = '#acffac' },
    GitSignsChangeLn         = { fg = 'NONE', bg = '#ffff8c' },
    GitSignsDeleteLn         = { fg = 'NONE', bg = '#ffdfdf' }
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
    for group,colors in pairs(syntax) do
        highlight(group,colors)
    end
end

return t

-- " Normal #272822
-- "hi Normal guifg=#ffffff guibg=#191918
--
-- " hi EasyMotionTarget guibg=none guifg=#00ff00 gui=italic
-- " hi EasyMotionTarget2First guibg=none guifg=#ffff00 gui=italic
-- " hi EasyMotionTarget2Second guibg=none guifg=#ff4722 gui=italic
-- "hi EasyMotionShade  ctermbg=none ctermfg=blue
--
-- "hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred
-- "
-- "hi MatchBackground guibg=#ff4702
--
-- "hi EasyMotionMoveHL ctermbg=green ctermfg=black
-- "hi EasyMotionIncSearch ctermbg=green ctermfg=black
-- "hi LspDiagnosticsDefaultError guifg=BrightRed guibg=Grey gui=bold
-- ",undercurl guisp=#ff4aff
-- "hi CursorLine guibg=#292929
-- "hi DeniteNormal guifg=Grey guibg=#000000
-- "hi DenitePrompt gui=bold guifg=#33FF11 guibg=Grey
-- "hi DeniteSignColumn guibg=Grey
-- "hi Pmenu gui=NONE guibg=#000000 guifg=#f7f7f7
-- "hi DeniteHighlightMatchedChar gui=italic guifg=red guibg=#000000
-- "hi DeniteHighlightMatchedRange gui=NONE guifg=NONE guibg=#000000
