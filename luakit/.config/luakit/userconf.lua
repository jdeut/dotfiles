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

-- print(ins.inspect(settings.get_settings()))

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

webview.add_signal("init", function (view)
    view:add_signal("navigation-request", function (v, uri)
      if string.match(string.lower(uri), ".bibtex$") then
         local mailto = "https://mail.google.com/mail/?extsrc=mailto&url=%s"
         local w = window.ancestor(v)
         w:new_tab(string.format(mailto, uri))
         return false
      end
    end)
end)

-- print(ins.inspect(window))

modes.add_binds("ex-follow", {
   {"M", "Hint all audio and video elements and play the matched media with `mpv`.", function(win)
      win:set_mode("follow", {
         prompt = "mpv",
         selector_func = "audio, video",
         evaluator = function(element, page)
            local uris = {resolve_uri(element.attr.src, page.uri)}
            for _, source in ipairs(element:query("source")) do
               table.insert(uris, resolve_uri(source.attr.src, page.uri))
            end
            if #uris ~= 0 then
               element:remove()
            end
            return uris
         end,
         func = function(uris)
            table.insert(uris, win.view.uri)
            play_media(uris, win.view.uri, win)
         end,
      })
    end},

   {"t", "Hint all links and play the matched media with `mpv`.", function(win)
      win:set_mode( "follow", {
         prompt = "mpv",
         selector = "uri",
         evaluator = "uri",
         func = function(uri)
            luakit.spawn(
               string.format("gxmessage urxvt -e 'echo wget %q'", uri), 
               function(_, status)
                  if status ~= 0 then
                     win:error("Wget error")
                  end
               end
            )
         end,
      })
   end},

   {"m", "Hint all links and play the matched media with `mpv`.", function(win)
      win:set_mode("follow", {
         prompt = "mpv",
         selector = "uri",
         evaluator = "uri",
         func = function(uri)
            luakit.spawn(string.format("mpv --force-window -- %q", uri), function(_, status)
               if status ~= 0 then
                  win:error("Could not play media")
               end
            end)
         end,
      })
   end},
})


webview .add_signal( 'init',  function( view )  --  during initialization of a new tab

   --  open certain schemes w/ other apps?  luakit.github.io/docs/pages/02-faq.html
   view :add_signal( 'navigation-request', function( v, uri, reason )

   --  return  false  to prevent requested navigation from taking place
      local low  = uri :lower()

      if low :match( 'youtube%.com/%?app=desktop' ) then
         return false  --  no redirects from mobile

      elseif low :match( 'www%.reddit%.com/chat/minimize' ) then
         return false  --  skip reddit's slow-@ss chat

      elseif low :match( '%.webv' )
         or low :match( '%.gifv' )
         or low :match( '%.mp4' )
         or low :match( '%.avi' )
         then
         --  https://github.com/ytdl-org/youtube-dl/blob/master/docs/supportedsites.md
            local str  = "youtube-dl -o '~/Videos/%%(title)s_%%(id)s.%%(ext)s' %q"
            print( os.clock(),  str :format( uri ) )
            luakit .spawn( str :format( uri ) )

            return false
      elseif low :match( '^magnet:' ) then
         local str  = 'transmission-gtk %q'

         print( os.clock(),  str :format( uri ) )
         luakit .spawn( str :format( uri ) )

         return false
      end  --  if low ...
   end)  --  view :add_signal( 'navigation-request',  ... )
end)  --  window .add_signal( 'init',  ... )

-- local view = window.tabs:atindex(window.tabs:current())

-- view:add_signal("populate-popup", function (v, menu)
--    v:notify('asdasd') 
   -- for _, item in ipairs(menu) do
   --       if type(item) == "table" then
   --          -- Optional underscore represents alt-key shortcut letter
   --          item[1] = string.gsub(item[1], "New (_?)Window", "New %1Tab")
   --       end
   -- end
-- end)
-- Creates context menu popup from table (and nested tables).
-- Use `true` for menu separators.
-- webview:add_signal("populate-popup", function (v)
--    return {
--       true,
--       { "_Toggle Source", function () w:toggle_source() end },
--       { "_Zoom", {
--          { "Zoom _In",    function () w:zoom_in()  end },
--          { "Zoom _Out",   function () w:zoom_out() end },
--          true,
--          { "Zoom _Reset", function () w:zoom_set() end }, }, },
--    }
-- end)


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
   },
   { "<Control-c>", "Copy selected text.",
      function (w)
         luakit.selection.clipboard = luakit.selection.primary
         w:notify("Copied `" .. luakit.selection.primary .. "` to clipboad...")
      end
   }
})

print( os.clock(),  'userconf loaded ' )
