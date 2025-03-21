return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
        "ibhagwan/fzf-lua",
        "echasnovski/mini.pick",
        "isakbm/gitgraph.nvim",
    },
    --
    config = function()
        local neogit = require("neogit")
        local keymap = vim.keymap

        neogit.setup({
            integrations = {
                diffview = true,
                telescope = true,
            },
            -- Fixed signs to use valid characters
            signs = {
                section = { "▶", "▼" },
                item = { "○", "●" },
                hunk = { "›", "›" }, -- Using valid characters instead of spaces
            },

            -- Add custom status display config
            status = {
                show_head_commit_hash = true,
                recent_commit_count = 10,
                HEAD_padding = 10,
                mode_padding = 8,
                -- Customize mode text with padding
                mode_text = {
                    M = "modified  ",
                    N = "new file  ",
                    A = "added     ",
                    D = "deleted   ",
                    C = "copied    ",
                    R = "renamed   ",
                    ["?"] = "untracked",
                },
            },

            -- Make sure line numbers are disabled for cleaner UI
            disable_line_numbers = true,

            -- Adjust indentation through configuration
            kind_width = 20,

            -- Keep your existing keymaps
            mappings = {
                status = {
                    ["<tab>"] = "Toggle",
                    ["<space>"] = "Stage",
                    ["s"] = "Stage",
                    ["u"] = "Unstage",
                    ["S"] = "StageAll",
                },
            },
        })

        keymap.set("n", "<leader>go", function()
            local neogit = require("neogit")
            if neogit.buffer and neogit.buffer:is_open() then
                neogit.close()
            else
                neogit.open()
            end
        end, { silent = true, noremap = true })

        -- Add an autocmd to set indentation in Neogit buffers
        -- vim.api.nvim_create_autocmd({ "FileType" }, {
        --     pattern = "NeogitStatus",
        --     callback = function()
        --         vim.opt_local.listchars = "tab:  ,lead:·,trail:·"
        --         vim.opt_local.list = true
        --         vim.opt_local.tabstop = 4
        --         vim.opt_local.shiftwidth = 4
        --         vim.opt_local.softtabstop = 4
        --     end,
        -- })
    end,
}
