local diagnostics = {}

vim.g.diagnostics_visible = true -- Start with diagnostics visible

function diagnostics.toggle_diagnostics()
    if vim.g.diagnostics_visible then
        vim.diagnostic.disable()
    else
        vim.diagnostic.enable()
    end
    vim.g.diagnostics_visible = not vim.g.diagnostics_visible
end

function diagnostics.setup()
    vim.keymap.set("n", "<leader>td", function()
        diagnostics.toggle_diagnostics()
        if vim.g.diagnostics_visible then
            vim.notify("Diagnostics visible", vim.log.levels.INFO)
        else
            vim.notify("Diagnostics hidden", vim.log.levels.INFO)
        end
    end, { noremap = true, silent = true, desc = "Toggle diagnostics" })

    -- Initially enable diagnostics
    vim.diagnostic.enable()

    -- Configure diagnostic borders
    local float_opts = { border = "rounded", focusable = false, scope = "line" }

    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev({ float = float_opts })
    end, { noremap = true, silent = true, desc = "Go to previous diagnostic" })

    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next({ float = float_opts })
    end, { noremap = true, silent = true, desc = "Go to next diagnostic" })
end

return diagnostics
