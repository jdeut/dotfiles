require'which-key.plugins.registers'.registers =  '+"-:.%/#=_adfjkn0123789'

require'which-key'.setup {
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
   show_help = true,
   disable = {
      filetype = { 'nofile' }
   }
}

--
-- source all lua files as modules recursively from:
-- pluginconfig/which-key/register/**/*.lua
--

local saved_dir = vim.fn.chdir(vim.fs.joinpath( vim.fn.stdpath('config'), 'lua'))
local wkregs = vim.fn.glob( 'pluginconfig/which-key/register/**/*.lua', true, true)

for _,p in ipairs(wkregs) do
   local mod = vim.fn.fnamemodify(p, ':r'):gsub('/', '.')

   local ok, status = pcall(require, mod)

   if not ok then
      vim.notify('Error loading ' .. p .. status, vim.log.levels.ERROR)
   end
end

vim.fn.chdir(saved_dir)
