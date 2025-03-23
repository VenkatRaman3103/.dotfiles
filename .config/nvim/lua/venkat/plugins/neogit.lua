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
    config = function()
        local neogit = require("neogit")
        local keymap = vim.keymap

        neogit.setup({
            integrations = {
                diffview = true,
                telescope = true,
                fzf_lua = true,
            },

            signs = {
                section = { "▶", "▼" },
                item = { "○", "●" },
                hunk = { "›", "›" },
            },

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

        -- Toggle Neogit with leader key
        keymap.set("n", "<leader>go", function()
            if neogit.buffer and neogit.buffer:is_open() then
                neogit.close()
            else
                neogit.open()
            end
        end, { silent = true, noremap = true })

        -- Create Fugitive-like :Git command using Neogit's API
        -- This leverages Neogit's built-in command structure
        vim.api.nvim_create_user_command("Git", function(opts)
            local args = opts.args

            -- If no arguments, open Neogit status (like :Git with no args in Fugitive)
            if args == "" then
                neogit.open()
                return
            end

            -- Parse the command and arguments
            local cmd_parts = vim.split(args, " ", { plain = true, trimempty = true })
            local subcmd = cmd_parts[1]
            table.remove(cmd_parts, 1)
            local remaining = table.concat(cmd_parts, " ")

            -- Map common Git commands to Neogit operations
            if subcmd == "add" then
                if remaining == "." then
                    -- Stage all changes
                    neogit.open()
                    -- Use Neogit's action API to stage all
                    neogit.action("Stage", "all")
                else
                    -- Stage specific files/paths
                    vim.fn.system("git add " .. remaining)
                    -- Refresh Neogit if it's open
                    if neogit.buffer and neogit.buffer:is_open() then
                        neogit.refresh_manually()
                    end
                end
            elseif subcmd == "commit" then
                -- Open commit popup directly
                neogit.open({ "commit" })
            elseif subcmd == "push" then
                -- Open push popup directly
                neogit.open({ "push" })
            elseif subcmd == "pull" then
                -- Open pull popup directly
                neogit.open({ "pull" })
            elseif subcmd == "fetch" then
                -- Open fetch popup directly
                neogit.open({ "fetch" })
            elseif subcmd == "log" then
                -- Open log popup directly
                neogit.open({ "log" })
            elseif subcmd == "diff" then
                -- Open diff popup directly
                neogit.open({ "diff" })
            elseif subcmd == "branch" then
                -- Open branch popup directly
                neogit.open({ "branch" })
            elseif subcmd == "checkout" or subcmd == "switch" then
                -- Open branch popup for checkout
                neogit.open({ "branch" })
            elseif subcmd == "merge" then
                -- Open merge popup directly
                neogit.open({ "merge" })
            elseif subcmd == "rebase" then
                -- Open rebase popup directly
                neogit.open({ "rebase" })
            elseif subcmd == "stash" then
                -- Open stash popup directly
                neogit.open({ "stash" })
            elseif subcmd == "reset" then
                -- Open reset popup directly
                neogit.open({ "reset" })
            elseif subcmd == "blame" then
                -- Fallback to git blame on current file
                vim.cmd("!git blame " .. vim.fn.expand("%"))
            else
                -- For other commands, pass through to git CLI
                local output = vim.fn.system("git " .. args)
                if vim.v.shell_error ~= 0 then
                    -- Show error in floating window
                    vim.api.nvim_err_writeln("Git error: " .. output)
                else
                    -- Show output in floating window
                    vim.api.nvim_echo({ { output, "Normal" } }, true, {})
                    -- Refresh Neogit if it's open
                    if neogit.buffer and neogit.buffer:is_open() then
                        neogit.refresh_manually()
                    end
                end
            end
        end, { nargs = "*", complete = "file" })

        -- Add autocmd to set indentation in Neogit buffers
        -- Uncomment if needed
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
