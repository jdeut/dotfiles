local job = require('plenary.job')
local path = require('plenary.path')

local Terminal = require('toggleterm.terminal').Terminal
local ui = require'toggleterm.ui'

local tt = {}

function tt:index(k)
   -- vim.api.nvim_notify(vim.inspect({k = k}), vim.log.levels.INFO, {})
   if k == 'termwinnr' then
      -- vim.api.nvim_notify(vim.inspect({d=2,t=self}), vim.log.levels.INFO, {})
      if self.terminal then
         return vim.fn.bufwinnr(self.terminal.bufnr)
      else
         return nil
      end
   elseif k == 'bufnr0' then
      return vim.api.nvim_win_get_buf(0)
   elseif k == 'winnr0' then
      return vim.api.nvim_win_get_number(0)
   elseif k == 'termbufnr' then
      if self.terminal then
         return self.terminal.bufnr
      else
         return nil
      end
   else
      return self[k]
   end
end

function tt:new (o)
   local o = o or {}   -- create object if user does not provide one

   self.__index = self.index

   setmetatable(o, self)

   self.config    = { size = 60 }
   self.prevbufnr = 0
   self.prevtabnr = 0
   self.is_init   = true
   self.terminal  = Terminal:new({
      cmd = [[env TOGGLETERM=1 zsh]],
      direction = "vertical",
      shade_terminals = false,
      -- persist_size = false,
      -- hidden = false,
      on_open = function(term)
         self:on_open()
      end
   })

   return self
end

function tt:on_first_open()
   local tnmap = {
      ['<C-o>'] = { function() self:jump_back() end, 'jump back' },
      ['<C-q>'] = { function() self:jump_back() self.terminal:close() end, 'close and jump back' }
   }

   for _,v in ipairs{'t','n'} do
      require('which-key').register(tnmap, {
         mode = v, buffer = 0, prefix = ''
      })
   end
end

function tt:on_open()
   if self.is_init then
      vim.api.nvim_notify('on_first_open', vim.log.levels.INFO, {})
      self:on_first_open()
      self.is_init = false
   end
   self:set_size()
   -- vim.api.nvim_notify(
   --    vim.inspect({test = 1, prevbufnr = self.prevbufnr, termwinnr = self.termwinnr, termwindow = self.terminal.window, termbufnr = self.terminal.bufnr}),
   --    vim.log.levels.INFO,
   --    {}
   -- )
end

function tt:set_size()
   vim.cmd("vertical resize " .. self.config.size)
end

function tt:set_size_in_termwin()
   -- vim.api.nvim_notify(
   --    vim.inspect(
   --       {
   --          termwinnr = self.termwinnr,
   --          termwin = self.terminal.window,
   --          bufnr = self.terminal.bufnr
   --       }
   --    ),
   --    vim.log.levels.INFO,
   --    {}
   -- )
   if self.termwinnr then
      if self.termwinnr > 0 then
         vim.cmd(self.termwinnr .. "wincmd w")
         self:set_size()
      end
   end
end

function tt:kill_descendant()
   if not self.terminal.bufnr then
      return false
   end

   local ret, termpid = pcall(
      vim.api.nvim_buf_get_var,
      self.terminal.bufnr,
      'terminal_job_pid'
   )

   if not ret then
      return false
   end

   job:new({
      command = 'pkill',
      args = {'-P', termpid}
   }):sync()

   return true
end

function tt:prevwinnr()
   return vim.fn.bufwinnr(self.prevbufnr)
end

function tt:resize(x)
   local jump_back = self.bufnr0 == self.termbufnr and false or true
   local conf  = self.config

   if conf.size + x > 0.2 * vim.o.columns and
      conf.size + x < 0.8 * vim.o.columns then
      conf.size = conf.size + x
   end
   self:set_size_in_termwin()
   if jump_back then
      self:jump_back()
   end
end

function tt:size_inc()
   self:resize(25)
end

function tt:size_dec()
   self:resize(-25)
end

function tt:jump_back()
   vim.cmd(self:prevwinnr() .. "wincmd w")
end

function tt:jump_to_term_append()
   self:jump_to_term_normal()
   vim.cmd("normal! A")
end

function tt:jump_to_term_normal()
   self.prevbufnr = vim.api.nvim_win_get_buf(0)

   if self.termbufnr then
      if self.termwinnr > 0 then
         -- vim.api.nvim_notify('toggleterm: termwinnr > 0', vim.log.levels.INFO, {})
         vim.cmd(self.termwinnr .. "wincmd w")
      else
         -- vim.api.nvim_notify('toggleterm: termwinnr !> 0', vim.log.levels.INFO, {})
         self.terminal:toggle()
         -- self.terminal:open()
      end
   else
      self.terminal:open()
   end
end

function tt:save_size()
   if self.termwinnr > 0 then
      self.config.size = vim.fn.winwidth(self.termwinnr)
   end
end

function tt:close()
   if self.termwinnr > 0 then
      self:save_size()
      self.terminal:close()
   end
end

function tt:send(opts)

   if not opts.cmd then
      return
   end
   if opts.args then
      assert(type(opts.args) == 'table')
   end

   self.prevbufnr = vim.api.nvim_win_get_buf(0)

   -- vim.api.nvim_notify(vim.inspect{self_prevbufnr = self.prevbufnr}, vim.log.levels.INFO, {})

   local dir  = vim.fn.getcwd()

   local lopts = {
      args = {''}
   }

   if opts then
      for k,v in pairs(opts) do
         lopts[k] = v
      end
   end

   -- vim.api.nvim_notify(vim.inspect{dir = dir}, vim.log.levels.INFO, {})

   do
      local cmd = {
         table.concat(
            lopts.args and
               {lopts.cmd, table.concat(lopts.args, ' ')} or
               {lopts.cmd},
            ' '
         )
      }

      if not self.terminal:is_open() then
         self.terminal:open()
      end

      self.terminal:change_dir(dir)
      self.terminal:send(cmd)
   end
end

function tt:send_after_kill(opts)
   self:kill_descendant()
   self:send(opts)
end

return(tt)
