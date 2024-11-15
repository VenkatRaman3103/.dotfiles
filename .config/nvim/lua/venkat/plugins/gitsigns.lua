return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },
        signcolumn = false,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Initially disable blame
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol",
            delay = 500,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        preview_config = {
            border = "single",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end
            -- Navigation
            map("n", "]g", gs.next_hunk, "Next git hunk")
            map("n", "[g", gs.prev_hunk, "Previous git hunk")

            -- Git actions with intuitive mappings
            map("n", "gbs", gs.stage_hunk, "Stage hunk")
            map("n", "gbr", gs.reset_hunk, "Reset hunk")
            map("v", "gbs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Stage selected hunk")
            map("v", "gbr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Reset selected hunk")
            map("n", "gbS", gs.stage_buffer, "Stage entire buffer")
            map("n", "gbR", gs.reset_buffer, "Reset entire buffer")
            map("n", "gbu", gs.undo_stage_hunk, "Undo stage hunk")
            map("n", "gbp", gs.preview_hunk, "Preview hunk")
            map("n", "gbd", gs.diffthis, "Git diff this")
            map("n", "gbD", function()
                gs.diffthis("~")
            end, "Git diff against last commit")

            -- Toggle mappings for Git signs and blame
            map("n", "gtg", gs.toggle_signs, "Toggle git signs")
            map("n", "gtn", gs.toggle_numhl, "Toggle number highlight")
            map("n", "gtl", gs.toggle_linehl, "Toggle line highlight")
            map("n", "gtw", gs.toggle_word_diff, "Toggle word diff")
            map("n", "gbl", gs.toggle_current_line_blame, "Toggle inline blame") -- Toggle blame inline

            -- Text object
            map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", "Select git hunk")
        end,
    },
    config = function(_, opts)
        -- Set up custom colors
        vim.cmd([[
            highlight GitSignsAdd    guifg=#85c379 guibg=NONE
            highlight GitSignsChange guifg=#e5c07b guibg=NONE
            highlight GitSignsDelete guifg=#e06c75 guibg=NONE
            
            highlight GitSignsAddInline    guibg=#2d3828
            highlight GitSignsChangeInline guibg=#2d2e28
            highlight GitSignsDeleteInline guibg=#2d2828
        ]])
        require("gitsigns").setup(opts)
    end,
}
