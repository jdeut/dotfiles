local ok, toggleterm = pcall(require, 'toggleterm')

if not ok then return end

toggleterm.setup {
   highlights = {
      -- Normal = {
      --    link = 'Search'
      -- }
      Normal = {
         -- ctermbg = '#000000',
         -- ctermfg = '#00ff00'
         guibg = '#001010',
         guifg = '#00ff40',
         gui = 'bold'
      },
      -- NormalFloat = {
      --    bg = '#000000',
      --    fg = '#00ff00'
      -- }
   },
   size = 70,
   close_on_exit = true, -- close the terminal window when
   start_in_insert = false,
   open_mapping = [[<F10>]],
   hide_numbers = true,
   persist_size = false,
   shade_terminals = false,
   shade_factor = true,
   autochdir = true,
   auto_scroll = true
}
