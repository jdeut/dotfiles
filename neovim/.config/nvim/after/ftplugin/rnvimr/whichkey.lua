local tmaps = vim.api.nvim_get_keymap('t')

for _,v in ipairs(tmaps) do
   -- vim.api.nvim_notify(vim.inspect(v), vim.log.levels.INFO, {})
   vim.api.nvim_buf_set_keymap(0, 't', v.lhs, '<nop>', {noremap = true, silent = true})
end

vim.api.nvim_buf_set_keymap(0, 't', ';', ';', {noremap = false, silent = true})

require'which-key'.register({
   ['<C-q>'] = { function() vim.cmd('RnvimrToggle') end, 'Toggle' },
   ['<C-ESC>'] = { function() vim.cmd('RnvimrToggle') end, 'Toggle' },
},  { buffer = 0, mode = 't' })
