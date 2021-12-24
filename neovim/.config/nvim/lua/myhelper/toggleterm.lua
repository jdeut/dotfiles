local job = require('plenary.job')
local path = require('plenary.path')

local Terminal = require('toggleterm.terminal').Terminal

local Toggleterminals = {}

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
            ['<C-q>'] = { function() o:jump_back() o:close() end, 'close and jump back' }
         }

         for _,v in ipairs{'t','n'} do
            require('which-key').register(tnmap, {
               mode = v, buffer = 0, prefix = ''
            })
         end
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

function Toggleterminals:kill_descendant()
   if not self.terminal.bufnr then
      return false
   end

   local termpid = vim.api.nvim_buf_get_var(
      self.terminal.bufnr,
      'terminal_job_pid'
   )

   job:new({
      command = 'pkill',
      args = {'-P', termpid},
      on_exit = function(_, result)
         if result == 0 then
            -- print('killed descendant')
         else
            -- print('no descendant to kill')
         end
      end
   }):sync()

   return true
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
   self.prevbufnr = vim.api.nvim_win_get_buf(0)

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
      vim.api.nvim_win_hide(self.termwinnr)
   end
end

function Toggleterminals:send(opts)

   if not opts.cmd then
      return
   else
      if opts.args then
         assert(type(opts.args) == 'table')
      end
   end

   self.prevbufnr = vim.api.nvim_win_get_buf(0)

   local dir  = vim.fn.getcwd()

   local lopts = {
      args = {''}
   }

   if opts then
      for k,v in pairs(opts) do
         lopts[k] = v
      end
   end

   self:jump_to_term_normal()

   vim.cmd("normal! G")

   self.terminal:send(string.format("cd %s", dir), false)

   local cmdline = table.concat(
      lopts.args and
         {lopts.cmd, table.concat(lopts.args, ' ')} or
         {lopts.cmd},
      ' '
   )

   self.terminal:send(
      cmdline, false
   )

   self:jump_back()
end

return(Toggleterminals:new())

