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
        -- local harpoon_ui = require("harpoon.ui")

        -- Setup Telescope
        telescope.setup({
            defaults = {
                layout_config = {
                    width = 0.95,
                    height = 100,
                    preview_cutoff = 10,
                    horizontal = {
                        preview_width = 0.5,
                        results_width = 0.5,
                    },
                    -- prompt_position = "top",
                },
                prompt_title = "",
                results_title = "",
                -- sorting_strategy = "ascending",
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<C-a>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<C-q>"] = actions.send_to_qflist,
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
        })

        -- Load extensions
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")

        -- Key mappings
        local keymap = vim.keymap
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
                previewer = false,
            }))
        end, { desc = "Fuzzy search in current file" })

        keymap.set("n", "<leader>fe", function()
            require("telescope").extensions.file_browser.file_browser(require("telescope.themes").get_dropdown({
                previewer = false,
                hidden = true,
                respect_gitignore = true,
                -- initial_mode = "normal",
                -- width = 0.8,
                -- height = 0.6,
            }))
        end, { desc = "Open File Explorer" })

        keymap.set("n", "<leader>fh", function()
            local harpoon_files = harpoon.get_mark_config().marks or {}
            local entries = {}
            for _, file in ipairs(harpoon_files) do
                if file.filename and vim.fn.filereadable(file.filename) == 1 then
                    table.insert(entries, file.filename)
                end
            end

            local finders = require("telescope.finders")
            local pickers = require("telescope.pickers")
            local sorters = require("telescope.sorters")
            local themes = require("telescope.themes")

            pickers
                .new(themes.get_dropdown({}), {
                    prompt_title = "Files",
                    finder = finders.new_table({
                        results = entries,
                    }),
                    sorter = sorters.get_generic_fuzzy_sorter(),
                    attach_mappings = function(_, map)
                        map("i", "<CR>", function(prompt_bufnr)
                            local selection = require("telescope.actions.state").get_selected_entry()
                            actions.close(prompt_bufnr)
                            vim.cmd("edit " .. selection.value)
                        end)
                        map("n", "<CR>", function(prompt_bufnr)
                            local selection = require("telescope.actions.state").get_selected_entry()
                            actions.close(prompt_bufnr)
                            vim.cmd("edit " .. selection.value)
                        end)
                        return true
                    end,
                })
                :find()
        end, { desc = "Fuzzy find Harpoon files" })
    end,
}
