local clip = require('clipboard-image')

local t = {}

t.filetype = {
   ["tex"] = {
      img_dir = "Figures/Pasted",
      img_dir_txt = "Figures/Pasted",
      prefix = "\\PastedScreenshot{",
      suffix = "}"
   }
}

t.filetype.rnoweb = t.filetype.tex

t.img_dir = function ()
   local status, ret = pcall(
      function()
            return t.filetype[vim.bo.filetype].img_dir
      end
   )

   if status then
      return ret
   else
      return 'Screenshots'
   end
end

t.img_name = function () 
   return os.date('%Y-%m-%d-%H-%M-%S') 
end

t.img_dir_txt = function () 
   local status, ret = pcall(
      function()
            return t.filetype[vim.bo.filetype].img_dir_txt
      end
   )

   if status then
      return ret
   else
      return 'Screenshots'
   end
end

t.prefix = function () 
   local status, ret = pcall(
      function()
            return t.filetype[vim.bo.filetype].prefix
      end
   )

   if status then
      return '\\asdasdad{'
   else
      return ''
   end
end

t.suffix = function () 
   local status, ret = pcall(
      function()
         return t.filetype[vim.bo.filetype].suffix
      end
   )

   if status then
      return '}'
   else
      return ''
   end
end

return t
