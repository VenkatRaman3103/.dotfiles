return {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
    config = function()
        vim.g.rustaceanvim = {
            tools = {
                mason = false,
            },
            server = {
                on_attach = function(client, bufnr)
                    local opts = { buffer = bufnr, silent = true }
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                end,

                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                        checkOnSave = {
                            command = "clippy",
                        },
                        inlayHints = {
                            enable = true,
                            typeHints = {
                                enable = true,
                                -- You can also add position settings if needed
                            },
                            chainingHints = true,
                            parameterHints = true,
                        },
                    },
                },
            },
        }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "rust",
            callback = function()
                local clients = vim.lsp.get_active_clients({ bufnr = 0 })
                for _, client in ipairs(clients) do
                    -- If rust_analyzer is running but not from rustaceanvim, stop it
                    if client.name == "rust_analyzer" and not client.name:match("rustaceanvim") then
                        vim.lsp.stop_client(client.id, true)
                    end
                end
            end,
        })
    end,
}
