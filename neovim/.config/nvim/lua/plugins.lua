local function bootstrap_pckr()
   local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

   if not vim.loop.fs_stat(pckr_path) then
      vim.fn.system({
         'git',
         'clone',
         "--filter=blob:none",
         'https://github.com/lewis6991/pckr.nvim',
         pckr_path
      })
   end

   -- prepend pckr_path to nvim's runtime path
   vim.opt.rtp:prepend(pckr_path)
end

local function pluginconfig(name)
   return function()
      local ok, _ = pcall(require, 'pluginconfig.' .. name)

      if not ok then
         vim.notify("pluginconfig: can't load " .. name .. " config", vim.log.levels.WARN)
         vim.notify(ok, vim.log.levels.ERROR)
      end
   end
end

bootstrap_pckr()

require'pckr'.setup{
   autoremove = true,
   log = { level = 'debug' }
}

require'pckr'.add{
   { 'rktjmp/lush.nvim' };
   { 'Matt-Deacalion/vim-systemd-syntax' };
   { 'glts/vim-texlog' };
   { 'tpope/vim-fugitive' };
   { 'junegunn/vim-easy-align' };
   { 'vala-lang/vala.vim' };
   { 'stevearc/vim-arduino' };
   { 'farmergreg/vim-lastplace' };
   { 'powerman/vim-plugin-AnsiEsc' };
   { 'teal-language/vim-teal' };
   { 'chentoast/marks.nvim',
      config = function()
         require'marks'.setup {
            builtin_marks = { ".", "<", ">", "^", "]", "["}
         }
      end
   };
   { 'stevearc/overseer.nvim',
      config = pluginconfig('overseer')
   };
   { 'rmehri01/onenord.nvim',
      requires = { "rktjmp/lush.nvim" },
      config = pluginconfig('onenord')
   };
   { 'kevinhwang91/rnvimr',
      config = pluginconfig('rnvimr')
   };
   { 'jalvesaq/Nvim-R',
   };
   { 'ibhagwan/fzf-lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = pluginconfig('fzf-lua')
   };
   { 'hrsh7th/cmp-nvim-lsp',
      config = function()
         require('cmp_nvim_lsp').default_capabilities()
      end
   };
   { 'quangnguyen30192/cmp-nvim-ultisnips',
      requires = { 'hrsh7th/nvim-cmp' },
      config = function()
         require 'cmp_nvim_ultisnips'.setup {
            show_snippets = "all",
            documentation = function(snippet)
               return snippet.value
            end
         }
      end
   };
   { 'hrsh7th/nvim-cmp',
      requires = {
         'hrsh7th/cmp-buffer',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-nvim-lua',
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-cmdline',
         'kdheepak/cmp-latex-symbols'
      },
      config = pluginconfig('nvim-cmp')
   };
   { 'pianocomposer321/yabs.nvim',
      config = pluginconfig('yabs')
   };
   { 'andymass/vim-matchup',
      config = pluginconfig('vim-matchup')
   };
   { 'ekickx/clipboard-image.nvim',
      config = pluginconfig('clipboard-image')
   };
   { 'lewis6991/gitsigns.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = pluginconfig('gitsigns')
   };
   { 'echasnovski/mini.nvim',
      config = function()
         require 'mini.trailspace'.setup {
            only_in_normal_buffers = true
         }
      end
   };
   { 'tyru/open-browser.vim',
      config = pluginconfig('open-browser')
   };
   { 'borissov/fugitive-gitea',
      config = function()
         vim.g.fugitive_gitea_domains = {
            'https://energien.uber.space/gitea'
         }
      end
   };
   { 'lukas-reineke/indent-blankline.nvim',
      config = pluginconfig('indent-blankline')
   };
   { 'okuuva/auto-save.nvim',
      config = pluginconfig('auto-save')
   };
   { 'jghauser/mkdir.nvim',
      config = 'mkdir'
   };
   { 'salkin-mada/openscad.nvim',
      requires = 'L3MON4D3/LuaSnip',
      config = 'openscad'
   };
   { 'smoka7/hop.nvim',
      config = function()
         require 'hop'.setup {
            keys             = 'asdfjkl;en',
            uppercase_labels = true
         }
      end
   };
   { 'winston0410/range-highlight.nvim',
      requires = 'winston0410/cmd-parser.nvim',
      config = function()
         require 'range-highlight'.setup {}
      end
   };
   {
      'numToStr/Comment.nvim',
      config = function()
         require('Comment').setup()
      end
   };
   { 'SirVer/ultisnips',
      setup = function()
         vim.g.UltiSnipsSnippetsDir         = '~/.config/nvim/UltiSnips'
         vim.g.UltiSnipsEditSplit           = 'vertical'
         vim.g.UltiSnipsListSnippets        = '<Nop>'
         vim.g.UltiSnipsExpandTrigger       = '<Plug>(ultisnips_expand)'
         vim.g.UltiSnipsJumpForwardTrigger  = '<Nop>'
         vim.g.UltiSnipsJumpBackwardTrigger = '<Nop>'
      end
   };
   { 'chaoren/vim-wordmotion',
      setup = function()
         vim.g.wordmotion_nomap = 1
         vim.g.wordmotion_uppercase_spaces = {
            '"', "'", '[', ']', '(', ')', '{', '}',
            '/', [[\]], '_', '-', '.', ',', ':'
         }
      end
   };
   { 'airblade/vim-rooter',
      setup = function()
         vim.g.rooter_change_directory_for_non_project_files = 'current'
      end
   };
   { 'williamboman/mason.nvim',
      config = function()
         require'mason'.setup()
      end
   };
   { 'williamboman/mason-lspconfig.nvim',
      requires = {'williamboman/mason.nvim'},
   };
   { 'neovim/nvim-lspconfig',
      requires = {'williamboman/mason-lspconfig.nvim', 'hrsh7th/cmp-nvim-lsp'},
      config = pluginconfig('mason-lspconfig')
   };
   -- { 'onsails/lspkind-nvim',
   --    config = function()
   --       require('lspkind').init {}
   --    end
   -- };
   -- vimtex doc:
   -- for people who use Tree-sitter, it is strongly advised to disable
   -- Tree-sitter highlighting for LaTeX buffers
   { 'nvim-treesitter/nvim-treesitter',
      config = function()
         require 'nvim-treesitter.configs'.setup {
            ensure_installed = { 'vala', 'c', 'lua' },
            ignore_install = { 'latex' },
            matchup = {
               enable = true
            },
            highlight = {
               enable = true,
               disable = { "latex" }
            },
         }
      end
   };
   { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',
      config = function()
         local rainbow_delimiters = require 'rainbow-delimiters'

         vim.g.rainbow_delimiters = {
            strategy = {
               [''] = rainbow_delimiters.strategy['global'],
               vim = rainbow_delimiters.strategy['local'],
            },
            query = {
               [''] = 'rainbow-delimiters',
               lua = 'rainbow-blocks',
            },
            highlight = {
               'RainbowDelimiterOutest',
               'RainbowDelimiterViolet',
               'RainbowDelimiterOrange',
               'RainbowDelimiterBlue',
               'RainbowDelimiterGreen',
               'RainbowDelimiterYellow',
               'RainbowDelimiterRed',
            }
         }
      end
   };
   { 'akinsho/toggleterm.nvim',
      config = pluginconfig('nvim-toggleterm')
   };
   { 'lervag/vimtex',
      requires = { 'andymass/vim-matchup' },
      config = pluginconfig('vimtex')
   };
   { 'kana/vim-textobj-indent',
      requires = { 'kana/vim-textobj-user' }
   };
   { 'glts/vim-textobj-comment',
      requires = { 'kana/vim-textobj-user' }
   };
   { 'sgur/vim-textobj-parameter',
      requires = { 'kana/vim-textobj-user' }
   };
   { 'davisdude/vim-love-docs',
      run = './src/gen.sh'
   };
   { 'AckslD/nvim-revJ.lua',
      requires = { 'kana/vim-textobj-user', 'sgur/vim-textobj-parameter' },
      config = function()
         require('revj').setup {
            brackets = {
               first = '{([<',
               last = '})]>'
            },
            enable_default_keymaps = false,
            add_seperator_for_last_parameter = false
         }
      end
   };
   { 'alvarosevilla95/luatab.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
         require('luatab').setup({})
      end
   };
   { 'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons'},
      config = pluginconfig('lualine')
   };
   { 'folke/which-key.nvim',
      config = function()
         require'which-key'.setup {
            plugins = {
               marks = false,
               registers = true,
            },
            presets = {
               operators = true
            },
            window = {
               margin = { 0, 10, 4, 10 },
               padding = { 0, 0, 0, 0 },
               border = 'single',
               winblend = 40
            },
            layout = {
               height = { min = 4, max = 22 }, --
               width = { min = 5, max = 40 }, --
               spacing = 5, -- spacing between columns
               align = "center",
            },
            hidden = {
               "execute", "<cmd>", "<Cmd>",
               "<CR>", "call", "lua", "^:", "^ "
            },
            -- triggers = {
            --    '<localleader>', '<leader>', 'z', 'g', ']', '[', [[']], [[`]]
            -- },
            triggers_blacklist = {},
            ignore_missing = true,
            motions = { count = true },
            show_help = true,
            disable = {
               filetype = { 'nofile' }
            }
         }
      end
   };
}

require('pluginconfig.which-key')
