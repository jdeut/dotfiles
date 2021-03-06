-- local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
--
-- vim.cmd [[packadd packer.nvim]]

--if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  --vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  --vim.api.nvim_command('packadd packer.nvim')
--end
--
local pluginconfig = function(plugin)
   assert(type(plugin) == 'string')
   require([[pluginconfig.]] .. plugin )
end

local p = function()
   -- Packer can manage itself
   --
   use { 'wbthomason/packer.nvim' }
   use { 'rktjmp/lush.nvim' }
   use { 'Matt-Deacalion/vim-systemd-syntax' }
   use { 'euclidianAce/BetterLua.vim' }
   use { 'glts/vim-texlog' }
   use { 'voldikss/vim-floaterm' }
   use { 'tpope/vim-fugitive' }
   use { 'junegunn/vim-easy-align' }
   use { 'stevearc/vim-arduino' }
   use { 'farmergreg/vim-lastplace' }
   use { 'powerman/vim-plugin-AnsiEsc' }
   use { 'teal-language/vim-teal' }
   use { 'liuchengxu/graphviz.vim' }
   use { 'monaqa/dial.nvim' }
   use { 'folke/which-key.nvim',
      as = 'which-key',
      config = pluginconfig
   }
   use { 'rmehri01/onenord.nvim',
      requires = {"rktjmp/lush.nvim"},
      as = 'onenord',
      config = pluginconfig
   }
   use { 'kevinhwang91/rnvimr',
      config = pluginconfig
   }
   use { 'kevinhwang91/nvim-hlslens',
      config = pluginconfig
   }
   use { 'jalvesaq/Nvim-R',
      alias = 'Nvim-R'
   }
   use { 'ibhagwan/fzf-lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = pluginconfig
   }
   use { 'hrsh7th/cmp-nvim-lsp',
      config = function()
         require('cmp_nvim_lsp').update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
         )
      end
   }
   use { 'quangnguyen30192/cmp-nvim-ultisnips',
      config = function()
         require'cmp_nvim_ultisnips'.setup{
            show_snippets = "all",
            documentation = function(snippet)
                  -- print(vim.inspect(snippet))
                  return snippet.value
               end
         }
      end
   }
   use { 'hrsh7th/nvim-cmp',
      requires = {
         'hrsh7th/cmp-buffer',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-nvim-lua',
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-cmdline',
         'quangnguyen30192/cmp-nvim-ultisnips',
         'kdheepak/cmp-latex-symbols'
      },
      config = pluginconfig
   }
   use { 'pianocomposer321/yabs.nvim',
   }
   use { 'andymass/vim-matchup',
      config = pluginconfig
   }
   use { 'famiu/nvim-reload',
      config = function()
         require('nvim-reload').vim_reload_dirs =
               { vim.fn.stdpath('config') .. '/*' }
         require('nvim-reload').lua_reload_dirs =
               { vim.fn.stdpath('config') }
      end
   }
   use { 'ekickx/clipboard-image.nvim',
      as = 'clipboard-image',
      config = pluginconfig
   }
   use { 'lewis6991/gitsigns.nvim',
      as = 'gitsigns',
      requires = 'nvim-lua/plenary.nvim',
      config = pluginconfig
   }
   use { 'echasnovski/mini.nvim',
      config = function()
         require'mini.trailspace'.setup{
            only_in_normal_buffers = true
         }
      end
   }
   use { 'tyru/open-browser.vim',
      as = 'open-browser',
      config = pluginconfig
   }
   use { 'borissov/fugitive-gitea',
      config = function()
         vim.g.fugitive_gitea_domains = {
            'https://energien.uber.space/gitea'
         }
      end
   }
   use { 'lukas-reineke/indent-blankline.nvim',
      as = 'indent-blankline',
      config = pluginconfig
   }
   use { 'Pocco81/AutoSave.nvim',
      as = 'autosave',
      config = pluginconfig
   }
   use { 'jghauser/mkdir.nvim',
      config = function()
         require('mkdir')
      end
   }
   use { 'phaazon/hop.nvim',
      config = function()
         require'hop'.setup {
            keys             = 'asdfjkl;en',
            term_seq_bias    = 0.5,
            uppercase_labels = true
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
      setup = function()
         -- let g:ulti_expand_or_jump_res = 0 'default value, just set once
         -- function! Ulti_ExpandOrJump_and_getRes()
         --    call v:lua.MPairs.disable_filetype_set()
         --    call UltiSnips#ExpandSnippetOrJump()
         --    call v:lua.MPairs.disable_filetype_reset()
         --    return ''
         -- endfunction
         --
         vim.g.UltiSnipsSnippetsDir         = '~/.config/nvim/UltiSnips'
         vim.g.UltiSnipsEditSplit           = 'vertical'
         vim.g.UltiSnipsListSnippets        = '<Nop>'
         vim.g.UltiSnipsExpandTrigger       = '<C-f>'
         vim.g.UltiSnipsJumpForwardTrigger  = '<C-f>'
         vim.g.UltiSnipsJumpBackwardTrigger = '<C-k>'
      end
   }
   use { 'chaoren/vim-wordmotion',
      setup = function()
         vim.g.wordmotion_nomap = 1

         vim.g.wordmotion_uppercase_spaces = {
            '"', "'", '[', ']', '(', ')', '{', '}',
            '/', [[\]], '_', '-', '.', ',', ':'
         }

         -- vim.g.wordmotion_mappings = {
         --     W = [[''w]], B = [[''b]],
         --     E = [[''e]], gE = [[]],
         --     w = [['w]], b = [['b]],
         --     e = [['e]], ge = [[]],
         --     aw = [['aw]], iw = [['iw]],
         --     ['<C-R><C-W>'] = [['<C-R><C-w>]]
         -- }
      end
   }
   use { 'airblade/vim-rooter',
      setup = function()
         vim.g.rooter_change_directory_for_non_project_files = 'current'
      end
   }
   use { 'neovim/nvim-lspconfig',
      config = function()
         local p = require('lspconfig')

         for k,v in pairs(require'style.sign') do
            vim.fn.sign_define(k, v)
         end

         p.r_language_server.setup{}
         -- p.texlab.setup{}
         -- p.zk.setup{}
      end
   }
   use {
      'williamboman/nvim-lsp-installer',
      config = function()
         local lspins = require'nvim-lsp-installer'
         local on_attach = require'lsp.on_attach'

         lspins.settings { log_level = vim.log.levels.INFO }

         lspins.on_server_ready(function(server)

            local config = {
               on_attach = on_attach
            }

            local ok, ret = pcall(require("lsp.settings." .. server.name))

            if ok then
               -- require'myhelper'.gxmessage(vim.inspect(config))
               config = vim.tbl_deep_extend('force', config, ret)
            else
               vim.api.nvim_notify(
                  'Custom config of ' .. server.name .. ' doesnt exist/not ok',
                  vim.log.levels.WARN,
                  {}
               )
            end

            server:setup(config)
         end)
      end
   }
   use {
      'onsails/lspkind-nvim',
      config = function()
         require('lspkind').init {}
      end
   }
   use { 'p00f/nvim-ts-rainbow',
      requires = 'nvim-treesitter/nvim-treesitter',
      config = function()
         require'nvim-treesitter.configs'.setup {
            ensure_installed = 'maintained',
            rainbow = {
               enable        = true,
               extended_mode = true
            },
            matchup = {
               enable = false
            }
         }
      end,
      disable = false
   }
   use { 'akinsho/nvim-toggleterm.lua',
      as = 'nvim-toggleterm',
      config = pluginconfig
   }
   use { 'lervag/vimtex',
      requires = { 'andymass/vim-matchup' },
      setup = function()
         vim.g.vimtex_imaps_enabled = 0
      end
   }
   use { 'WolfgangMehner/perl-support',
      setup = function()
         vim.g.Perl_PerlTags = 'on'
      end
   }
   use { 'kana/vim-textobj-indent',
      requires = { 'kana/vim-textobj-user' }
   }
   use { 'glts/vim-textobj-comment',
      requires = { 'kana/vim-textobj-user' }
   }
   use { 'sgur/vim-textobj-parameter',
      requires = { 'kana/vim-textobj-user' }
   }
   use { 'mllg/vim-devtools-plugin',
      ft =  {'r'},
      after = { 'Nvim-R' }
   }
   use { 'davisdude/vim-love-docs',
      run = './src/gen.sh'
   }
   use { 'rrethy/vim-hexokinase',
      run = 'make hexokinase'
   }
   use { 'AckslD/nvim-revJ.lua',
      requires = {'kana/vim-textobj-user', 'sgur/vim-textobj-parameter'},
      config = function()
         require('revj').setup{
            brackets = {
               first = '{([<',
               last  = '})]>'
            },
            enable_default_keymaps = false,
            add_seperator_for_last_parameter = false
         }
      end
   }
   use { 'alvarosevilla95/luatab.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
         require('luatab').setup({})
      end
   }
   use { 'nvim-lualine/lualine.nvim',
      requires = {
         'kyazdani42/nvim-web-devicons', opt = true
      },
      config = function()
         require('pluginconfig.lualine')
      end
   }
end

return require('packer').startup ({
   p,
   config = {
      profile = {
         enable = true,
         threshold = 0.3 -- the amount in ms that a plugins load time must be over for it to be included in the profile
      },
      display = {
         non_interactive = false,
         open_cmd = 'leftabove 60vnew',
         max_jobs = 6,
         git = {
            timeout=3
         }
      }
   }
})
