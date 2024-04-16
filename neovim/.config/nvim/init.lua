vim.loader.enable()

require'config.options'
require'config.globals'
require'config.diagnostics'
require'config.style.mytcols'

-- require'style.myhl'

-- " let g:clipboard = {
-- " \   'name': 'myClipboard',
-- " \   'copy': {
-- " \      '+': ['wl-copy', '-f', '-t', 'text/plain'],
-- " \      '*': ['wl-copy', '-p', '-f', '-t', 'text/plain']
-- " \    },
-- " \   'paste': {
-- " \      '+': ['wl-paste', '-n'],
-- " \      '*': ['wl-paste', '-p', '-n']
-- " \   },
-- " \   'cache_enabled': 1,
-- " \ }

-- if exists('g:loaded_clipboard_provider')
--   unlet g:loaded_clipboard_provider
--   runtime autoload/provider/clipboard.vim
-- endif

-- lua require'skeleton'

local function bootstrap_lazy()
   local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

   if not vim.uv.fs_stat(lazypath) then
      vim.fn.system({
         "git",
         "clone",
         "--filter=blob:none",
         "https://github.com/folke/lazy.nvim.git",
         "--branch=stable", -- latest stable release
         lazypath,
      })
   end

   vim.opt.rtp:prepend(lazypath)
end

bootstrap_lazy()

require'lazy'.setup('plugins')
