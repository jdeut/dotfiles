wk = require("which-key")

local function ccmd(cmd, opts)
   local count = vim.api.nvim_eval('v:count') 
   local prefix_mod = ''

   count = count > 0 and count or ''

   if opts then
      prefix_mod = opts.prefix_mod and opts.prefix_mod .. [[ ]] or ''
   end

   vim.v.errmsg = ''

   vim.cmd( [[silent! ]] .. prefix_mod .. [[ ]] .. count .. cmd)

   if vim.v.errmsg ~= '' then
      print(vim.v.errmsg)
      vim.defer_fn( function() vim.cmd('echo ') end, 1400)
   end
end

local function wincmd(cmd, opts)
   ccmd( [[wincmd ]] .. cmd )
end

wk.register({
   s = { function() require('which-key').show('s', { mode = 'n', auto = true }) end, '' }
}, {
   mode = "n", silent = true
})

wk.register({
   name = 'Buffer/Window/Tab Management',
   d         = { function() ccmd('tabnext') end, "Tab Next"},
   D         = { function() ccmd('tabm+') end, "Tab Move Right"},
   a         = { function() ccmd('tabprev') end, "Tab Prev"},
   A         = { function() ccmd('tabm-') end, "Tab Move Left"},
   l         = { function() wincmd('l') end, "Right"},
   h         = { function() wincmd('h') end, "Left"},
   j         = { function() wincmd('j') end, "Down"},
   k         = { function() wincmd('k') end, "Up"},
   K         = { function() wincmd('K') end, "Move Up" },
   L         = { function() wincmd('L') end, "Move Right" },
   H         = { function() wincmd('H') end, "Move Left" },
   J         = { function() wincmd('J') end, "Move Down" },
   s         = { function() wincmd('W') end, "Switch"},
   i         = { function() wincmd('o') end, "Only"},
   m         = { function() wincmd('c') end, "Close"},
   ['[']     = { function() wincmd('c') end, "Close"},
   n         = { function() wincmd('n') end, "New"},
   N         = { [[<Cmd>topleft vnew<cr>]], "New Vertical"},
   ['<C-n>'] = { function() ccmd('tabnew') end, "New Tab"},
   ['=']     = { function() wincmd('=') end, "Equal Size" },
   ['+']     = { function() wincmd('+') end, "Increase Height" },
   ['-']     = { function() wincmd('-') end, "Decrease Height" },
   ['<']     = { function() wincmd('<') end, "Decrease Width" },
   ['>']     = { function() wincmd('>') end, "Increase Width" },
   ['<Space>'] = { [[<Cmd>silent! e #<cr>]], "Alternate"},
   t         = { function() wincmd('T') end, "Move to New Tab"},
   r         = { function() wincmd('r') end, "Rotate Right"},
   R         = { function() wincmd('R') end, "Rotate Left"},
   v         = { function() wincmd('v', { prefix_mod = 'leftabove'}) end, "vsplit"},
   V         = { function() wincmd('v', { prefix_mod = 'rightbelow'}) end, "vsplit"},
   ['%']     = { [[<Cmd>vsplit<cr>]], "vsplit"},
   ['"']     = { [[<Cmd>split<cr>]], "split"},
   g = {
      name = 'Alternate',
      f         = { function() wincmd('gf') end, "Open File Under Cursor in Tab"},
      F         = { function() vim.cmd('vsplit <cfile>') end, "Create File Under Cursor in Tab"},
      ['<C-f>'] = { function() wincmd('gF') end, "Open File Under Cursor in Tab"},
      v         = { [[<Cmd>silent! vsplit #<cr>]], "Alternate Vsplit"},
      ["<"]     = { [[<Cmd>silent! split #<cr>]], "Alternate Split"}
   }
},  {
   mode = "n", prefix = "s", silent = true
})
