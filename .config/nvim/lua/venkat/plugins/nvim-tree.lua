return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            local nvimtree = require("nvim-tree")
            -- recommended settings from nvim-tree documentation
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            nvimtree.setup({
                view = {
                    width = 30, -- Adjusted width to avoid excessive space
                    relativenumber = true,
                    side = "left", -- Setting nvim-tree to always open on the left side
                    adaptive_size = true, -- This allows nvim-tree to automatically resize
                },
                renderer = {
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                        glyphs = {},
                    },
                },
                actions = {
                    open_file = {
                        resize_window = true, -- This resizes the window automatically when a file opens
                        window_picker = {
                            enable = false,
                        },
                    },
                },
                filters = {
                    custom = { ".DS_Store" },
                },
                git = {
                    ignore = false,
                },
            })

            local function colors()
                -- NvimTree colors
                vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#0e0e0e" })
                vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "#0e0e0e" })
                vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = "#222222", bg = "none" })
                vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#888888" })
                vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#2f2f2f" })
                vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#888888", bold = true })
                vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#888888" })
                vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#FFB800" })
                vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#4BB543" })
                vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#FF3333" })
                vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#ffb86c", underline = true })
                vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#222222" })
                vim.api.nvim_set_hl(0, "NvimTreeImageFile", { fg = "#666666" })
                vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = "#ffb86c" })
                vim.api.nvim_set_hl(0, "NvimTreeFile", { fg = "#ffb86c" })
                vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#888888" })
                vim.api.nvim_set_hl(0, "NvimTreeOpenedFileIcon", { fg = "#ffb86c" })
                vim.api.nvim_set_hl(0, "NvimTreeModifiedFile", { fg = "#888888", italic = true })
                -- vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = "#888888", bg = "#0e0e0e" })
            end

            colors()

            -- Also create an autocmd to apply colors when ColorScheme changes
            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = colors,
            })

            -- Set keymaps for nvim-tree
            local keymap = vim.keymap
            keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
            keymap.set(
                "n",
                "<leader>ef",
                "<cmd>NvimTreeFindFileToggle<CR>",
                { desc = "Toggle file explorer on current file" }
            )
            keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
            keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

            -- Open nvim-tree when starting nvim
            -- vim.api.nvim_create_autocmd({ "VimEnter" }, {
            --     callback = function()
            --         -- Open nvim-tree only if there is no file or buffer open
            --         if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0) == "" then
            --             vim.cmd("NvimTreeOpen")
            --         end
            --     end,
            -- })
        end,
    },
}
