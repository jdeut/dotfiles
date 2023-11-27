require('gitsigns').setup({
   numhl              = true,
   linehl             = false,
   current_line_blame = false,
   -- keymaps = {},
   current_line_blame_opts = {
      virt_text_pos = 'eol'
   },
   watch_gitdir = {
      interval = 500,
      follow_files = true
   },
   signs = {
      add          = {text = '🞧'},
      change       = {text = '⮛'},
      delete       = {text = '🗶'},
      topdelete    = {text = '‾'},
      changedelete = {text = 'ⓒ'},
   },
   current_line_blame_formatter = function(name, blame_info, opts)
      local text
      if blame_info.author == '' then
         text = blame_info.author
      else
         local date_time

         date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))

         text = string.format('%s - %s', date_time, blame_info.summary)
      end

      return {{'          ' .. text, 'GitSignsCurrentLineBlame'}}
   end,
})
