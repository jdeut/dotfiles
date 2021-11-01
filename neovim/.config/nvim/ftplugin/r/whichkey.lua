-- "lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync() 
-- "au FileType rnoweb exe "normal ßrf\<CR>"

local function testnamemodify(name)
    return(vim.fn.fnamemodify(name, ':p:t:r:s?^test-??'))
end

local function testpath2testname_quoted(selected)
    if not selected or #selected < 2 then return selected end
    for i = 2, #selected do
        selected[i] = testnamemodify(selected[i])
        selected[i] = [["]] .. selected[i] .. [["]]
    end
    return selected
end

local fmt = string.format

local function tmpmsg(str)
    print(str)
    vim.defer_fn( function() vim.cmd([[echo ]]) end, 1400)
end

local function snapshot_review(test)
    vim.cmd([[silent RSend testthat::snapshot_review(]] .. [["]] .. test .. [["]] .. [[)]])

    -- tmpmsg(fmt('Review Testcase:: %s', test))
end

local function delete_snapshot_junk()
    vim.fn.system([[fdfind -I '^.*\.new\.svg$' . --exec rm {}]])
    vim.fn.system([[fdfind -I '^.*\.slnc$' . --exec rm {}]])
    vim.fn.system([[fdfind -I '^.*\.log$' . --exec rm {}]])
end

local function testthat_file(test, reporter)

    reporter = reporter == nil and 'multi' or reporter

    delete_snapshot_junk()

    local gitroot = vim.fn.systemlist('git rev-parse --show-toplevel')[1]

    vim.cmd(
        [[silent! RSend]] .. [[ ]] ..
        [[testthat::test_local("]] .. 
            gitroot .. [[",]] ..
            [[filter = "]] .. vim.g.r_tt_selected_test .. [[", ]] ..
            [[reporter = ']] .. reporter .. [[']] ..
        [[)]]
    )
end


local function testthat_fi(reporter)
    if vim.g.r_tt_selected_test then
        testthat_file(vim.g.r_tt_selected_test, reporter)
    else
        testthat_file(testnamemodify(vim.fn.expand('%'))) 
    end
end

local function snapshot_rev()
    if vim.g.r_tt_selected_test then
        snapshot_review(vim.g.r_tt_selected_test)
    else
        snapshot_review(testnamemodify(vim.fn.expand('%')))
    end
end

local mappings = {
    e = {
        name = 'test',
        c = {[[<Cmd>RCheckPackage<cr>]], 'Check Package'},
        p = {[[<Cmd>RTestPackage<cr>]], 'Test Package'},
        g = { 
            name = 'alternative',
            s = { function()
                    vim.g.r_tt_selected_test = testnamemodify(vim.fn.expand('%'))
                    tmpmsg(fmt('Set active testcase: %s', vim.g.r_tt_selected_test))
                end,
                'Select as Testcase'
            },
            ['<C-s>'] = { function()
                    vim.g.r_tt_selected_test = nil
                    tmpmsg('Clear testcase')
                end,
                'Clear as Testcase'
            }
        },
        f = { testthat_fi, 'Test Current File' },
        ['<C-f>'] = { snapshot_rev, 'Review Snapshot of Current File' },
        r = { function()
                vim.cmd([[RStop]])
                
                testthat_fi()
                snapshot_rev()
            end,
            'Test Selected Testcase (Default)'
        },
        ['<C-r>'] = { function()
                vim.cmd([[RStop]])

                local winid0 = vim.fn.bufwinid(vim.fn.bufnr())
                local winid1 = vim.fn.bufwinid(vim.fn.bufnr(vim.g.rplugin.R_bufname))

                -- vim.cmd([[!gxmessage "]] .. winid0 .. [[ ]] .. winid1 .. [["]])

                vim.fn.win_gotoid(winid1)
                testthat_fi("debug")
                vim.cmd([[startinsert]])
                -- snapshot_rev()
                -- vim.cmd([[RSend system("nvr --remote-expr 'win_gotoid(]] .. winid0 .. [[)'")]])
            end,
            'Test Selected Testcase (DEBUG)'
        },
        e = { function()
                local fopts = require'fzf-lua.config'.globals.files
                local actions = require'fzf-lua.actions'
                
                if not fopts.winopts then
                    fopts.winopts = {}
                end

                fopts.winopts.window_on_create = function()
                    vim.cmd([[vertical resize 60]])
                    vim.cmd([[resize 50]])
                    vim.cmd([[RStop]])
                end

                fopts.fzf_fn = require'fzf.helpers'.cmd_line_transformer({
                    cmd = 'fdfind "^test.*$" -t f --exec stat --printf "%Y\t%n\n" {} | sort -nr | cut -f2',
                    cwd = 'tests/testthat'
                })

                fopts.cwd = 'tests/testthat'

                fopts.actions['ctrl-w'] = function(selected, fopts)
                    selected_quo = testpath2testname_quoted(selected)

                    for i = 2, #selected_quo do
                        testthat_file(selected_quo[i])
                    end
                end
                
                fopts.actions['ctrl-r'] = function(selected, fopts)
                    selected_quo = testpath2testname_quoted(selected)

                    for i = 2, #selected_quo do
                        snapshot_review(selected_quo[i])
                    end
                end

                fopts.actions.default = actions.file_edit

                require'fzf-lua.core'.fzf_files(fopts) 
            end,
            'Fzf TestThat Files'
        },
        s = {
            name = 'Snapshots',
            r = { function()
                    local testname = testpath2testname_quoted(vim.fn.expand('%'))
                    snapshot_review(testname)
                end,
                'Review Snapshot'
            },
            v = { function()
                    local job = require('plenary.job'):new({
                        command = 'mirage', 
                        args = {'-R', 'tests/testthat/_snaps', '.'},
                        on_start = function() vim.cmd("silent ! pkill mirage") end
                    })

                    job:start()
                end,
                'View Snapshots'
            },
        },
        -- a = {
        --     function()
        --         coroutine.wrap( 
        --             function () 
        --                 local results = require'fzf.helpers'.cmd_line_transformer({
        --                     cmd = 'fdfind "^test.*$" --exec stat --printf "%Y\t%n\n" {} | sort -nr | cut -f2',
        --                     cwd = 'tests/testthat'
        --                 })
        --
        --                 local choice = require'fzf'.fzf(results)
        --
        --                 if choice then
        --                     vim.cmd([[silent !gxmessage ]].. choice[1])
        --                 end
        --             end
        --         )()
        --     end,
        --     'ok'
        -- }
    },
    f = { [[<Plug>RSendFile]], 'send file' },
    ['<C-k>'] = { function()
            local bufnr = vim.fn.bufnr(vim.g.rplugin.R_bufname)
            vim.cmd([[vertical botright sb ]] .. bufnr) 
            vim.cmd([[vertical resize 60]])
            vim.cmd([[wincmd w]])
        end, 'toggle bufi'
    }
}

require('which-key').register(
    mappings, {
        buffer = 0,
        prefix = '<localleader>'
    }
)
