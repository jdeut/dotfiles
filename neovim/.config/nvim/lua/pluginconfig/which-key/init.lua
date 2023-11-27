local scan = require'plenary.scandir'
local path = require'plenary.path'

require'which-key.plugins.registers'.registers =  '+"-:.%/#=_adfjkn0123789'


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
