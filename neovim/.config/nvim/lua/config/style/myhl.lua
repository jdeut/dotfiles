local t                            = {}

local cols                         = require 'style.mycols'

local tbind                        = function(t1, t2) return vim.tbl_deep_extend('keep', t1, t2) end

t.Normal                           = { fg = '#111111', bg = '#ffffff' }

t.NonText                          = { fg = cols.semilightgray, bg = 'NONE' }
t.Folded                           = { fg = cols.black, bg = cols.lightgreen, style = 'italic' }
t.FoldColumn                       = { fg = cols.red, bg = 'blue', style = 'bold' }

t.Whitespace                       = { fg = '#353522' }

t.MiniTrailspace                   = { bg = cols.lightred }

t.MatchParen                       = { fg = cols.brightpurple, bg = cols.matchup_bg, style = 'bold' }
-- t.MatchBackground = { bg = cols.matchup_bg, style = 'bold' }
t.MatchBackground                  = { bg = cols.matchup_bg }

t.EndOfBuffer                      = { bg = cols.lightgray, fg = cols.cyan, style = 'italic' }

t.IndentBlankline                  = { fg = cols.purple }

t.CmpItemMenu                      = { fg = cols.fg }
t.CmpItemAbbrMatchFuzzy            = { fg = cols.brightgreen }

t.Pmenu                            = { bg = cols.lightgreen }

t.WhichKey                         = { fg = cols.darkyellow, style = 'bold' }
t.WhichKeyFloat                    = { bg = cols.lightgreen }
t.WhichKeyGroup                    = { fg = cols.darkblue }
t.WhichKeyDesc                     = { fg = cols.darkgray }
t.WhichKeyValue                    = { fg = cols.red }
t.WhichKeySeparator                = { fg = cols.comment }

t.FloatBorder = { fg = cols.darkblue, bg = cols.lightgreen }

t.WildMenu                         = { fg = cols.green, style = 'italic' }

t.RegTitle                         = { fg = cols.green, style = 'italic' }
t.RegName                          = { fg = cols.green, style = 'italic' }
t.RegPrefix                        = { fg = cols.green, style = 'italic' }

t.HopNextKey                       = { bg = cols.fg, fg = cols.bg, style = 'bold' }
t.HopNextKey1                      = { bg = cols.brightyellow, fg = cols.purple, style = 'bold' }
t.HopNextKey2                      = { bg = cols.fg, fg = cols.bg, style = 'bold' }
t.HopUnmatched                     = { fg = cols.lightblue }
t.HopCursor                        = t.HopUnmatched

t.ColorColumn                      = { bg = cols.lightgray }

t.RainbowDelimiterOutest           = { fg = '#c400f3', style = 'bold' }
t.rainbowcol1                      = { fg = '#c400f3', style = 'bold' }
t.rainbowcol2                      = { fg = '#5b0092', style = 'bold' }
t.rainbowcol3                      = { fg = '#0000aa', style = 'bold' }
t.rainbowcol4                      = { fg = cols.green, style = 'bold' }
t.rainbowcol5                      = { fg = cols.darkyellow, style = 'bold' }
t.rainbowcol6                      = { fg = '#bb6f00', style = 'bold' }
t.rainbowcol7                      = { fg = '#aa0000', style = 'bold' }

t.TabLineSel                       = { fg = cols.black, bg = cols.white }
t.TabLine                          = { fg = cols.comment, bg = '#3e4452' }
t.TabLineFill                      = { bg = '#3e4452' }

t.FfzLuaDefault                    = { bg = cols.gray, fg = cols.black }

t.SpellBad                         = { style = 'undercurl', sp = cols.green }
t.SpellRare01                      = { bg = '#552525', style = 'undercurl', sp = '#5aaa60' }
t.SpellRare02                      = { bg = '#402526', style = 'undercurl', sp = '#3a6a30' }
t.SpellRare03                      = { bg = '#292426', style = 'undercurl', sp = '#2a5a30' }

