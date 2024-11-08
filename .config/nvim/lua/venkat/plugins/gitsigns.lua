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
        signcolumn = false, -- Start with signs disabled
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false,
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

            -- Git actions with leader g (git)
            map("n", "<leader>gs", gs.stage_hunk, "Git stage hunk")
            map("n", "<leader>gtr", gs.reset_hunk, "Git reset hunk")
            map("v", "<leader>gs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Git stage selected hunk")
            map("v", "<leader>gtr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Git reset selected hunk")
            map("n", "<leader>gS", gs.stage_buffer, "Git stage entire buffer")
            map("n", "<leader>gR", gs.reset_buffer, "Git reset entire buffer")
            map("n", "<leader>gu", gs.undo_stage_hunk, "Git undo stage hunk")
            map("n", "<leader>gp", gs.preview_hunk, "Git preview hunk")
            map("n", "<leader>gb", function()
                gs.blame_line({ full = true })
            end, "Git blame line")
            map("n", "<leader>gtd", gs.diffthis, "Git diff this")
            map("n", "<leader>gtD", function()
                gs.diffthis("~")
            end, "Git diff against last commit")

            -- Toggle mappings under leader t (toggle)
            map("n", "<leader>tg", gs.toggle_signs, "Toggle git signs")
            map("n", "<leader>tgn", gs.toggle_numhl, "Toggle git number highlight")
            map("n", "<leader>tgl", gs.toggle_linehl, "Toggle git line highlight")
            map("n", "<leader>tgw", gs.toggle_word_diff, "Toggle git word diff")
            map("n", "<leader>tgb", gs.toggle_current_line_blame, "Toggle git line blame")

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
