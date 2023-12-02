local helper = require'myhelper'

local action = {}

action.std = function(mode, site)
   local t = {
      n = { function() return vim.fn.expand('<cword>') end, '(cword)' },
      v = { helper.get_last_visual_selection, '(VisualSel.)' }
   }
   return {
      function()
         vim.call([[openbrowser#smart_search]], t[mode][1](), site)
      end,
      site .. t[mode][2]
   }
end

action.alt = function(mode, site)
   if mode == 'n' then
      return {
         [[:OpenBrowserSmartSearch -]] ..  site ..  [[ ]] ,
         site .. [[ (input)]],
         silent = false
      }
   elseif mode == 'v' then
      return action.std('n', site)
   end
end

local zeal = {}

zeal.cword = function()
   local s = vim.fn.expand('<cword>')

   if vim.bo.filetype then
      s = vim.bo.filetype .. [[:]] .. s
   end

   vim.fn.jobstart([[zeal ]] .. s)
end

zeal.interactive = function()
    return [[<Esc>:lua vim.fn.jobstart('zeal ]]
end

-- require'myhelper'.gxmessage('sdasd')

for _,mode in ipairs({'n', 'v'}) do
   local i = {
      a = function(site) return action.std(mode, site) end,
      alt_a = function(site) return action.alt(mode, site) end
   }
   require'which-key'.register({
      w = {
         name = 'Browser Search',

         g = i.a('google'),
         b = i.a('googlebooks'),
         s = i.a('googlescholar'),
         w = i.a('wortbuch'),
         e = i.a('sematicscholar'),
         l = i.a('linguee_eng_ger'),

         ['<C-m>'] = i.alt_a('googleimages'),
         ['<C-g>'] = i.alt_a('google'),
         ['<C-b>'] = i.alt_a('googlebooks'),
         ['<C-s>'] = i.alt_a('googlescholar'),
         ['<C-w>'] = i.alt_a('wortbuch'),
         ['<C-e>'] = i.alt_a('sematicscholar'),
         ['<C-l>'] = i.alt_a('linguee_eng_ger'),

         z         = { zeal.cword, [[Zeal]] },
         ['<C-z>'] = { zeal.interactive, [[Zeal]], silent = false},

         i = {
            name = 'Github',

            i = i.a('github'),
            o = i.a('github_code'),
            w = i.a('github_wiki'),

            ['<C-i>'] = i.alt_a('github'),
            ['<C-o>'] = i.alt_a('github_code'),
            ['<C-w>'] = i.alt_a('github_wiki')
         }
      }
   }, { mode = mode, prefix = "<leader>" })
end

