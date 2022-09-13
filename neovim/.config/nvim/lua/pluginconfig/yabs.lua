local ok, toggleterm = pcall(require, 'toggleterm.terminal')

if not ok then return end

local M = {
   term = toggleterm.Terminal:new( {
      cmd = [[env TOGGLETERM=1 zsh]],
      direction = 'vertical',
      size = 70
   })
}

M.term_send = function(cmd)
   if not M.term:is_open() then M.term:toggle() end

   M.term:send(cmd, true)
end

require('yabs'):setup({
   languages = { -- List of languages in vim's `filetype` format
      lua = {
         tasks = {
            run = {
               command = 'lua5.3 %',
               output = M.term_send
            }
         }
      },
      teal = {
         tasks = {
            run = {
               command = 'tl run %', -- The command to run (% and other
               output = M.term_send
            },
         },
      },
      make = {
         tasks = {
            run = { -- You can specify as many tasks as you want per
               -- filetype
               command = 'make',
               output = 'quickfix'
            },
         }
      },
      c = {
         default_task = 'build_and_run',
         tasks = {
            build = {
               command = 'make',
               output = 'quickfix', -- Where to show output of the
               -- command. Can be `buffer`,
               -- `consolation`, `echo`,
               -- `quickfix`, `terminal`, or `none`
               opts = { -- Options for output (currently, there's only
                  -- `open_on_run`, which defines the behavior
                  -- for the quickfix list opening) (can be
                  -- `never`, `always`, or `auto`, the default)
                  open_on_run = 'always',
               },
            },
            run = { -- You can specify as many tasks as you want per
               -- filetype
               command = './main',
               output = function(cmd)
                  M.tt():send_after_kill({ cmd = cmd, args = M.args() })
               end
            },
            build_and_run = { -- Setting the type to lua means the command
               -- is a lua function
               command = function()
                  -- The following api can be used to run a task when a previous one finishes
                  -- WARNING: this api is experimental and subject to changes
                  require('yabs'):run_task('build')
                  require('yabs'):run_task('run')
                  -- , {
                  --    -- Job here is a plenary.job object that represents
                  --    -- the finished task, read more about it here:
                  --    -- https://github.com/nvim-lua/plenary.nvim#plenaryjob
                  --    on_exit = function(Job, exit_code)
                  --       -- The parameters `Job` and `exit_code` are optional,
                  --       -- you can omit extra arguments or
                  --       -- skip some of them using _ for the name
                  --       if exit_code == 0 then
                  --          M.tt():send_after_kill({ cmd = './main' })
                  --       end
                  --    end,
                  -- })
               end,
               type = 'lua',
            },
         },
      },
   },
   tasks = { -- Same values as `language.tasks`, but global
      build = {
         command = 'echo building project...',
         output = 'consolation',
      },
      run = {
         command = 'echo running project...',
         output = 'echo',
      },
      kill = {
         command = '%',
         output = function(cmd)
            if M.tt_ft_exists() then
               M.tt().terminal:shutdown()
            end
         end
      },
      optional = {
         command = 'echo runs on condition',
         -- You can specify a condition which determines whether to enable a
         -- specific task
         -- It should be a function that returns boolean,
         -- not a boolean directly
         -- Here we use a helper from yabs that returns such function
         -- to check if the files exists
         condition = require('yabs.conditions').file_exists('filename.txt'),
      },
   },
   opts = { -- Same values as `language.opts`
      output_types = {
         quickfix = {
            open_on_run = 'always',
         },
      },
   },
})
