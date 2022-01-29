require'clipboard-image'.setup {
   default = {
      img_dir     = 'img',
      img_dir_txt = 'img',
      img_name = function ()
         return vim.fn.input('Image filename: ')
      end,
      affix = '%s'
      },
   tex = {
      affix = '\\includegraphics{%s}'
   },
}
