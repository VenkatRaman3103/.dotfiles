return {
    "ggandor/leap.nvim",
    config = function()
        local leap = require("leap")
        leap.add_default_mappings()
        leap.opts.case_sensitive = true

        -- Unmap the default mappings
        vim.keymap.del({ "n", "x", "o" }, "s")
        vim.keymap.del({ "n", "x", "o" }, "S")

        -- Map <leader>s and <leader>S to leap forward and backward
        vim.keymap.set({ "n", "x", "o" }, "<leader>s", function()
            leap.leap({ target_windows = { vim.fn.win_getid() } })
        end, { desc = "Leap forward" })

        vim.keymap.set({ "n", "x", "o" }, "<leader>S", function()
            leap.leap({ backward = true, target_windows = { vim.fn.win_getid() } })
        end, { desc = "Leap backward" })
    end,
}
