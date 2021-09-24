require('which-key').register({
    e = {
        name = 'sss',
        i = {[[<plug>(vimtex-info-full)]], 'vimtex-info-full'}
        m = {[[<plug>(vimtex-toggle-main)]], 'vimtex-toggle-main'}
    },
    g = {
        name = 'browser',
        t = {[[<Cmd>execute "OpenBrowserSmartSearch -tex ".expand('<cword>')<CR>]], 'tex'}
    },
    l = {
        name = 'Build related',
        l = {[[:w<cr>:VimtexCompile<cr>]], 'Compile'}
    },
    r = {
        name = 'Run related',
        l = {[[:w<cr>:VimtexCompile<cr>]], 'Compile'},
        b = { function()
                 require('plenary.job'):new({
                       command = 'zathura',
                       args = { [[--fork]],
                           vim.fn.expand('%:h') .. [[/]] .. 
                           vim.b.ftype_tex_build_dir .. [[/]] .. 
                           vim.fn.expand('%:t:r') .. [[.pdf]],
                       }
                 }):sync()
              end, 'open'
        },
        g = { function()
                  local x = vim.b.vimtex.compiler
                  vim.cmd(
                      [[botright vsplit ]] .. x.root .. 
                      [[/]] .. x.build_dir .. 
                      [[/]] .. x.target:gsub(".tex$", ".log")
                  )
              end, 'open'
        },
    }
}, {
    buffer = 0,
    prefix = '<localleader>'
})

-- noremap <buffer> <localleader>lg <Cmd>lua x = vim.b.vimtex.compiler
-- \   vim.cmd("botright vsplit " .. x.root .. [[/]] .. x.build_dir .. [[/]] .. x.target:gsub(".tex$", ".log"))<CR>

-- noremap <buffer> <localleader><localleader>n <Cmd>lua x = vim.b.vimtex.compiler
-- \   vim.cmd([[DeniteProjectDir file -no-immediately-1 -relpath=texinputs]])<CR>

-- function! MyTexdocHandler(context)
--     call vimtex#doc#make_selection(a:context)
--     if !empty(a:context.selected)
--         execute '!texdoc' a:context.selected '&'
--     endif
--     return 1
-- endfunction

-- "let g:which_key_localleader_map['e'] = {
-- "\   'name' : '+vimtex'
-- "\ }
-- noremap <buffer> <localleader>ei <plug>(vimtex-info-full)

-- noremap <buffer> <localleader>em <plug>(vimtex-toggle-main)
--
-- "let g:which_key_localleader_map['g'] = {
-- "\   'name' : '+Format_Browser'
-- "\ }

-- "let g:which_key_localleader_map['l'] = {
-- "\   'name' : '+Compile'
-- "\ }
