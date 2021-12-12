local t = {}

local cols = require'style.mycols'

local tbind = vim.fn.extend

-- t.Normal = { fg = 'green', bg = 'red' }

t.NonText    = { fg = cols.fg, bg = cols.bg }
t.Folded     = { fg = cols.black, bg = cols.lightgreen, style = 'italic' }
t.FoldColumn = { fg = cols.red, bg = 'blue', style = 'bold' }

t.Whitespace = { fg = '#353522' }

t.EndOfBuffer      = { bg = cols.lightgray, fg = cols.cyan, style = 'italic' }

t.IndentBlankline  = { fg = cols.purple }

t.WhichKey          = { fg = cols.darkyellow, style = 'bold' }
t.WhichKeyFloat     = { bg = cols.lightgreen }
t.WhichKeyGroup     = { fg = cols.darkblue }
t.WhichKeyDesc      = { fg = cols.darkgray }
t.WhichKeyValue     = { fg = cols.red }
t.WhichKeySeparator = { fg = cols.comment }

-- t.FloatBorder = { fg = cols.red, bg = cols.lightgreen }

t.WildMenu    = { fg = cols.green, style = 'italic' }

t.RegTitle  = { fg = cols.green, style = 'italic' }
t.RegName   = { fg = cols.green, style = 'italic' }
t.RegPrefix = { fg = cols.green, style = 'italic' }

t.HopNextKey   = { bg = cols.lightyellow, fg = cols.black, style = 'bold' }
t.HopNextKey1  = { bg = cols.lightgreen, fg = cols.red, style = 'bold' }
t.HopNextKey2  = { bg = cols.lightglightgreen2, fg = cols.red }
t.HopUnmatched = { fg = cols.comment }

t.ColorColumn = { bg = cols.lightgray }

t.rainbowcol1 = { fg = '#c400f3', style = 'bold' }
t.rainbowcol2 = { fg = '#5b0092', style = 'bold' }
t.rainbowcol3 = { fg = '#0000aa', style = 'bold' }
t.rainbowcol4 = { fg = cols.green, style = 'bold' }
t.rainbowcol5 = { fg = cols.darkyellow, style = 'bold' }
t.rainbowcol6 = { fg = '#bb6f00', style = 'bold' }
t.rainbowcol7 = { fg = '#aa0000', style = 'bold' }

t.TabLineSel  = { fg = cols.black, bg = cols.white }
t.TabLine     = { fg = cols.comment, bg = '#3e4452' }
t.TabLineFill = { bg = '#3e4452' }

t.FfzLuaDefault = { bg = cols.gray, fg = cols.black }

t.SpellBad    = { style = 'undercurl', sp = cols.green }
t.SpellRare01 = { bg = '#552525', style = 'undercurl', sp = '#5aaa60' }
t.SpellRare02 = { bg = '#402526', style = 'undercurl', sp = '#3a6a30' }
t.SpellRare03 = { bg = '#292426', style = 'undercurl', sp = '#2a5a30' }

t.Search    = { bg = cols.lightyellow, style = 'italic' }
t.IncSearch = { bg = cols.lightred, style = 'bold'  }

t.HlSearchLens     = { bg = cols.lightgray, fg = cols.yellow }
t.HlSearchLensNear = { bg = 'yellow', fg = cols.black, style = 'bold' }

t.Cursor       = { bg = '#22f022', style = 'bold'}
t.Cursori      = { bg = cols.purple }
t.TermCursor   = { bg = '#22f022', style = 'bold'}
t.Cursori      = { bg = cols.purple }
t.TermCursorNC = { bg = cols.purple }

t.DeniteCursorLine = { bg = '#483232' }
t.DenitePathHead   = { fg = '#3233ff' }
t.DenitePathTail   = { fg = '#ff7032' }

t.SpecialKey = { fg = cols.darkyellow }

t.PmenuSbar  = { fg = cols.red, bg = cols.lightgreen, style = 'bold' }

t.rnowebChunk        = { fg = cols.red }
t.rnowebSexpr        = { fg = cols.red }
t.rnowebDelimiter    = { fg = cols.cyan }
t.rnowebDelimiterEnd = { fg = cols.cyan, style = 'bold' }

t.FloatermBorder = { fg = '#9696ff', bg = cols.black, style = 'bold' }
t.Floaterm       = { bg = cols.black, fg = '#00ff00' }
t.Ranger         = { bg = cols.black, fg = '#ffffff' }
t.RnvimrNormal   = { bg = cols.black, fg = '#ffffff' }
t.RnvimrCurses   = { bg = cols.black, fg = '#ececec' }

t.MyQfNormal      = { fg = '#d8d8d2', bg = '#323232' }
t.MyQfLineNr      = { fg = '#f0f08a', bg = '#674842' }
t.MyQfEndOfBuffer = { fg = cols.red, bg = cols.yellow }
t.MyQfNonText     = { fg = cols.cyan, style = 'italic' }

t.qfFileName = { fg = cols.purble }
t.qfLineNr = { fg = cols.purble, bg = cols.bg }
t.qfSeparator = { fg = cols.black }
t.QuickFixLine = { bg = cols.lightred }

t.VimtexFrametitle = { fg = '#000000', bg = '#f0f08a', style = 'bold'}

t.GitSignsCurrentLineBlame = { fg = '#504945', style = 'italic' }

t.GitSignsAddLn    = { bg = '#acffac' }
t.GitSignsChangeLn = { bg = '#ffff8c' }
t.GitSignsDeleteLn = { bg = '#ffdfdf' }

t.SignColumn = { bg = cols.gray }

do
   t.VertSplit           = tbind({ fg = cols.black, style = 'bold' }, t.SignColumn)
   t.LineNr              = tbind({ fg = cols.black, style = 'bold' }, t.SignColumn)

   t.DiagnosticSignError = tbind({ fg = cols.red }, t.SignColumn )
   t.DiagnosticSignWarn  = tbind({ fg = cols.yellow }, t.SignColumn )
   t.DiagnosticSignInfo  = tbind({ fg = cols.cyan }, t.SignColumn )
   t.DiagnosticSignHint  = tbind({ fg = cols.cyan }, t.SignColumn )

   t.LspDiagnosticsSignError = tbind({ fg = cols.red }, t.SignColumn )
   t.LspDiagnosticsSignWarning  = tbind({ fg = cols.yellow }, t.SignColumn )
   t.LspDiagnosticsSignInformation  = tbind({ fg = cols.cyan }, t.SignColumn )
   t.LspDiagnosticsSignHint  = tbind({ fg = cols.cyan }, t.SignColumn )

   t.GitSignsAdd         = tbind({ fg = cols.green, style = 'bold' }, t.SignColumn )
   t.GitSignsDelete      = tbind({ fg = cols.red, style = 'bold'}, t.SignColumn )
   t.GitSignsChange      = tbind({ fg = cols.yellow, style = 'bold'}, t.SignColumn )
end

return t
