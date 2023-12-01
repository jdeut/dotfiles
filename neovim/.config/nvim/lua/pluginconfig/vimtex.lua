vim.g.vimtex_enabled = 1
vim.g.vimtex_compiler_method = 'latexmk'

vim.g.vimtex_compiler_latexmk = {
   build_dir = 'compiled',
   callback = 1,
   continuous = 0,
   exeutable = 'latexmk',
   hooks = {},
   options = {
      '-verbose',
      '-file-line-error',
      '-synctex=1',
      '-interaction=nonstopmode',
   }
}

vim.g.vimtex_quickfix_ignore_filters  = {
   'Underfull',
   'Overfull',
   'inputenc Warning',
   'fontawesome5 Warning',
   'everypage Warning',
   'Package hyperref Warning',
   'Package typearea Warning: Bad type area settings!'
}


vim.g.vimtex_view_method                         = 'general'

vim.g.vimtex_view_general_viewer                 = 'okular'
vim.g.vimtex_view_general_options                = '--noraise --unique file:@pdf#src:@line@tex'
vim.g.vimtex_view_forward_search_on_start        = 1

vim.g.vimtex_view_general_viewer                 = 'zathura'
vim.g.vimtex_view_zathura_check_libsynctex       = true
vim.g.vimtex_view_enabled                        = 1
vim.g.vimtex_view_method                         = 'general'
vim.g.vimtex_view_automatic                      = 1
vim.g.vimtex_imaps_enabled                       = 0

vim.g.tex_no_error                               = 1
vim.g.vimtex_syntax_enabled                      = 1
vim.g.vimtex_syntax_nospell_comments             = 1
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 3
vim.g.vimtex_quickfix_open_on_warning            = 0
vim.g.vimtex_text_obj_variant                    = 'vimtex'
vim.g.vimtex_motion_enabled                      = 1
vim.g.vimtex_fold_enabled                        = 0
vim.g.vimtex_quicktex_open_on_warning            = 0
vim.g.vimtex_subfile_start_local                 = 1

vim.g.vimtex_mappings_disable = {
   n = '<localleader>ll'
}

vim.g.vimtex_complete_ref = {
   custom_patterns = '^.*\\subref{s*$'
}

-- vim.g.vimtex_doc_handlers                        = {'MyHandler'}
-- vim.cmd("call vimtex#init()")
-- vim.g.vimtex_imaps_enabled = 0
