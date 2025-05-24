return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "ThePrimeagen/harpoon",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local harpoon = require("harpoon")
        local harpoon_mark = require("harpoon.mark")
        local harpoon_ui = require("harpoon.ui")

        -- Setup Telescope
        telescope.setup({
            defaults = {
                layout_config = {
                    width = 0.99,
                    height = 0.95,
                    preview_cutoff = 10,
                    horizontal = {
                        preview_width = 0.6,
                        results_width = 0.4,
                    },
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
                prompt_title = "",
                results_title = "",
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_to_qflist,
                        ["<C-a>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<C-h>"] = function(prompt_bufnr)
                            local action_state = require("telescope.actions.state")
                            local picker = action_state.get_current_picker(prompt_bufnr)
                            local multi_selections = picker:get_multi_selection()
                            for _, entry in ipairs(multi_selections) do
                                harpoon_mark.add_file(entry.path or entry.filename)
                            end
                            actions.close(prompt_bufnr)
                            print("Added to Harpoon")
                        end,
                    },
                },
            },
            pickers = {
                find_files = {
                    previewer = true,
                    -- layout_config = { width = 0.7, height = 0.6 },
                },
                buffers = {
                    previewer = true,
                    -- layout_config = { width = 0.8, height = 0.6 },
                },
                file_browser = {
                    previewer = true,
                    -- layout_config = { width = 0.7, height = 0.6 },
                },
                live_grep = { previewer = true },
                grep_string = { previewer = true },
                lsp_document_symbols = { previewer = true },
            },
        })

        -- Load extensions
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")

        -- Key mappings
        local keymap = vim.keymap
        keymap.set("n", "<leader>tfd", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>tfr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>tfs", builtin.lsp_document_symbols, {})
        keymap.set("n", "<leader>tfw", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>tfa", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
        keymap.set("n", "<leader>tft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
        keymap.set("n", "<leader>tfc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>tfb", builtin.buffers, {})
        keymap.set("n", "<leader>tfj", "<cmd>Telescope jumplist<CR>")
        keymap.set("n", "<leader>t/", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ previewer = false }))
        end, { desc = "Fuzzy search in current file" })

        keymap.set("n", "<leader>tfe", function()
            require("telescope").extensions.file_browser.file_browser(require("telescope.themes").get_dropdown({
                previewer = false,
                hidden = true,
                respect_gitignore = true,
                layout_config = { width = 0.8, height = 0.6 },
            }))
        end, { desc = "Open File Explorer" })
    end,
}
