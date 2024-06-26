local function bootstrap_pckr()
   local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

   if not vim.uv.fs_stat(pckr_path) then
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
      local ok, status = pcall(require, 'pluginconfig.' .. name)

      if not ok then
         vim.notify("pluginconfig: can't load " .. name .. " config", vim.log.levels.WARN)
         vim.notify(status, vim.log.levels.ERROR)
      end
   end
end

bootstrap_pckr()

require 'pckr'.setup {
   autoremove = true,
   log = { level = 'debug' }
}

require'pckr'.add {
   { 'Matt-Deacalion/vim-systemd-syntax' },
   { 'glts/vim-texlog' },
   { 'nvim-lua/plenary.nvim' },
   { 'tpope/vim-fugitive' },
   { 'junegunn/vim-easy-align' },
   { 'vala-lang/vala.vim' },
   { 'stevearc/vim-arduino' },
   { 'farmergreg/vim-lastplace' },
   { 'powerman/vim-plugin-AnsiEsc' },
   { 'teal-language/vim-teal' },
   { 'chentoast/marks.nvim',
      config = function()
         require 'marks'.setup {
            builtin_marks = { ".", "<", ">", "^", "]", "[" }
         }
      end
   },
   { 'stevearc/overseer.nvim',
      config = pluginconfig('overseer')
   },
   { 'kevinhwang91/rnvimr',
      config = pluginconfig('rnvimr')
   },
   { 'jalvesaq/Nvim-R' },
   { 'https://gitlab.com/ibhagwan/fzf-lua.git',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = pluginconfig('fzf-lua')
   },
   { 'SirVer/ultisnips',
      setup = function()
         vim.g.UltiSnipsSnippetsDir              = '~/.config/nvim/UltiSnips'
         vim.g.UltiSnipsEditSplit                = 'vertical'
         vim.g.UltiSnipsListSnippets             = '<Nop>'
         vim.g.UltiSnipsExpandTrigger            = '<Plug>(ultisnips_expand)'
         vim.g.UltiSnipsJumpForwardTrigger       = '<Plug>(ultisnips_jump_forward)'
         vim.g.UltiSnipsJumpBackwardTrigger      = '<Plug>(ultisnips_jump_backward)'
         vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end,
   },
   { 'hrsh7th/nvim-cmp',
      requires = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-nvim-lua', 'hrsh7th/cmp-nvim-lsp', 'kdheepak/cmp-latex-symbols' },
      config = pluginconfig('nvim-cmp')
   },
   { 'quangnguyen30192/cmp-nvim-ultisnips',
      requires = { 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-cmdline', 'SirVer/ultisnips' },
      config = pluginconfig('cmp-nvim-ultisnips')
   },
   { 'hrsh7th/cmp-cmdline',
      requires = { 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-buffer' },
      config = pluginconfig('cmp-cmdline')
   },
   { 'hrsh7th/cmp-nvim-lsp',
      config = function() require('cmp_nvim_lsp').default_capabilities() end
   },
   { 'andymass/vim-matchup',
      config = pluginconfig('vim-matchup')
   },
   { 'TobinPalmer/pastify.nvim',
      config = function()
         require('pastify').setup {
            opts = {
               absolute_path = false, -- use absolute or relative path to the working directory
               apikey = '', -- Api key, required for online saving
               local_path = '/imgs/', -- The path to put local files in, ex ~/Projects/<name>/assets/images/<imgname>.png
               save = 'local', -- Either 'local' or 'online'
            },
            ft = { -- Custom snippets for different filetypes, will replace $IMG$ with the image url
               html = '<img src="$IMG$" alt="">',
               markdown = '![]($IMG$)',
               tex = [[\includegraphics[width=\linewidth]{$IMG$}]],
            }
         }
      end
   },
   { 'lewis6991/gitsigns.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = pluginconfig('gitsigns')
   },
   { 'echasnovski/mini.nvim',
      config = function()
         require 'mini.trailspace'.setup { only_in_normal_buffers = true }
      end
   },
   { 'tyru/open-browser.vim',
      config = pluginconfig('open-browser')
   },
   { 'borissov/fugitive-gitea',
      config = function()
         vim.g.fugitive_gitea_domains = { 'https://energien.uber.space/gitea' }
      end
   },
   { 'okuuva/auto-save.nvim',
      config = pluginconfig('auto-save')
   },
   { 'jghauser/mkdir.nvim',
      config = 'mkdir'
   },
   { 'salkin-mada/openscad.nvim',
      config = 'openscad'
   },
   { 'smoka7/hop.nvim',
      config = function()
         require 'hop'.setup {
            keys             = 'asdfjkl;en',
            uppercase_labels = true
         }
      end
   },
   { 'winston0410/range-highlight.nvim',
      requires = 'winston0410/cmd-parser.nvim',
      config = function() require 'range-highlight'.setup {} end
   },
   { 'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end
   },
   { 'NvChad/nvim-colorizer.lua',
      config = function() require 'colorizer'.setup() end
   },
   { 'chaoren/vim-wordmotion',
      setup = function()
         vim.g.wordmotion_nomap = 1
         vim.g.wordmotion_uppercase_spaces = {
            '"', "'", '[', ']', '(', ')', '{', '}',
            '/', [[\]], '_', '-', '.', ',', ':'
         }
      end,
   },
   { 'airblade/vim-rooter',
      config = function()
         vim.g.rooter_change_directory_for_non_project_files = 'current'
      end
   },
   { 'williamboman/mason.nvim',
      config = function() require 'mason'.setup() end
   },
   { 'williamboman/mason-lspconfig.nvim',
      requires = { 'williamboman/mason.nvim' },
   },
   { 'neovim/nvim-lspconfig',
      requires = { 'williamboman/mason-lspconfig.nvim', 'hrsh7th/cmp-nvim-lsp' },
      config = pluginconfig('nvim-lspconfig')
   },
   { 'mfussenegger/nvim-dap',
      config = pluginconfig('nvim-dap')
   },
   { 'theHamsta/nvim-dap-virtual-text',
      requires = { 'mfussenegger/nvim-dap' },
      config = function()
         require("nvim-dap-virtual-text").setup{
            virt_text_pos = 'eol',
            virt_text_win_col = 80
         }
      end
   },
   -- vimtex doc:
   -- for people who use Tree-sitter, it is strongly advised to disable
   -- Tree-sitter highlighting for LaTeX buffers
   { 'nvim-treesitter/nvim-treesitter',
      config = function()
         local parser_path = vim.fs.joinpath(vim.fn.stdpath("data"), "ts-parsers")
         vim.opt.runtimepath:prepend(parser_path)

         require 'nvim-treesitter.configs'.setup {
            parser_install_dir = parser_path,
            ensure_installed = { 'vala', 'c', 'lua', 'bash' },
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
   },
   { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
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
   },
   { 'akinsho/toggleterm.nvim',
      config = pluginconfig('nvim-toggleterm')
   },
   { 'lervag/vimtex',
      requires = { 'andymass/vim-matchup' },
      config = pluginconfig('vimtex')
   },
   { 'kana/vim-textobj-user' },
   { 'kana/vim-textobj-indent',
      requires = { 'kana/vim-textobj-user' }
   },
   { 'glts/vim-textobj-comment',
      requires = { 'kana/vim-textobj-user' }
   },
   { 'sgur/vim-textobj-parameter',
      requires = { 'kana/vim-textobj-user' }
   },
   { 'davisdude/vim-love-docs',
      run = './src/gen.sh'
   },
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
   },
   { 'alvarosevilla95/luatab.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
         require('luatab').setup({})
      end
   },
   { 'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = pluginconfig('lualine')
   },
}

require'pckr'.add{
   { 'folke/which-key.nvim',
      config = pluginconfig('which-key')
   }
}
