return {
    -- {diff3_mixed}
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
        local diffview = require("diffview")

        diffview.setup({
            -- Your configuration options here (if any)
        })

        local diffview_toggle = function()
            local lib = require("diffview.lib")
            local view = lib.get_current_view()
            if view then
                vim.cmd("DiffviewClose")
            else
                vim.cmd("DiffviewOpen")
            end
        end

        vim.keymap.set("n", "<leader>do", diffview_toggle, { desc = "Toggle Diffview" })
    end,
}
