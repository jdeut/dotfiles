return function(opts)

   local default_opts = {
      prompt      = 'GitFiles❯ '
   }

   opts = type(opts) == 'table' and
      vim.tbl_deep_extend('force', default_opts, opts or {}) or
      default_opts

   local exclude = not vim.fn.expand('%:.') == ''
      and '--exclude "' .. vim.fn.expand('%:.') .. '" '
      or ''

   opts.cwd = opts.cwd and opts.cwd or
      helper.git_get_root_or_cwd()

   opts.cmd = table.concat({
      'fdfind -t f -H ',
      exclude,
      '--base-directory "',
      opts.cwd or vim.env.PWD , '" ',
      '--exec stat --printf="%Y\t%n\n"',
      ' | sort -r -k 1 | cut -f 2'
   })

   require'fzf-lua'.files(opts)
end