t.Search                           = { bg = cols.lightyellow, style = 'italic' }
t.IncSearch                        = { bg = cols.lightred, style = 'bold' }

t.HlSearchLens                     = { bg = cols.lightgray, fg = cols.yellow }
t.HlSearchLensNear                 = { bg = 'yellow', fg = cols.black, style = 'bold' }

t.Cursor                           = { bg = '#22f022', style = 'bold' }
t.Cursori                          = { bg = cols.purple }
t.TermCursor                       = { bg = '#22f022', style = 'bold' }
t.Cursori                          = { bg = cols.purple }
t.TermCursorNC                     = { bg = cols.purple }

t.DeniteCursorLine                 = { bg = '#483232' }
t.DenitePathHead                   = { fg = '#3233ff' }
t.DenitePathTail                   = { fg = '#ff7032' }

t.SpecialKey                       = { fg = cols.darkyellow }

t.PmenuSbar                        = { fg = cols.red, bg = cols.lightgreen, style = 'bold' }

t.rnowebChunk                      = { fg = cols.red }
t.rnowebSexpr                      = { fg = cols.red }
t.rnowebDelimiter                  = { fg = cols.cyan }
t.rnowebDelimiterEnd               = { fg = cols.cyan, style = 'bold' }

t.FloatermBorder                   = { fg = '#9696ff', bg = cols.black, style = 'bold' }
t.Floaterm                         = { bg = cols.black, fg = '#00ff00' }
t.Ranger                           = { bg = cols.black, fg = '#ffffff' }
t.RnvimrNormal                     = { bg = cols.black, fg = '#ffffff' }
t.RnvimrCurses                     = { bg = cols.black, fg = '#ececec' }

t.MyQfNormal                       = { fg = '#d8d8d2', bg = '#323232' }
t.MyQfLineNr                       = { fg = '#f0f08a', bg = '#674842' }
t.MyQfEndOfBuffer                  = { fg = cols.red, bg = cols.yellow }
t.MyQfNonText                      = { fg = cols.cyan, style = 'italic' }

t.qfFileName                       = { fg = cols.purble }
t.qfLineNr                         = { fg = cols.purble, bg = cols.bg }
t.qfSeparator                      = { fg = cols.black }
t.QuickFixLine                     = { bg = cols.lightred }

t.VimtexFrametitle                 = { fg = '#000000', bg = '#f0f08a', style = 'bold' }

t.IndentBlanklineIndent1           = { fg = '#ff4C45', style = 'bold' }
t.IndentBlanklineIndent2           = { fg = '#E5a02B', style = 'bold' }
t.IndentBlanklineIndent3           = { fg = '#20e339', style = 'bold' }
t.IndentBlanklineIndent4           = { fg = '#6606ff', style = 'bold' }
t.IndentBlanklineIndent5           = { fg = '#01cFfF', style = 'bold' }
t.IndentBlanklineIndent6           = { fg = '#f608fD', style = 'bold' }

t.MyFzfLuaDefault                  = t.Normal
t.MyFzfLuaBorder                   = t.Normal

t.NormalFloat                      = { bg = cols.lightgreen }
-- t.FloatBorder = { bg = cols.semilightgray }

t.MyFzfBg                          = { bg = cols.black }
t.MyFzfFg                          = { fg = cols.orange }
t.MyFzfHigh                        = { fg = cols.purple }

t.MyFzfBgPlus                      = { bg = cols.gray }
t.MyFzfFgPlus                      = { fg = cols.brightcyan }
t.MyFzfHighPlus                    = { fg = cols.brightpurple }

t.MyFzfPrompt                      = { fg = cols.brightgreen }
t.MyFzfSpinner                     = { fg = cols.brightcyan }

t.MyFzfGutter                      = { bg = cols.cyan }

