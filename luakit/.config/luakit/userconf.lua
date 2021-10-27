-- Settings (the commented ones do not [yet] work)
--
--
-- local hide_scrollbars = require "hide_scrollbars"
--

local settings      = require "settings"
local modes         = require "modes"
local window        = require "window"
local webview       = require "webview"
local select        = require "select"
local vertical_tabs = require "vertical_tabs"
local tab_favicons  = require "tab_favicons"
local newtab_chrome = require "newtab_chrome"

local ins = require'inspect'

print(ins.inspect(settings.get_settings()))

local engines       = settings.window.search_engines

select.label_maker = function ()
    local chars = charset("asdfjklqwh")
    return sort(reverse(chars))
end

webview.show_scrollbars = true

settings.vertical_tabs.sidebar_width = 350
settings.vertical_tabs.side = 'left'
settings.webview.enable_webgl = true
settings.webview.hardware_acceleration_policy = "always"
settings.window.new_window_size = "1500x700"
settings.webview.enable_media_stream = true
settings.webview.enable_mediasource = true
settings.webview.enable_webaudio = true

settings.window.home_page = "about:"

engines.aur          = "https://aur.archlinux.org/packages.php?O=0&K=%s&do_Search=Go"
engines.aw           = "https://wiki.archlinux.org/index.php/Special:Search?fulltext=Search&search=%s"
engines.googlepdf    = "https://www.google.com/search?name=f&hl=de&q=filetype:pdf%20dissertation%20%s"
engines.google       = "https://www.google.com/search?name=f&hl=de&q=%s"

engines.default = engines.google


modes.add_binds("normal", {
    {"<space>", "command-prompt",
        function (w)
            w:enter_cmd(":")
        end
    },
    {"sa", "prev tab",
        function (w)
            w:prev_tab()
        end
    },
    {"sd", "next tab",
        function (w)
            w:next_tab()
        end
    },
    {"i", "history",
        function (w)
            w:enter_cmd(":history")
            w:activate()
            w:notify('history')
        end
    },
    {"<Alt-4>", "Open URL in a new tab.",
        function (w)
            w:enter_cmd(":tabopen ")
        end
    },
    { "<Alt-,>", "Prev Tab",
        function (w)
            w:prev_tab()
        end
    },
    { "<Alt-.>", "Prev Tab",
        function (w)
            w:next_tab()
        end
    }
})

