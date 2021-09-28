local formatprg = [[
    /usr/bin/bibtool
    -- print.use.tab=off
    -- print.indent=4
    -- preserve.keys=on
    -- preserve.key.case=on 
    -- print.align.key=0 
    -- delete.field={abstract} 
    -- delete.field={eprint} 
    -- delete.field={pmid} 
    -- delete.field={lccn} 
    -- delete.field={numpages} 
    -- delete.field={arxivid} 
    -- delete.field={note} 
    -- delete.field={address} 
    -- delete.field={archiveprefix} 
    -- delete.field={primaryclass} 
    -- delete.field={mendeley-tags} 
    -- delete.field={mendeley-groups} 
    -- delete.field={keywords} 
    -- delete.field={file} 
    -- suppress.initial.newline=on
    -- 'rewrite.rule { url  "^.*books.google.de.*$" "{}"}'
    -- 'rewrite.rule {      "^ *$" }'
    -- 'rewrite.rule {      "^{}$" }'
    -- 'rewrite.rule { "^([^\#]*)$"   = "{1}" }'
    -- 'rewrite.rule { "\# ([^\#]*)$" = "\# {1}" }'
    -d
    -r
    biblatex
]]

formatprg = string.gsub(formatprg, '\n', ' ')
vim.bo.formatprg = string.gsub(formatprg, ' %s*', ' ')
