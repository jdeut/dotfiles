local autosave = require('autosave')

vim.g.auto_save_silent = 1

autosave.hook_after_saving = function()
   autosave.setup({
      execution_message = 'AutoSave: ' .. vim.fn.strftime('%H:%M:%S')
   })
end

autosave.setup( {
   enabled                     = true,
   debounce_delay              = 50,
   on_off_commands             = true,
   execution_message           = 'AutoSave: ' .. vim.fn.strftime('%H:%M:%S'),
   write_all_buffers           = false,
   clean_command_line_interval = 3000,
   events = {
      'InsertLeave',
      'WinLeave',
      'TextChanged'
   },
   conditions = {
      exists = true,
      filetype_is_not = { 'gitcommit', 'rnvimr' },
      modifiable = true
   }
} )
