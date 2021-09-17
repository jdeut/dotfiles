source <sfile>:p:h/r.vim

call SetSqlSyntaxHi()

"let g:which_key_localleader_map['a'] = {
"\   'name' : '+template'
"\ }

nmap <silent><buffer> <LocalLeader>as
\   <Cmd>call RMakeRmd("prettydoc::html_pretty")<cr>
nmap <silent><buffer> <LocalLeader>ad
\   <Cmd>call RMakeRmd("rmdformats::readthedown")<cr>

