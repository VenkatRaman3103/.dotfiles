return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        -- Recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local HEIGHT_RATIO = 0.93 -- Adjust this as needed
        local WIDTH_RATIO = 0.5   -- Adjust this as needed

        nvimtree.setup({
            view = {
                relativenumber = true,
                float = {
                    enable = true,
                    open_win_config = function()
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                        local window_w = screen_w * WIDTH_RATIO
                        local window_h = screen_h * HEIGHT_RATIO
                        local window_w_int = math.floor(window_w)
                        local window_h_int = math.floor(window_h)
                        local center_x = (screen_w - window_w) / 2
                        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                        return {
                            border = "rounded",
                            relative = "editor",
                            row = center_y,
                            col = center_x,
                            width = window_w_int,
                            height = window_h_int,
                        }
                    end,
                },
                width = function()
                    return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
                end,
                signcolumn = "yes", -- Add this line to remove the signcolumn
            },
            renderer = {
                indent_markers = { enable = true },
                highlight_opened_files = "name",
                icons = {
                    glyphs = {
                        -- git = {
                        --     unstaged = "",
                        --     staged = "",
                        --     unmerged = "",
                        --     renamed = "",
                        --     untracked = "",
                        --     deleted = "",
                        --     ignored = "",
                        -- },
                        git = {
                            unstaged = "",
                            staged = "",
                            unmerged = "",
                            renamed = "",
                            untracked = "",
                            deleted = "",
                            ignored = "",
                        },
                    },
                },
                add_trailing = false, -- Add this line to remove trailing slashes
            },
            actions = {
                open_file = {
                    resize_window = true,
                    quit_on_open = true,
                },
            },
            filters = {
                custom = { ".DS_Store" },
                exclude = { "important_dir" },
            },
            git = {
                ignore = false,
            },
            filesystem_watchers = {
                enable = false,
            },
        })

        local grey = "#888888"
        local lightGrey = "#666666"
        local evenLightGrey = "#404040"

        -- Define custom highlight colors with transparent backgrounds
        local function colors()
            vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = evenLightGrey, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = "#222222", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#eeeeee", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#999999", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#ffffff", bold = true, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = lightGrey, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#FFB800", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#4BB543", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#FF3333", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#999999", underline = true, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#555555", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeImageFile", { fg = lightGrey, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = lightGrey, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeFile", { fg = lightGrey, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = lightGrey, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeOpenedFileIcon", { fg = "#ffffff", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeModifiedFile", { fg = "#ffffff", italic = true, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeOpenedHL", { fg = "#ffffff", italic = true, bg = "none" })

            vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "none", bg = "none" })
        end

        colors()

        -- Apply colors when the ColorScheme changes
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = colors,
        })

        -- Set keymaps for nvim-tree
        local keymap = vim.keymap
        keymap.set("n", "<leader>ed", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        keymap.set(
            "n",
            "<leader>eo",
            "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" }
        )
        keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
        keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    end,
}
