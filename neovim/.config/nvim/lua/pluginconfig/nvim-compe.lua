--require('plenary.job'):new({command = gxmessage', args = { vim.fn.expand('<afile>:p')}}):sync() 


require'compe'.setup {
    enabled          = true,
    autocomplete     = true,
    debug            = false,
    min_length       = 1,
    preselect        = 'disable',
    throttle_time    = 20,
    source_timeout   = 200,
    resolve_timeout  = 800,
    incomplete_delay = 400,
    max_abbr_width   = 100,
    max_kind_width   = 100,
    max_menu_width   = 100,
    documentation    = true,
    default_pattern  = [[[=A-Za-zäüöÄÜÖ=][=0-9A-Za-zäüöÄÜÖß=]*\%([-_][=0-9A-Za-zäüöÄÜÖß=]*\)*]],
    source = {
        buffer    = true,
        path      = true,
        nvim_lsp  = true,
        nvim_lua  = true,
        spell     = true,
        ultisnips = { priority = 750 },
        tags      = { priority = 1000 },
        vsnip     = false,
        calc      = false,
        omni      = false,
        --buffer    = true,
        --path      = false,
        --nvim_lsp  = false,
        --nvim_lua  = false,
        --ultisnips = false,
        --tags      = false,
        --vsnip     = false,
        --calc      = false,
        --omni      = false,
    }
}
