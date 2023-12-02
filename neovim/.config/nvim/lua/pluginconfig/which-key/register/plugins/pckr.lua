local ok, _ = pcall(require, 'pckr')

if not ok then return end

require'which-key'.register({
   name = 'Utils',
   p = {
      name = 'Pckr',
      u    = { [[<Cmd>Pckr update<CR>]], 'Update'},
      s    = { [[<Cmd>Pckr status<CR>]], 'Status'},
      i    = { [[<Cmd>Pckr install<CR>]], 'Install'},
      l    = { [[<Cmd>Pckr log<CR>]], 'Log'}
   }
},  { mode = 'n', prefix = [[<leader>j]] })
