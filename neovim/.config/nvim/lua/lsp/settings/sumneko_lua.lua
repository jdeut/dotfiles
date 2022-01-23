return {
   Lua = {
      diagnostics = { -- recognize the `vim` global
         globals = {'it', 'describe', 'require', 'use', 'love'},
         enable = true
      },
      telemetry = { -- Do not send telemetry data
         enable = false,
      }
   }
}
