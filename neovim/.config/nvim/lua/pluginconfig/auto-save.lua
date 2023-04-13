local autosave = require('auto-save')

autosave.setup( {
   enabled                     = true,
   debounce_delay              = 50,
   -- on_off_commands             = true,
   execution_message           = {
      message = function()
         return 'AutoSave: ' .. vim.fn.strftime('%H:%M:%S')
      end,
      cleaning_interval = 2000
   },
   write_all_buffers           = false,
   clean_command_line_interval = 3000,
   trigger_events = {
      immediate_save = { 'InsertLeave', 'WinLeave'},
      defer_save = { 'TextChanged' },
      cancel_defered_save = { "InsertEnter" }
   },
   conditions = {
      exists = true,
      filetype_is_not = { 'gitcommit', 'rnvimr' },
      modifiable = true
   }
} )
