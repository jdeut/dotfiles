local mappings = {
   ['<ESC>'] = { function() vim.cmd('wincmd c') end,
      [[close]]
   },
   ['<localleader>'] = {
      name = 'locals',
      n = { [[:e<CR>/\(warning\|error\|\<deprec\)<CR>]], [[Find Errors/Warnings]] }
   }
}

require('which-key').register(
   mappings, {
      buffer = 0,
      prefix = '',
      noremap = true
   }
)