t.MyFzfInfo                        = { fg = cols.brightyellow, style = 'bold' }
t.MyFzfMarker                      = { fg = cols.lightgreen }
t.MyFzfPointer                     = { fg = cols.brightcyan }

t.MyModifiable                     = { bg = cols.lightorange }

t.DiagnosticVirtualTextError       = { fg = '#bd5555', style = 'bold' }
t.DiagnosticVirtualTextWarning     = { fg = cols.comment, style = 'italic' }
t.DiagnosticVirtualTextHint        = { fg = cols.comment, style = 'italic' }
t.DiagnosticVirtualTextInformation = { fg = cols.cyan, style = 'italic' }

t.DiagnosticFloatingError          = { fg = '#bd5555', style = 'bold' }
t.DiagnosticFloatingWarning        = { fg = cols.comment, style = 'italic' }
t.DiagnosticFloatingHint           = { fg = cols.comment, style = 'italic' }
t.DiagnosticFloatingInformation    = { fg = cols.cyan, style = 'italic' }

t.DiagnosticUnderlineError         = { fg = cols.blue, style = 'bold' }
t.DiagnosticUnderlineWarning       = { fg = cols.blue, style = 'italic' }
t.DiagnosticUnderlineHint          = { fg = cols.green, style = 'italic' }
t.DiagnosticUnderlineInformation   = { fg = cols.yellow, style = 'italic' }

t.IndentBlanklineIndent1           = { fg = '#be9af7' }
t.IndentBlanklineIndent2           = { fg = '#82aaf0' }
t.IndentBlanklineIndent3           = { fg = '#addb67' }
t.IndentBlanklineIndent4           = { fg = '#ecc48d' }
t.IndentBlanklineIndent5           = { fg = '#FD9720' }
t.IndentBlanklineIndent6           = { fg = '#ff5874' }

t.SignColumn                       = { bg = cols.gray, style = 'bold' }

t.VertSplit                        = tbind({ fg = cols.black, style = 'bold' }, t.SignColumn)
t.LineNr                           = tbind({ fg = cols.black, style = 'bold' }, t.SignColumn)

t.DiagnosticSignError              = tbind({ fg = cols.red }, t.SignColumn)
t.DiagnosticSignWarn               = tbind({ fg = cols.yellow }, t.SignColumn)
t.DiagnosticSignInfo               = tbind({ fg = cols.cyan }, t.SignColumn)
t.DiagnosticSignHint               = tbind({ fg = cols.cyan }, t.SignColumn)

-- onenord links DiagnosticSignWarn to LspDiagnosticsSignWarning etc.
t.LspDiagnosticsSignWarning        = tbind({ fg = cols.orange, style = 'italic' }, t.SignColumn)
t.LspDiagnosticsSignInformation    = tbind({ fg = cols.yellow, style = 'italic' }, t.SignColumn)
t.LspDiagnosticsSignError          = tbind({ fg = cols.red, style = 'italic' }, t.SignColumn)

t.LspDiagnosticsVirtualTextWarning = { fg = cols.orange, style = 'italic' }
t.LspDiagnosticsVirtualTextInformation = { fg = cols.green, style = 'italic' }
t.LspDiagnosticsVirtualTextError = { fg = cols.red, style = 'italic' }

t.MarkSignHL               = tbind({ fg = cols.brightgreen, style = 'bold' }, t.SignColumn)

-- when `config.linehl == true`
t.GitSignsCurrentLineBlame = { fg = '#504945', style = 'italic' }
t.GitSignsAddLn            = { bg = '#acffac' }
t.GitSignsChangeLn         = { bg = '#ffff8c' }
t.GitSignsDeleteLn         = { bg = '#ffdfdf' }

t.GitSignsAdd              = tbind({ fg = cols.green, style = 'bold' }, t.SignColumn)
t.GitSignsDelete           = tbind({ fg = cols.red, style = 'bold' }, t.SignColumn)
t.GitSignsChange           = tbind({ fg = cols.red, style = 'bold' }, t.SignColumn)

return t
