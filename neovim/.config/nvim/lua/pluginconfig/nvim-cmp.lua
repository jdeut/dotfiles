--require('plenary.job'):new({command = gxmessage', args = { vim.fn.expand('<afile>:p')}}):sync()
--
-- local present, cmp = pcall(require, 'cmp')
-- if not present then
--    print('cmp not present')
--    return
-- end

local cmp = require'cmp'

-- Setup buffer configuration (nvim-lua source only enables in Lua filetype).
-- vim.api.nvim_command([[
--    autocmd FileType denite-filter
--       lua require'cmp'.setup.buffer({ completion = { autocomplete = false } })
--       require'cmp'.abort()
-- ]] )
--

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup {
    mapping = {}
}

cmp.setup {
    completion = {
        keyword_pattern  = [[[=A-Za-zäüöÄÜÖ=][=0-9A-Za-zäüöÄÜÖß=]*\%([-_][=0-9A-Za-zäüöÄÜÖß=]*\)*]],
        keyword_length = 1
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if not cmp.select_next_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if not cmp.select_prev_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end
        end
    },    
    sources = {
        {
            name = 'buffer',
            opts = {
               keyword_length = 2,
               keyword_pattern  = [[[=A-Za-zäüöÄÜÖ=][=0-9A-Za-zäüöÄÜÖß=]*\%([-_][=0-9A-Za-zäüöÄÜÖß=]*\)*]],
               get_bufnrs = function()
                  local bufs = {}
                  for _, win in ipairs(vim.api.nvim_list_wins()) do
                     bufs[vim.api.nvim_win_get_buf(win)] = true
                  end
                  return vim.tbl_keys(bufs)
               end
            }
        },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { 
            name = 'latex_symbols',
            keyword_length = 2
        },
        {
            name = 'ultisnips',
            keyword_length = 1
        }
    },
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end
    },
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            })[entry.source.name]

            return vim_item
        end
    },
    experimental = {
        ghost_text = false
    },
}

--
-- ['<C-p>']     = cmp.mapping.select_prev_item(),
-- ['<C-n>']     = cmp.mapping.select_next_item(),
-- ['<C-h>']     = cmp.mapping.scroll_docs(-4),
-- ['<C-f>']     = cmp.mapping.scroll_docs(4),
-- ['<C-Space>'] = cmp.mapping.complete(),
-- ['<C-e>']     = cmp.mapping.close()
-- ['<CR>']      = cmp.mapping.confirm({
--     behavior = cmp.ConfirmBehavior.Insert,
--     select = true
--   })
-- },
