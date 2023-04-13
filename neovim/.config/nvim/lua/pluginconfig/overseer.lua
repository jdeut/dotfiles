local ok, overseer = pcall(require, "overseer")
if not ok then
  vim.notify "Could not load overseer"
  return
end

overseer.setup({
   -- strategy = "toggleterm",
   component_aliases = {
      default = {
         -- These are the default components listed in the README
         -- You probably want to keep them
         "on_output_summarize",
         "on_exit_set_status",
         -- { "display_duration", detail_level = 1 },
         "on_complete_notify",
         "on_complete_dispose",
         -- This puts the parsed results into the quickfix
         { "on_result_diagnostics_quickfix", open = true },
         -- This puts the parsed results into neovim's diagnostics
         "on_result_diagnostics",
      },
      default_vscode = {
         {
            "on_output_quickfix",
            open = true,
            open_height = 5
         },
         "on_exit_set_status",
         -- "on_complete_notify",
         {
            "on_output_summarize",
            max_lines = 5
         },
         -- { "display_duration", detail_level = 1 },
         {
            "on_output_write_file",
            filename = "/tmp/overseer_output_file"
         },
      },
   }
})
