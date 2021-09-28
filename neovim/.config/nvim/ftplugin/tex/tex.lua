-- require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync()

vim.opt_local.keywordprg='texdoc'

vim.opt_local.linebreak=true
vim.opt_local.foldlevel=1

vim.opt_local.formatprg='latexindent -m -rv'
vim.opt_local.tabstop=3
vim.opt_local.shiftwidth=0
vim.opt_local.iskeyword:append(':')
vim.opt_local.iskeyword:append('-')
vim.opt_local.conceallevel=0
vim.opt_local.foldmethod='indent'

vim.b.ftype_tex_build_dir = 'compiled'
