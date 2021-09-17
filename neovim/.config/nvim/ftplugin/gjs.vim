
nnoremap <buffer> <LocalLeader>rr
\   <Cmd>FloatermNew --position=bottomright
\   cat % <bar> xargs -d "@" gdbus call --session 
\   --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval <cr>
