t = {}

local mappings = {
    k = {[[:VimtexDocPackage<CR>]], 'vimtex-info-full'},
    e = {
       name = 'VimtexInfo',
       i = {[[<plug>(vimtex-info-full)]], 'vimtex-info-full'},
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
}

t.set_mappings = function()
    require('which-key').register(mappings, {
        buffer = 0,
        prefix = '<localleader>'
    })
end

return t
