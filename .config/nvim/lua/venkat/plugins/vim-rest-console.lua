return {
    "diepm/vim-rest-console",
    config = function()
        -- Set pretty print JSON response
        vim.g.vrc_response_default_content_type = "application/json"
        vim.g.vrc_output_buffer_name = "_RESPONSE"
        vim.g.vrc_auto_format_response_patterns = {
            json = 'jq "."',
            xml = "xmllint --format -",
        }

        -- Keybinding for executing REST requests
        vim.api.nvim_set_keymap("n", "<leader>xr", ":call VrcQuery()<CR>", { noremap = true, silent = true })

        -- Set response buffer options
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "vrc-response",
            callback = function()
                -- Make response buffer read-only
                vim.opt_local.readonly = true
                -- Enable line wrapping for better readability
                vim.opt_local.wrap = true
                -- Show line numbers in response buffer
                vim.opt_local.number = true
            end,
        })
    end,
}
