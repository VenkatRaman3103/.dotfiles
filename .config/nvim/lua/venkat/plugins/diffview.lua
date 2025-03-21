return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
        local diffview = require("diffview")

        -- Setup diffview with default options
        diffview.setup({
            -- Your configuration options here (if any)
        })

        -- Create a function to toggle diffview
        local diffview_toggle = function()
            local lib = require("diffview.lib")
            local view = lib.get_current_view()
            if view then
                -- If diffview is open, close it
                vim.cmd("DiffviewClose")
            else
                -- If diffview is closed, open it
                vim.cmd("DiffviewOpen")
            end
        end

        -- Map <leader>do to toggle diffview
        vim.keymap.set("n", "<leader>do", diffview_toggle, { desc = "Toggle Diffview" })
    end,
}
