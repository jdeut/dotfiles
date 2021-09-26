--local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

-- vim.cmd [[packadd packer.nvim]]

local util = require('packer.util')

--if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  --vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  --vim.api.nvim_command('packadd packer.nvim')
--end

local p = function()
    -- Packer can manage itself
 
    use { 'wbthomason/packer.nvim' }

    use { 'rktjmp/lush.nvim' } 

    use {"ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }

    use {"olimorris/onedark.nvim",
        requires = {"rktjmp/lush.nvim"},
        config = function() 
            -- print('op')
            --
            vim.cmd( [[
               augroup AuCustomizeColorScheme
                   autocmd!
                   au ColorScheme * lua require('au-hook-colorscheme').hook()
               augroup END
            ]])

            local onedark = require('onedark')

            onedark.setup({
                theme = 'onelight',
                colors = {
                   fg = '#000000', 
                   bg = '#ffffff',
                   white = '#ffffff',
                   yellow = '#bf8200',
                   -- purple = '#ffffff',
                   purple = '#9a12cf',
                   black = '#000000',
                   gray = '#2c2c2c',
                   cyan = '#00a4ae',
                   green = '#1d9a0d',
                   red = '#ba3621',
                   comment = '#797979',
                }, 
                styles = {
                   comments = 'italic',
                   keywords = 'bold'
                }
             })
             onedark.load()
        end
    }

    use { 'jalvesaq/Nvim-R',
        disable = false,
        -- branch = 'oldstable',
        config = function() 
            -- print('op')
        end
        -- disable = true
    }

    use { 'Shougo/denite.nvim',
         config = function()
             local cmd = 
                 [[source ]] .. 
                 vim.fn.stdpath('config') .. 
                 [[/Denite/init.vim]]

             vim.cmd (cmd)
         end
    }
    use { 'matsui54/denite-nvim-lsp' }
    use { 'delphinus/denite-floaterm',
        config = function() 
           vim.g.floaterm_autoclose   = 2
           vim.g.floaterm_title       = ' $1/$2 '
           vim.g.floaterm_borderchars = {
               '', '', '', '', '', '', '', '' 
           }
        end
    }
    use { 'raghur/fruzzy',
        run = function () vim.fn['fruzzy#install']() end,
        config = function() 
            vim.g['fruzzy#usenative']   = 1
            vim.g['fruzzy#sortonempty'] = 0
        end
    }
    use { 'ibhagwan/fzf-lua',
        requires = {
            'vijaymarupudi/nvim-fzf',
            'kyazdani42/nvim-web-devicons'
        },
        config = function()
            require('pluginconfig.fzf-lua')
        end
    }
    use { 'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'quangnguyen30192/cmp-nvim-ultisnips',
            'kdheepak/cmp-latex-symbols'
        },
        config = function()
            require('pluginconfig.nvim-cmp')

            vim.cmd([[autocmd FileType denite-filter lua require('cmp').setup.buffer { enabled = false }]])
            vim.cmd([[autocmd FileType gitcommit lua require('cmp').setup.buffer { enabled = false }]])
        end
    }
    use { 'vigoux/oak' }
    use { 'famiu/nvim-reload',
        config = function()
            require('nvim-reload').vim_reload_dirs = 
                { vim.fn.stdpath('config') .. '/*' }

            require('nvim-reload').lua_reload_dirs = 
                { vim.fn.stdpath('config') }
        end
    }
    use { 'fcpg/vim-fahrenheit' }
    use { 'srcery-colors/srcery-vim',
        config = function()
            vim.g.srcery_italic    = 1
            vim.g.srcery_bold      = 1
            vim.g.srcery_underline = 0
        end
    }
    use { 'mhartington/oceanic-next' }
    use { 'dracula/vim' }
    use { 'Th3Whit3Wolf/one-nvim' }
    use { 'gkapfham/vim-vitamin-onec' }
    use { 'agude/vim-eldar' }

    use { 'lfenzo/vim-fusion' }
    use { 'ekickx/clipboard-image.nvim',
        config = function()
            require'clipboard-image'.setup {
                default = {
                    img_dir = 'img',
                    img_dir_txt = 'img',
                    img_name = function () 
                        return vim.fn.input('Image filename: ')
                    end,
                    affix = '%s'
                    },
                tex = {
                    affix = '\\includegraphics{%s}'
                },
            }
        end
    }
    use { 'tanvirtin/monokai.nvim',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    use { 'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitsigns').setup( {
                numhl              = true,
                linehl             = false,
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text_pos = 'eol'
                },
                watch_gitdir = {
                    interval = 100,
                    follow_files = true
                },
                signs = {
                    add          = {text = '🞧'},
                    change       = {text = '⮛'},
                    delete       = {text = '🗶'},
                    topdelete    = {text = '‾'},
                    changedelete = {text = 'ⓒ'},
                },
                current_line_blame_formatter = function(name, blame_info, opts)
                  local text
                  if blame_info.author == '' then
                    text = blame_info.author
                  else
                    local date_time

                    date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))

                    text = string.format('%s - %s', date_time, blame_info.summary)
                  end

                  return {{'          ' .. text, 'GitSignsCurrentLineBlame'}}
                end,
            })
        end
    }
    use { 'dannywillems/vim-icalendar' }
    use { 'kdav5758/TrueZen.nvim' }
    use { 'L3MON4D3/LuaSnip',
        config = function()
            require('LuaSnip/test')

            -- imap <silent> <F3> <cmd>lua require'luasnip'.expand_or_jump()<Cr>
            -- inoremap <silent> <F4> <cmd>lua require'luasnip'.jump(-1)<Cr>
            --
            -- snoremap <silent> <F3> <cmd>lua require'luasnip'.jump(1)<Cr>
            -- snoremap <silent> <F4> <cmd>lua require'luasnip'.jump(-1)<Cr>
        end
    }
    use { 'jacoborus/tender.vim' }
    use { 'equalsraf/neovim-gui-shim' }
    use { 'rhysd/vim-grammarous',
        config = function()
            vim.g['grammarous#disabled_rules'] = {
               ['*'] = {
                  'TYPOGRAFISCHE_ANFUEHRUNGSZEICHEN',
                  'LEERZEICHEN_HINTER_DOPPELPUNKT',
                  'WHITESPACE_RULE',
                  'ARROWS',
                  'PFEILE'
               }
            }
        end
    }
    use { 'tyru/open-browser.vim',
        config = function()
            vim.g.openbrowser_browser_commands = {
                {
                    args = {
                        "env",
                        "-i", "DISPLAY=:0", "{browser}",
                        "-n", "{uri}"
                    },
                    name = "luakit"
                },
                {
                    args = {
                        "{browser}", "-n", "{uri}"
                    },
                    name = "recoll"
                }
            }

            vim.g.openbrowser_search_engines = {
               wortbuch =        'https://www.dwds.de/?q={query}',
               loveapiref =      'http://love2d-community.github.io/love-api/#{query}',
               tex =             'https://www.google.com/search?q=site:tex.stackexchange.com+{query}',
               googlebooks =     'https://www.google.de/search?hl=de&tbo=p&tbm=bks&q={query}&tbs=,bkv:p,cdr:1,cd_min:01.01.1995&num=50',
               semanticscholar = 'https://www.semanticscholar.org/search?q={query}',
               googlescholar =   'https://scholar.google.de/scholar?hl=de&q={query}',
               google =          'https://google.com/search?q={query}',
               github =          'https://github.com/search?type=code&q={query}'
            }
       end
    }
    use { 'borissov/fugitive-gitea',
        config = function()
            vim.g.fugitive_gitea_domains = {
               'https://energien.uber.space/gitea'
            }
        end
    }
    use { 'romainl/vim-cool' }
    use { 'folke/which-key.nvim',
        config = function()
            require('pluginconfig.whichkey')
        end
    }
    -- use { 'numtostr/FTerm.nvim',
    --    config = function()
    --       local fterm = require("FTerm")
    --       fterm.setup({
    --           border = 'double'
    --       })
    --    end
    -- }
    use { 'voldikss/vim-floaterm',
        disable = false
    }
    use { 'powerman/vim-plugin-AnsiEsc' }
    use { 'Matt-Deacalion/vim-systemd-syntax' }
    use { 'lukas-reineke/indent-blankline.nvim',
        require("indent_blankline").setup {
            char = '▏',
            char_highlight_list = { "IndentBlankline" },
            buftype_exclude = {"terminal"}
      }
    }
    use { 'Pocco81/AutoSave.nvim',
        config = function()
           local autosave = require("autosave")           vim.g.auto_save_silent = 1

           autosave.hook_after_saving = function()
               autosave.setup({
                  execution_message = "AutoSave: " .. vim.fn.strftime("%H:%M:%S")
               })
           end

           autosave.setup( {
               enabled = true,
               execution_message = "AutoSave: " .. vim.fn.strftime("%H:%M:%S"),
               events = {"InsertLeave", "WinLeave", "TextChanged"},
               conditions = {
                   exists = true,
                   filetype_is_not = {},
                   modifiable = true
               },
               write_all_buffers = false,
               on_off_commands = true,
               clean_command_line_interval = 3000,
               debounce_delay = 50
           } )
        end
    }
    use { 'glts/vim-texlog' }
    use { 'jghauser/mkdir.nvim',
        config = function()
            require('mkdir')
        end
    }
    use { 'phaazon/hop.nvim',
        config = function()
           require'hop'.setup { 
              keys          = 'asdfjkl;qwnm<',
              term_seq_bias = 0.5
           }
        end
    }
    use { 'winston0410/range-highlight.nvim',
        requires = 'winston0410/cmd-parser.nvim',
        config = function()
            require'range-highlight'.setup{}
        end
    }
    use { 'b3nj5m1n/kommentary',
        setup = function()
           vim.g.kommentary_create_default_mappings = false
        end,
        config = function()
           require('kommentary.config').configure_language('default', {
              prefer_single_line_comments = true,
              use_consistent_indenation   = true,
              ignore_whitespace           = false
           })
        end
    }
    use { 'SirVer/ultisnips',
        config = function()
            -- let g:ulti_expand_or_jump_res = 0 "default value, just set once
            -- function! Ulti_ExpandOrJump_and_getRes()
            --    call v:lua.MPairs.disable_filetype_set()
            --    call UltiSnips#ExpandSnippetOrJump()
            --    call v:lua.MPairs.disable_filetype_reset()
            --    return ""
            -- endfunction
           
            vim.g.UltiSnipsSnippetsDir         = '~/.config/nvim/UltiSnips'
            vim.g.UltiSnipsEditSplit           = 'vertical'
            vim.g.UltiSnipsListSnippets        = '<leader><C-f>'
            vim.g.UltiSnipsExpandTrigger       = '<C-f>'
            vim.g.UltiSnipsJumpForwardTrigger  = '<C-f>'
            vim.g.UltiSnipsJumpBackwardTrigger = '<C-j>'
        end
    }
    use { 'ludovicchabant/vim-gutentags',
        config = function()
            vim.g.gutentags_define_advanced_commands = 1
            vim.g.gutentags_file_list_command = {
                markers =  {
                    ['.git'] = 'git ls-files',
                    ['.hg']  = 'hg files'
                }
            }
        end
    }
    use { 'tpope/vim-fugitive',
        config = function()
            vim.cmd([[command! ToggleGStatus :call init_custom_fn#ToggleGStatus()]])
        end
    }
    use { 'chaoren/vim-wordmotion',
        config = function()
            vim.g.wordmotion_uppercase_spaces = {
                '"', "'", '[', ']', '(', ')', '{', '}',
                '/', [[\]], '_', '-', '.', ',', ':'
            }

            vim.g.wordmotion_mappings = {
                W = [[''w]], B = [[''b]],
                E = [[''e]], gE = [[]],
                w = [['w]], b = [['b]],
                e = [['e]], ge = [[]],
                aw = [['aw]], iw = [['iw]],
                ['<C-R><C-W>'] = [['<C-R><C-w>]]
            }
        end
    }
    use { 'airblade/vim-rooter',
        config = function()
            vim.g.rooter_change_directory_for_non_project_files = 'current'
        end
    }
    use { 'junegunn/vim-easy-align' }
    use { 'farmergreg/vim-lastplace' }
    use { 'neovim/nvim-lspconfig',
        config = function()
            p = require('lspconfig')

            p.texlab.setup{}
            p.r_language_server.setup{}
        end
    }
    use {
        'onsails/lspkind-nvim',
        config = function()
            require('lspkind').init {}
        end
    }
    use { 'kabouzeid/nvim-lspinstall',
        config = function()
            require('pluginconfig.LSP.main')
        end
    }
    use { 'p00f/nvim-ts-rainbow',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require'nvim-treesitter.configs'.setup {
                rainbow = {
                    enable        = true,
                    extended_mode = true
                }
            }
        end,
        disable = false
    }
    use { 'luochen1990/rainbow',
        disable = true
    }
    use { 'euclidianAce/BetterLua.vim' }
    use { 'akinsho/nvim-toggleterm.lua',
        config = function()
            require('pluginconfig.toggleterm')
        end
    }
    use { 'stevearc/vim-arduino' }
    use { 'lervag/vimtex' }
    use { 'vim-pandoc/vim-pandoc' }
    use { 'vim-pandoc/vim-pandoc-syntax' }
    use { 'WolfgangMehner/perl-support',
        config = function()
           vim.g.Perl_PerlTags = 'on'
        end
    }
    use { 'liuchengxu/graphviz.vim' }
    use { 'davidhalter/jedi-vim' }
    use { 'kynan/dokuvimki',
        config = function()
            vim.g.DokuVimKi_USER = ""
            vim.g.DokuVimKi_PASS = ""
            vim.g.DokuVimKi_URL  = ""
        end
    }
    use { 'monaqa/dial.nvim' }
    use { 'NLKNguyen/papercolor-theme' }

    use { 'sgur/vim-textobj-parameter',
        requires = { 'kana/vim-textobj-user' }
    }
    use { 'mllg/vim-devtools-plugin',
        ft =  {'r', 'rmd', 'rdoc', 'rnoweb'}
    }
    use { 'davisdude/vim-love-docs',
        run = './src/gen.sh'
    }
    use { 'rrethy/vim-hexokinase',
        run = 'make hexokinase',
        config = function() vim.g.Hexokinase_ftDisabled = {'denite', 'denite-filter'} end
    }
    use {
        'AckslD/nvim-revJ.lua',
        requires = {'sgur/vim-textobj-parameter'},
        config = function()
            require('revj').setup{
                brackets = {first = '([', last = ')]'},
                enable_default_keymaps = false,
                add_seperator_for_last_parameter = false
            }
        end
    }

    use { 'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use { 'shadmansaleh/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true 
        },
        config = function()
            require('pluginconfig.lualine')
        end
    }

    -- DISABLED

    use { 'Shougo/neoyank.vim',
        requires = 'Shougo/denite.nvim',
        disable = 1,
        config = function()
            vim.g['neoyank#limit']          = 2
            vim.g['neoyank#save_registers'] = {'"', '0', '+', '*'}
            vim.g['neoyank#save_registers'] = {'"', '0', '+', '*'}
            vim.g['neoyank#disable_write']  = 1
            vim.g['neoyank#file'] = 
               '/home/johannes/.cache/nvim/yankring.txt'
        end
    }
    use { 'f-person/git-blame.nvim',
        disable = 1
    }
    use { 'windwp/nvim-autopairs.git' ,
        requires = 'nvim-treesitter/nvim-treesitter',
        disable = 1
    }
    use { 'vim-airline/vim-airline',
        disable = 1
    }
    use { 'vim-airline/vim-airline-themes',
        disable = 1
    }
    use { 'Shougo/deoplete.nvim',
        disable = 1
    }
    use { 'yasukotelin/shirotelin' }
    use { 'liuchengxu/vim-which-key',
        disable = 1
    }
    use { 'wellle/targets.vim',
        disable = 1
    }
    use { 'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        disable = 1
    }
end


return require('packer').startup ({
    p,
    config = {
        -- auto_reload_compiled = true,
        -- package_root = util.join_paths(
        --         vim.fn.stdpath('data'),
        --         'site',
        --         'pack'
        --     ),
        -- compile_path = util.join_paths(
        --         vim.fn.stdpath('config'),
        --         'plugin',
        --         'packer_compiled.vim'
        --     ),
        display = {
            non_interactive = false,
            open_cmd = 'leftabove 60vnew',
            max_jobs = 1,
            git = {
                timeout=3
            }
        }
        -- ,
        -- profile = {
        --     enable = true
        -- }
    }
})
