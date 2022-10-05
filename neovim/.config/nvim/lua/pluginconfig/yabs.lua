local ok, toggleterm = pcall(require, 'toggleterm.terminal')

if not ok then return end

local ok, cond = pcall(require, "yabs.conditions")

if not ok then return end

local ok, path = pcall(require, 'plenary.path')

if not ok then return end

local ok, job = pcall(require, 'plenary.job')

if not ok then return end

local ok, yabs = pcall(require, 'yabs')

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


vim.api.nvim_create_autocmd(
   {'DirChanged'}, {
      pattern = {'window', 'global'},
      callback = function()
         if M.term:is_open() then
            M.term:send(string.format('cd %s', vim.fn.getcwd()), true)
         end
      end
   }
)

yabs:setup({
   languages = { -- List of languages in vim's `filetype` format
      lua = {
         tasks = {
            run = {
               command = 'lua5.3',
               output = function(cmd)
                  local script = 'main.lua'
                  script = path.new(script):exists() and script or vim.fn.expand('%')
                  M.term_send(string.format('%s %s', cmd, script))
               end
            }
         }
      },
      vala = {
         tasks = {
            run = {
               command = function()
                  local a = vim.fn.json_decode(vim.fn.system('meson introspect build --target -i'))
                  local exe = nil

                  for _,v in ipairs(a) do
                     if v.name == 'main' then
                        exe = v.filename[1]
                     end
                  end

                  if exe ~= nil then
                     M.term_send(exe)
                  end
               end,
               type = 'lua'
            },
            build_and_run = {
               command = function()
                  if path:new('meson.build'):exists() then
                     require'yabs':run_task('meson_build', {
                        on_exit = function(Job, exit_code)
                           if exit_code == 0 then
                              require('yabs').languages.vala:run_task('run')
                           end
                        end
                     })
                  else
                     print('cannot find task')
                  end
               end,
               type = 'lua'
            }
         }
      },
      zsh = {
         tasks = {
            run = {
               command = 'zsh %', -- The command to run (% and other
               output = M.term_send
            },
         },
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
               output = M.term_send
            },
            build_and_run = { -- Setting the type to lua means the command
               -- is a lua function
               command = function()
                  if path:new('Makefile'):exists() then
                     require'yabs':run_task('make_build', {
                        on_exit = function(Job, exit_code)
                           -- The parameters `Job` and `exit_code` are optional,
                           -- you can omit extra arguments or
                           -- skip some of them using _ for the name
                           if exit_code == 0 then
                              require('yabs').languages.c:run_task('run')
                           end
                        end
                     })
                  else
                     print('cannot find task')
                  end
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
      make_build = {
         command = "make",
         output = "quickfix"
      },
      meson_build = {
         command = "meson compile -C build",
         output = "quickfix"
      },
      meson_setup = {
         command = "meson setup build",
         output = "none"
      },
      meson_clear = {
         command = "rm -rf build",
         output = "none"
      },
      optional = {
         command = 'echo runs on condition',
         -- You can specify a condition which determines whether to enable a
         -- specific task
         -- It should be a function that returns boolean,
         -- not a boolean directly
         -- Here we use a helper from yabs that returns such function
         -- to check if the files exists
         condition = require('yabs.conditions').file_exists('main.c'),
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
