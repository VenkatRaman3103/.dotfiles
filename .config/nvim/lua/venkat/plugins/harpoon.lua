return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- Set Harpoon window colors

        -- Keymaps
        vim.keymap.set("n", "<leader>ho", ui.toggle_quick_menu)
        vim.keymap.set("n", "<leader>a", function()
            local fileName = vim.fn.expand("%:t")
            mark.add_file()
            vim.notify(fileName .. " is added")
        end)
        vim.keymap.set("n", "<leader>j", function()
            ui.nav_file(1)
        end)
        vim.keymap.set("n", "<leader>k", function()
            ui.nav_file(2)
        end)
        vim.keymap.set("n", "<leader>l", function()
            ui.nav_file(3)
        end)
        vim.keymap.set("n", "<leader>;", function()
            ui.nav_file(4)
        end)
        vim.keymap.set("n", "<leader>5", function()
            ui.nav_file(5)
        end)
    end,
}
