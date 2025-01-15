return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")
        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local HEIGHT_RATIO = 0.95 -- Adjust this as needed
        local WIDTH_RATIO = 0.5 -- Adjust this as needed

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
            },
            renderer = {
                indent_markers = { enable = true },
                highlight_opened_files = "name",
                icons = { glyphs = {} },
            },
            actions = {
                open_file = {
                    resize_window = true,
                    quit_on_open = true,
                },
            },
            filters = {
                custom = { ".git", "node_modules", ".cache", ".DS_Store" },
                exclude = { "important_dir" },
            },
            git = {
                ignore = false,
            },
        })
        -- Define custom highlight colors with transparent backgrounds
        local function colors()
            vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = "#888888", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = "#222222", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#ffffff", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#999999", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#ffffff", bold = true, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#888888", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#FFB800", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#4BB543", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#FF3333", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#999999", underline = true, bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#999999", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeImageFile", { fg = "#888888", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = "#888888", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeFile", { fg = "#888888", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#888888", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeOpenedFileIcon", { fg = "#888888", bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeModifiedFile", { fg = "#888888", italic = true, bg = "none" })
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

        -- Optionally open nvim-tree when starting nvim (uncomment if desired)
        -- vim.api.nvim_create_autocmd({ "VimEnter" }, {
        --     callback = function()
        --         if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0) == "" then
        --             vim.cmd("NvimTreeOpen")
        --         end
        --     end,
        -- })
    end,
}
