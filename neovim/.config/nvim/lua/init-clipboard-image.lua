clip = require('clipboard-image')

init_clipboard_image = {}

init_clipboard_image.filetype = {
            ["tex"] = {
                img_dir = "Figures/Pasted",
                img_dir_txt = "Figures/Pasted",
                prefix = "\\PastedScreenshot{",
                suffix = "}"
            }
        }

init_clipboard_image.filetype.rnoweb = init_clipboard_image.filetype.tex

init_clipboard_image.img_dir = function ()

        local status, ret = pcall(
            function()
                return init_clipboard_image.filetype[vim.bo.filetype].img_dir
            end
        )

        if status then
            return ret
        else
            return 'Screenshots'
        end
	end

init_clipboard_image.img_name = function () 
        return os.date('%Y-%m-%d-%H-%M-%S') 
	end

init_clipboard_image.img_dir_txt = function () 
        local status, ret = pcall(
            function()
                return init_clipboard_image.filetype[vim.bo.filetype].img_dir_txt
            end
        )

        if status then
            return ret
        else
            return 'Screenshots'
        end
	end

init_clipboard_image.prefix = function () 
        local status, ret = pcall(
            function()
                return init_clipboard_image.filetype[vim.bo.filetype].prefix
            end
        )

        if status then
            return '\\asdasdad{'
        else
            return ''
        end
    end

init_clipboard_image.suffix = function () 
        local status, ret = pcall(
            function()
                return init_clipboard_image.filetype[vim.bo.filetype].suffix
            end
        )

        if status then
            return '}'
        else
            return ''
        end
    end


