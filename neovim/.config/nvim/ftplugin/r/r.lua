-- vim.opt_local.isfname:remove(',')

vim.opt_local.spell      = true
vim.opt_local.foldmethod = 'syntax'

-- get winid of R terminal buffer
--
-- vim.fn.bufwinid(vim.g.rplugin.R_bufname)
--
-- return -1 if not on same tab
--
-- vim.fn.bufwinnr(vim.g.rplugin.R_bufname)
-- 
--
-- get buffer handle with vim.fn.bufnr(vim.g.rplugin.R_bufname))
--
-- get name of bufnr
--      vim.api.nvim_buf_get_name(vim.fn.bufnr(vim.g.rplugin.R_bufname))

