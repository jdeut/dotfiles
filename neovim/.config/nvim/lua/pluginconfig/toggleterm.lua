require'toggleterm'.setup{
   close_on_exit = false, -- close the terminal window when
   start_in_insert = false,
   open_mapping = [[<F10>]],
   shade_terminals = false
}

local Terminal = require('toggleterm.terminal').Terminal

Toggleterminals = {}

function Toggleterminals:new (o)
   o = o or {}   -- create object if user does not provide one

   self.__index = function(t,k) 
         if k == 'termwinnr' then
            return vim.fn.bufwinnr(o.termbufnr)
         elseif k == 'bufnr0' then
            return vim.fn.bufnr()
         elseif k == 'winnr0' then
            return vim.fn.bufwinnr(o.bufnr0)
         elseif k == 'termbufnr' then
            if o.terminal then
               return o.terminal.bufnr
            else
               return nil
            end
         else
            return self[k]
         end
      end

   o.terminal = Terminal:new({
      direction = "vertical",
      hidden = false,
      on_open = function(term)
         o:set_size_in_termwin()

         local tnmap = {
            ['<C-o>'] = { function() o:jump_back() end, 'jump back' },
            ['<C-[>'] = { function() o:jump_back() o:close() end, 'close and jump back' }
         }

         require('which-key').register(tnmap, {
            mode = 't', buffer = 0, prefix = ''
         })

         require('which-key').register(tnmap, {
            buffer = 0, prefix = ''
         })
      end
   })

   o.config = {
      size = 60
   }

   o.prevbufnr = 0

   setmetatable(o, self)

   return o
end

function Toggleterminals:set_size_in_termwin()
   vim.cmd(self.termwinnr .. "wincmd w")
   vim.cmd("vertical resize " .. self.config.size)
end

function Toggleterminals:prevwinnr()
   return vim.fn.bufwinnr(self.prevbufnr)
end

function Toggleterminals:resize(fn)
   local jump_back = self.bufnr0 == self.termbufnr and false or true
   fn()
   self:set_size_in_termwin()
   if jump_back then
      self:jump_back()
   end
end

function Toggleterminals:size_inc()
   self:resize( function()
      if self.config.size < 0.8 * vim.o.columns then
         self.config.size = self.config.size + 25
      end
   end)
end

function Toggleterminals:size_dec()
   self:resize( function()
      if self.config.size > 0.2 * vim.o.columns then
         self.config.size = self.config.size - 25
      end
   end)
end

function Toggleterminals:jump_back()
   vim.cmd(self:prevwinnr() .. "wincmd w")
end

function Toggleterminals:toggle()
   if self.termbufnr then
      if self.termwinnr > 0 then
         self:close()
      else
         self:open()
      end
   else
      self:open()
   end
end

function Toggleterminals:open()
   self.prevbufnr = self.bufnr0
   self.terminal:open()
   if self:prevwinnr() > 0 then
      self:jump_back()
   end
end

function Toggleterminals:jump_to_term_append()
  self:jump_to_term_normal() 
   vim.cmd("normal! A")
end

function Toggleterminals:jump_to_term_normal()
   if self.termbufnr then
      if self.termwinnr > 0 then
         vim.cmd(self.termwinnr .. "wincmd w")
      else
         self.terminal:open()
      end
   else
      self.terminal:open()
   end
end

function Toggleterminals:save_size()
   if self.termwinnr > 0 then
      self.config.size = vim.fn.winwidth(self.termwinnr)
   end
end

function Toggleterminals:close()
   if self.termwinnr > 0 then
      self:save_size()
      vim.cmd(self.termwinnr .. "close")
   end
end

function Toggleterminals:restart()
   self:jump_to_term_normal()

   vim.fn.jobstop(vim.b.terminal_job_id)
   vim.cmd([[bdelete! ]] .. self.terminal.bufnr)
   self:jump_to_term_normal()
   self:jump_back()
end

function Toggleterminals:send(opts)

   winnr = self.winnr0

   local lopts = {
      cmd = 'lua5.3'
   }

   if opts then
      for k,v in pairs(opts) do 
         lopts[k] = v
      end
   end

   if opts then
      if opts.cmd then
      end 
   end

   local dir  = vim.fn.getcwd()
   local file = vim.fn.expand("%")

   self:jump_to_term_normal()

   vim.cmd("normal! G")

   self.terminal:send(string.format("cd %s", dir), false)
   self.terminal:send(opts.cmd .. ' ' .. file, false)

   self:jump_back()
end

toggleterminals = {
   default = Toggleterminals:new()
}
