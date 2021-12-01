wk = require("which-key")

local n_openbrowser_query = function(s)
   return {
      [[:OpenBrowserSmartSearch -]] ..  s ..  [[ ]] ,
      s,
      silent = false
   }
end

local n_openbrowser_cword = function(s) return {
   [[<Cmd>execute "OpenBrowserSmartSearch -]] ..  s ..
   [[ " . expand('<cword>')<CR>]] , s
} end

local v_openbrowser_cword = function(s) return {
   [[<Esc>:OpenBrowserSmartSearch -]] ..  s ..
   [[ "<C-r>=init_custom_fn#get_selected_text()<CR>"<CR>]] , s
} end

local v_openbrowser = function(s) return {
   [[<Esc>:OpenBrowserSmartSearch -]] ..  s ..
   [[ <C-r>=init_custom_fn#get_selected_text()<CR>]] , s
} end

local zeal_cword = function()
   local s = vim.fn.expand('<cword>')

   if vim.bo.filetype then
      s = vim.bo.filetype .. [[:]] .. s
   end

   vim.fn.jobstart([[zeal ]] .. s)
end

local zeal_interactive = function()
    return [[<Esc>:lua vim.fn.jobstart('zeal ]]
end

wk.register({
   w = {
      name = 'Browser Search',
      g = n_openbrowser_cword('google'),
      b = n_openbrowser_cword('googlebooks'),
      s = n_openbrowser_cword('googlescholar'),
      w = n_openbrowser_cword('wortbuch'),
      e = n_openbrowser_cword('sematicscholar'),
      i = n_openbrowser_cword('github'),
      l = n_openbrowser_cword('linguee_eng_ger'),
      z = { zeal_cword, [[Zeal]] },

      G = n_openbrowser_query('google'),
      B = n_openbrowser_query('googlebooks'),
      S = n_openbrowser_query('googlescholar'),
      W = n_openbrowser_query('wortbuch'),
      E = n_openbrowser_query('sematicscholar'),
      I = n_openbrowser_query('github'),
      L = n_openbrowser_query('linguee_eng_ger'),
      Z = { zeal_interactive, [[Zeal]], silent = false},
   }
}, {
   mode = "n", prefix = "<leader>"
})

wk.register({
   w = {
      name = 'Browser Search',
      g = v_openbrowser_cword('google'),
      b = v_openbrowser_cword('googlebooks'),
      s = v_openbrowser_cword('googlescholar'),
      w = v_openbrowser_cword('wortbuch'),
      e = v_openbrowser_cword('sematicscholar'),
      i = v_openbrowser_cword('github'),
      l = v_openbrowser_cword('linguee_eng_ger'),
      G = v_openbrowser('google'),
      B = v_openbrowser('googlebooks'),
      S = v_openbrowser('googlescholar'),
      W = v_openbrowser('wortbuch'),
      E = v_openbrowser('sematicscholar'),
      I = v_openbrowser('github'),
      L = v_openbrowser('linguee_eng_ger')
   },
}, {
   mode = "v", prefix = "<leader>"
})
