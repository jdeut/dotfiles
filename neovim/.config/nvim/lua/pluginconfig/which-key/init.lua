local scan = require'plenary.scandir'
local path = require'plenary.path'
local wk = require'which-key'

require'which-key.plugins.registers'.registers =  '+"-:.%/#=_adfjkn0123789'

wk.setup {
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
   show_help = true
}

local luapath = path:new(vim.fn.stdpath('config')):joinpath('lua')
local wkpath = luapath:joinpath('pluginconfig/which-key/register')

-- vim.cmd([[echomsg "]] .. tostring(wkpath) .. [["]])
-- vim.cmd([[echomsg "]] .. tostring(luapath) .. [["]])

scan.scan_dir(
   wkpath:absolute(), {
      search_pattern = 'lua$',
      on_insert = function(entry, typ)
         if typ == 'file' then
            local p = path:new(entry):make_relative(luapath:absolute())

            -- vim.cmd([[echomsg "]] .. tostring(p) .. [["]])

            --assert(
            --   tostring(p):match([[\.]]),
            --   tostring(p):format("\ndot in path >>%s<< is not valid", p)
            --)

            p = vim.fn.fnamemodify(p, ':r'):gsub('/', '.')

            -- vim.cmd([[echomsg "]] .. p .. [["]])

            require(p)
         end
      end
   }
)
