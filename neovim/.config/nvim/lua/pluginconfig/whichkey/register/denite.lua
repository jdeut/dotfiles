wk = require("which-key")

wk.register({
    name = 'Hop',

    ['1'] = { function()
            require'pluginconfig.fzf-lua'.custom.git_files({
               cwd = [[/home/johannes/.dotfiles/neovim/.config/nvim]]
            })
        end, 
        [[Nvim Config Dir]]
    },
    ['2'] = { function()
            require'pluginconfig.fzf-lua'.custom.git_files({
               cwd = [[/home/johannes/.dotfiles]]
            })
        end, 
        [[Dotfiles]]
    },

    ["<leader>"] = {

        name = 'Denite',
        s = { [[<Cmd>DeniteProjectDir -buffer-name=files -winheight=35]] ..
              [[ -winwidth=69 -matchers=matcher/ignore_current_buffer,]] ..
              [[matcher/fruzzy]], [[Project Dir 2]] },
        -- x = { [[:FloatermNew --name=browse_git_dirs --opener=vsplit --autoclose=2]] ..
        --       [[ --width=0.8 --height=0.8 <C-R>=g:nvim_config_home<CR>]] ..
        --       [[/shscripts/mrcgitdirs.sh<CR>]], [[Recent Projects]] },
        -- n = { [[<Cmd>Denite -buffer-name=files]] ..
        --       [[ -matchers=matcher/ignore_current_buffer file/old<CR>]],
        --       [[Recent Files]] },
        b = { [[<Cmd>Denite -matchers=matcher/ignore_current_buffer,]] ..
              [[matcher/substring buffer<CR>]], [[Buffer]] },
        d = { [[<Cmd>Denite -resume<CR>]], [[Resume]] },
        m = { [[<Cmd>Denite -winwidth=50 -quick-move=immediately]] ..
              [[ menu:custom<cr>]], [[Menu]] },

        ['8'] = { function()
                local m = require'fzf-lua.path'
                local path = vim.fn.expand('%:p:h')
                local cwd = m.git_root(path, 0)

                if not cwd then
                    cwd = path
                end

                require "fzf-lua".grep_cword({
                    cwd = cwd
                })
            end, [[Grep Ftype]]
        },

        ['/'] = { function()
                local m = require'fzf-lua.path'
                local path = vim.fn.expand('%:p:h')
                local cwd = m.git_root(path, 0)

                if not cwd then
                    cwd = path
                end

                require "fzf-lua".grep({
                    cwd = cwd
                })
            end, [[Grep Ftype]]
        },

        ['?'] = { function()
                require'fzf-lua'.grep({
                    continue_last_search = true
                })
            end, [[Grep Ftype]]
        },

        ['/'] = { function()
                local m = require'fzf-lua.path'
                local path = vim.fn.expand('%:p:h')
                local cwd = m.git_root(path, 0)

                if not cwd then
                    cwd = path
                end

                require "fzf-lua".grep({
                    cwd = cwd
                })
            end, [[Grep Ftype]]
        },

        f = { function()
                require'fzf-lua'.buffers({
                    winopts = {
                        win_width = '0.4',
                    },
                    preview_horizontal = 'right:40%',
                    ignore_current_buffer = true
                }) 
            end, 
            [[Help]] 
        },

        h = { require'fzf-lua'.help_tags, [[Help]] },
        a = { function()
                require'pluginconfig.fzf-lua'.custom.git_files{
                    preview_opt = 'hidden'
                }
            end, [[Git Files]]
        },
        n = { function() 
                require'fzf-lua'.oldfiles{ 
                    preview_opts = 'hidden'
                } 
            end, [[Oldfiles]] 
        },
        -- a = { [[<Cmd>DeniteProjectDir -split=tab -buffer-name=files -statusline]] ..
        --       [[ -filter-split-direction=botright -winheight=160]] ..
        --       [[ -matchers=matcher/ignore_current_buffer,]] ..
        --       [[matcher/fruzzy,matcher/ignore_globs]] ..
        --       [[ file/rec/git/tracked<CR>]], [[Project Dir]] },
        [","] = { [[<Cmd>Denite -resume -cursor-pos=+1 -immediately<CR>]],
                  [[Cursor Down]] },
        ["."] = { [[<Cmd>Denite -resume -cursor-pos=-1 -immediately<CR>]],
                  [[Cursor Up]] },

        ["<space>"] = { [[<Cmd>Denite -winwidth=70 command_history<cr>]],
                        [[Command Hist]] },

        ["<leader>"] = {
            name = "Specific",
            g = { [[:DeniteCursorWord grep::]], [[Grep Generic]] },
            h = { [[<Cmd>DeniteCursorWord help<cr>]], [[Help]] }
        }
    }
},  {
    mode = "n", prefix = "<leader>", buffer = nil, silent = false, noremap = true
})

-- "sorter
-- inoremap <silent><buffer> <leader>sb
-- \   <Cmd>call denite#call_map('change_sorters', 'sorter/sublime')<cr>
-- inoremap <silent><buffer> <leader>sw
-- \   <Cmd>call denite#call_map('change_sorters', 'sorter/word')<cr>
-- inoremap <silent><buffer> <leader>sr
-- \   <Cmd>call denite#call_map('change_sorters', 'sorter/oldfiles')<cr>

vim.cmd('autocmd FileType denite-filter lua setDeniteFilterKeybinds()')

local call_map = vim.fn['denite#call_map']

local d = {
   quit = 
      function(action) call_map('quit') end,
   doaction1 = 
      function(action) call_map('do_action') end,
   doaction = 
      function(action) call_map('do_action', action) end,
   toggleselectall =
      function(action) call_map('toggle_select_all') end,
   chooseaction =  
      function() call_map('choose_action') end,
   togglematchers =  
      function(matcher) call_map('toggle_matchers', 'matcher/' .. matcher) end
}

function setDeniteFilterKeybinds()

    local opts = { mode = 'i', prefix = '', buffer = 0 }

    wk.register ({
        ['<leader>'] = {
            ['<leader>'] = {
               [[<CR>]], 'return'
            },
            t = {
               a = {
                   function() d.togglematchers('match_fuzzy') end, [[fuzzy]]
               },
               s = {
                   function() d.togglematchers('match_substring') end, [[substring]]
               },
               r = {
                   function() d.togglematchers('regexp') end, [[regexp]]
               },
               f = {
                   function() d.togglematchers('fruzzy') end, [[fruzzy]]
               },
               p = {
                   function() d.togglematchers('project_files') end, [[project files]]
               }
            },
            a = { function() d.toggleselectall() end, [[Select All]] },
            q = { function() d.doaction('quickfix') end, [[Quickfix]] },
            y = { function() d.doaction('yank') end, [[Yank]] },
            p = { function() d.doaction('preview') end, [[Preview]] },
            d = { function() d.doaction('vsplit') end, [[VSplit]] },
            s = { function() d.doaction('split') end, [[Split]] },
            f = { function() d.doaction('tabswitch') end, [[VSplit]] },
            j = { function() d.chooseaction() end, [[Choose Action]] }
        },
        ['<Esc>'] = { function() d.quit() end, [[Exit]] },
        ['<CR>'] = { function() d.doaction1() end, [[Do Action]] },
        ['<C-n>'] = { function() vim.fn['denite#increment_parent_cursor'](1) end, [[Do Action]] },
        ['<C-p>'] = { function() vim.fn['denite#increment_parent_cursor'](-1) end, [[Do Action]] }
    }, opts )

end
