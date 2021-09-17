"syntax clear texLigature

syn region rnowebChunk matchgroup=rnowebDelimiter start="^<<.*>>=" matchgroup=rnowebDelimiterEnd end="^@" contains=@rnowebR,rnowebChunkReference,rnowebChunk fold keepend

"syn match rnowebDelimiter \".*\" contains=rnowebChunkStartEnd
syn match rnowebChunkStartEnd "@"

hi rnowebDelimiter guifg=#00dd00
hi rnowebDelimiterEnd gui=bold guifg=#00ff00 guibg=NONE
