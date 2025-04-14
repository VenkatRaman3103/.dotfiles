return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local secondaryBgColor = "#090909"

        -- Set Harpoon window colors
        -- vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = secondaryBgColor, fg = "#ffffff" })
        -- vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#555555", bg = secondaryBgColor })
        -- vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = "#ffffff", bold = false })

        -- Keymaps
        vim.keymap.set("n", "<leader>ho", ui.toggle_quick_menu)
        vim.keymap.set("n", "<leader>a", function()
            local fileName = vim.fn.expand("%:t")
            mark.add_file()
            vim.notify(fileName .. " is added")
        end)
        vim.keymap.set("n", "<leader>1", function()
            ui.nav_file(1)
        end)
        vim.keymap.set("n", "<leader>2", function()
            ui.nav_file(2)
        end)
        vim.keymap.set("n", "<leader>3", function()
            ui.nav_file(3)
        end)
        vim.keymap.set("n", "<leader>4", function()
            ui.nav_file(4)
        end)
        vim.keymap.set("n", "<leader>5", function()
            ui.nav_file(5)
        end)
    end,
}
