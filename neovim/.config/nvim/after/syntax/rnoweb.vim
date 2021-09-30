"syntax clear texLigature
"
syn cluster texMathMatchGroup add=rnowebSexpr

syn region rnowebChunk 
\   matchgroup=rnowebDelimiter start="^<<.*>>="
\   matchgroup=rnowebDelimiterEnd end="^@"
\   contains=@rnowebR,rnowebChunkReference,rnowebChunk  
\   fold keepend

syn region rnowebSexpr
\   matchgroup=rnowebDelimiterEnd start="\\Sexpr{"
\   matchgroup=rnowebDelimiterEnd end="}"
\   contains=@rnowebR,rnowebSexpr

" hi def link rnowebDelimiter Delimiter

"syn match rnowebDelimiter \".*\" contains=rnowebChunkStartEnd
syn match rnowebChunkStartEnd "@"
