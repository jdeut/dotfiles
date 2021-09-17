"syntax clear texLigature

hi link texCmdSize texCmd
hi link texSpecialChar String
hi link texDelim texCmd
hi link texArg String

hi texLength guifg=#ae81ff guibg=NONE gui=italic
hi texRefArg guifg=#df6727 guibg=NONE gui=italic
hi texTabularChar guifg=#df6727 guibg=NONE gui=bold
hi texFootnoteArg guifg=#df6727 guibg=NONE gui=italic
hi texRefArgs guifg=#df6727 guibg=NONE gui=italic
hi texTikzZone guifg=#df6727 guibg=NONE gui=italic
hi texTikzDraw guifg=#33aa22 guibg=NONE gui=bold
hi texTikzSemicolon guifg=#33aa22 guibg=NONE gui=bold

hi! link texGroup texOpt
hi! link texNoSpellArg texOpt
hi! link texMathZoneX texOpt
highlight link texAuthorArg      texArg
highlight link texCmdBooktabs    texEnvArgName
highlight link texCmdItem        texArg
highlight link texMathEnvArgName texMathCmd
highlight link texMathSymbol     texMathCmd
highlight link texNewenvArgName  texArgNew
highlight link texPgfType        texCmd
highlight link texSpecialChar    texSymbol
highlight link texTabularChar    texMathOper


"function! s:highlight(group, guifg, guibg, attr)
  "let l:cmd = 'highlight ' . a:group
  "if a:guifg != ''
    "let l:cmd .= ' guifg=' . a:guifg
  "endif
  "if a:guibg != ''
    "let l:cmd .= ' guibg=' . a:guibg
  "endif
  "if a:attr != ''
    "let l:cmd .= ' gui='   . a:attr
  "endif
  "execute l:cmd
"endfunction

"let s:polar1  = '#161821'
"let s:polar2  = '#2E3440'
"let s:polar3  = '#3B4252'
"let s:polar4  = '#6B7089'
"let s:snow1   = '#C6C8D1'
"let s:snow2   = '#D8DEE9'
"let s:snow3   = '#E5E9F0'
"let s:frost1  = '#8FBCBB'
"let s:frost2  = '#88C0D0'
"let s:frost3  = '#81A1C1'
"let s:frost4  = '#5E81AC'
"let s:aurora1 = '#E27878'
"let s:aurora2 = '#E2A478'
"let s:aurora3 = '#EBCB8B'
"let s:aurora4 = '#A3BE8C'
"let s:aurora5 = '#A093C7'

"" basic groups
"call s:highlight('texCmd', s:frost3,  '', '')
"call s:highlight('texArg', s:aurora3, '', '')
"call s:highlight('texOpt', s:frost2,  '', '')

"" symbols
"call s:highlight('texSymbol',      s:aurora5, '', '')
"call s:highlight('texSpecialChar', s:frost3,  '', '')
"hi! link texDelim       texSymbol
"hi! link texTabularChar texSymbol

"" sectioning etc.
"call s:highlight('texCmdParts',     s:aurora2, '', '')
"call s:highlight('texPartArgTitle', s:aurora3, '', '')
"call s:highlight('texCmdTitle',     s:aurora2, '', '')
"call s:highlight('texCmdAuthor',    s:aurora2, '', '')
"call s:highlight('texTitleArg',     s:aurora3, '', 'bold')
"call s:highlight('texAuthorArg',    s:aurora3, '', 'italic')
"call s:highlight('texFootnoteArg',  s:snow1,   '', 'italic')

"" environments
"call s:highlight('texCmdEnv',     s:frost3,  '', '')
"call s:highlight('texEnvArgName', s:aurora2, '', '')
"call s:highlight('texEnvOpt',     s:aurora3, '', '')

"" mathmode
"call s:highlight('texMathRegion',      s:frost1, '', '')
"call s:highlight('texMathCmd',         s:frost2, '', '')
"call s:highlight('texMathDelim',       s:frost2, '', '')
"call s:highlight('texMathDelimRegion', s:frost3, '', '')
"call s:highlight('texMathCmdEnv',      s:frost3, '', '')
"call s:highlight('texMathEnvArgName',  s:frost3, '', '')
"hi! link texCmdMathText texCmdMathEnv
"hi! link texCmdMathEnv  texMathCmdEnv

"" labels and references
"call s:highlight('texCmdRef', s:frost3,  '', '')
"call s:highlight('texRefArg', s:aurora4, '', '')
"call s:highlight('texRefOpt', s:aurora5, '', '')
"call s:highlight('texUrlArg', s:frost4,  '', 'underline')
"hi! link texCmdCRef     texCmdRef
"hi! link texHrefArgLink texUrlArg
"hi! link texHrefArgText texOpt

"" files
"call s:highlight('texFileArg', s:aurora5, '', '')
"call s:highlight('texFileOpt', s:frost2,  '', '')

"" bibtex
"call s:highlight('bibType',     s:aurora2, '', '')
"call s:highlight('bibKey',      s:aurora4, '', '')
"call s:highlight('bibEntryKw',  s:frost1,  '', '')
"call s:highlight('bibVariable', s:aurora3, '', '')
