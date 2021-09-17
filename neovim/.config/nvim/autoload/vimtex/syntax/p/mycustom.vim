function! vimtex#syntax#p#mycustom#load() abort

    syntax match texCmdMycustom nextgroup=texMycustomArg skipwhite "\\thead\>\s*"
    syntax match texCmdMycustom nextgroup=texMycustomArg skipwhite "\\myfullcite\>\s*"
    syntax match texCmdMycustom nextgroup=texMycustomArg skipwhite "\\caption\>\s*"
    syntax match texCmdMycustom nextgroup=texMycustomArg skipwhite "\\makenoteparagraph\>"

    syntax match texCmdMycustom nextgroup=texMycustomArg "\\enquote\>\s*"

    call vimtex#syntax#core#new_arg('texMycustomArg')

    highlight def link texCmdMycustom texCmd
    highlight def link texMycustomArg String

endfunction
