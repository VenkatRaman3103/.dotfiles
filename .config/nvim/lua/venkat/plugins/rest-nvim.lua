-- return {
--     "rest-nvim/rest.nvim",
--     dependencies = {
--         "nvim-treesitter/nvim-treesitter",
--         opts = function(_, opts)
--             opts.ensure_installed = opts.ensure_installed or {}
--             table.insert(opts.ensure_installed, "http")
--         end,
--     },
-- }

-- Combined REST Client setup with support for VRC format
return {
    "diepm/vim-rest-console",
    config = function()
        -- Basic VRC configuration
        vim.g.vrc_response_default_content_type = "application/json"
        vim.g.vrc_output_buffer_name = "_RESPONSE"
        -- vim.g.vrc_show_command = 1

        -- Check if jless is available
        local has_jless = vim.fn.executable("jless") == 1
        local has_jq = vim.fn.executable("jq") == 1

        -- Define function to open buffer in jless
        function _G.open_in_jless()
            -- Save the content to a temporary file
            local temp_file = vim.fn.tempname()
            vim.cmd("write! " .. temp_file)

            -- Open in jless in a terminal buffer
            vim.cmd("terminal jless " .. temp_file)
            vim.cmd("startinsert")

            -- Delete the temp file when the terminal closes
            vim.api.nvim_create_autocmd("TermClose", {
                pattern = "*",
                callback = function()
                    vim.fn.delete(temp_file)
                end,
                once = true,
            })
        end

        -- Command to open the current buffer in jless
        vim.api.nvim_create_user_command("JLess", function()
            _G.open_in_jless()
        end, {})

        -- Use jq for initial formatting if available
        if has_jq then
            vim.g.vrc_auto_format_response_patterns = {
                json = 'jq "."',
                xml = "xmllint --format -",
            }
        end

        -- Set up auto command to handle _RESPONSE buffer
        vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            pattern = "_RESPONSE",
            callback = function()
                -- Set filetype for basic syntax highlighting
                vim.cmd("set filetype=json")
                -- Enable syntax highlighting
                vim.cmd("syntax enable")

                -- Check if it looks like JSON
                local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
                if first_line:match("^%s*[{[]") then
                    -- Add keybinding to open in jless
                    vim.api.nvim_buf_set_keymap(
                        0,
                        "n",
                        "<leader>jl",
                        ":JLess<CR>",
                        { noremap = true, silent = true, desc = "Open in jless" }
                    )

                    -- Show a message about the jless keybinding
                    if has_jless then
                        vim.api.nvim_echo({ { "Press <leader>jl to open in jless", "WarningMsg" } }, true, {})
                    end
                end
            end,
        })

        -- Keybinding for executing REST requests - keeping your preferred <leader>xr
        vim.api.nvim_set_keymap(
            "n",
            "<leader>xr",
            ":call VrcQuery()<CR>",
            { noremap = true, silent = true, desc = "Execute REST request" }
        )
    end,

    -- Add dependencies for better JSON support
    dependencies = {
        "sheerun/vim-polyglot", -- Comprehensive language pack
    },
}
