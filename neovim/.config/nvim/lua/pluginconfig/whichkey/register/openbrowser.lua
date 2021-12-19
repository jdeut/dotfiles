wk = require("which-key")
helper = require'myhelper'

local n_openbrowser_query = function(s)
   return {
      [[:OpenBrowserSmartSearch -]] ..  s ..  [[ ]] ,
      s .. [[ (input)]],
      silent = false
   }
end

local openbrowser_cword = function(s)
   return {
      function()
         vim.cmd([[OpenBrowserSmartSearch -]] ..  s .. [[ ]] .. vim.fn.expand('<cword>'))
      end,
      s .. ' (cword)'
   }
end

local v_openbrowser = function(s)
   return {
      function()
         local u = helper.get_last_visual_selection()
         vim.cmd([[OpenBrowserSmartSearch -]] ..  s .. [[ ]] .. u)
      end,
      s .. ' (Visual Sel.)'
   }
end

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
      g = openbrowser_cword('google'),
      b = openbrowser_cword('googlebooks'),
      s = openbrowser_cword('googlescholar'),
      w = openbrowser_cword('wortbuch'),
      e = openbrowser_cword('sematicscholar'),
      l = openbrowser_cword('linguee_eng_ger'),
      z = { zeal_cword, [[Zeal]] },

      G = n_openbrowser_query('google'),
      B = n_openbrowser_query('googlebooks'),
      S = n_openbrowser_query('googlescholar'),
      W = n_openbrowser_query('wortbuch'),
      E = n_openbrowser_query('sematicscholar'),
      L = n_openbrowser_query('linguee_eng_ger'),
      Z = { zeal_interactive, [[Zeal]], silent = false},
      i = {
         name = 'Github',
         i = openbrowser_cword('github'),
         c = openbrowser_cword('github_code'),
         w = openbrowser_cword('github_wiki'),
         I = n_openbrowser_query('github'),
         C = n_openbrowser_query('github_code'),
         W = n_openbrowser_query('github_wiki'),
      }
   }
}, {
   mode = "n", prefix = "<leader>"
})

wk.register({
   w = {
      name = 'Browser Search',
      G = openbrowser_cword('google'),
      B = openbrowser_cword('googlebooks'),
      S = openbrowser_cword('googlescholar'),
      W = openbrowser_cword('wortbuch'),
      E = openbrowser_cword('sematicscholar'),
      L = openbrowser_cword('linguee_eng_ger'),
      g = v_openbrowser('google'),
      b = v_openbrowser('googlebooks'),
      s = v_openbrowser('googlescholar'),
      w = v_openbrowser('wortbuch'),
      e = v_openbrowser('sematicscholar'),
      l = v_openbrowser('linguee_eng_ger'),
      i = {
         name = 'Github',
         I = openbrowser_cword('github'),
         i = v_openbrowser('github'),
         C = openbrowser_cword('github_code'),
         c = v_openbrowser('github_code'),
         W = openbrowser_cword('github_wiki'),
         w = v_openbrowser('github_wiki')
      }
   },
}, {
   mode = "v", prefix = "<leader>"
})
