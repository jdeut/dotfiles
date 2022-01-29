vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_bw_enable = 1

vim.g.rnvimr_shadow_winblend = 60

vim.g.rnvimr_action = {
   ['<C-e>'] = 'NvimEdit drop',
   ['<C-t>'] = 'NvimEdit tabedit',
   ['<C-v>'] = 'NvimEdit vsplit',
   ['<C-h>'] = 'NvimEdit split',
   ['<CR>']  = 'NvimEdit drop',
   ['q']     = 'NvimEdit quit',
   ['<ESC>'] = 'NvimEdit quit',
   gw        = 'JumpNvimCwd',
   yw        = 'EmitRangerCwd'
}

local t = {}

do
   t.relative = 'editor'
   t.style    = 'minimal'
   t.width  = math.floor( .9 * (vim.o.columns > 135 and 136 or vim.o.columns))
   t.height = math.floor( .9 * (vim.o.lines > 30 and 31 or vim.o.lines))
   t.col    = math.floor( .5 * (vim.o.columns - t.width ))
   t.row    = math.floor( .1 * vim.o.lines )
end

vim.g.rnvimr_layout = t

vim.g.rnvimr_ranger_views = {
   { maxwidth = 120, maxheight=30, ratio = { 1, 2, 3 } },
}

vim.g.rnvimr_presets = {
   { width = 0.9, height = 0.9 }
}

vim.g.rnvimr_edit_cmd = 'vsplit'
