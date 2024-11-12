return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "ThePrimeagen/harpoon", -- Add Harpoon as a dependency
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local harpoon_mark = require("harpoon.mark")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- Move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- Move to next result
                        ["<C-a>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Send to quickfix
                        ["<C-h>"] = function(prompt_bufnr)
                            local action_state = require("telescope.actions.state")
                            local picker = action_state.get_current_picker(prompt_bufnr)
                            local multi_selections = picker:get_multi_selection()

                            -- Add each selected entry to Harpoon
                            for _, entry in ipairs(multi_selections) do
                                harpoon_mark.add_file(entry.path or entry.filename)
                            end

                            actions.close(prompt_bufnr) -- Close Telescope
                            print("Added to Harpoon") -- Optional confirmation message
                        end,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        -- Key mappings
        local keymap = vim.keymap -- For conciseness

        keymap.set("n", "<leader>fd", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
        keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fa", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fb", builtin.buffers, {})
        keymap.set("n", "<leader>fj", "<cmd>Telescope jumplist<CR>")

        keymap.set("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                -- winblend = 10,
                previewer = false,
            }))
        end, { desc = "Fuzzy search in current file" })

        -- keymap.set("n", "<leader>s/", function()
        --     builtin.live_grep({
        --         grep_open_files = true,
        --         propt_title = "Live Grep in Open File",
        --     })
        -- end, { desc = "Search in open files" })
    end,
}
