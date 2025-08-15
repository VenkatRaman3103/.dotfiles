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
    -- Configure how diagnostics are displayed
    vim.diagnostic.config({
        virtual_text = true,
        signs = false,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
            focusable = true,
            scope = "line",
        },
    })

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

    -- Diagnostic navigation
    local float_opts = { border = "rounded", focusable = false, scope = "line" }

    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev({ float = float_opts })
    end, { noremap = true, silent = true, desc = "Go to previous diagnostic" })

    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next({ float = float_opts })
    end, { noremap = true, silent = true, desc = "Go to next diagnostic" })

    -- Show diagnostic for the current line
    vim.keymap.set("n", "<leader>dl", function()
        vim.diagnostic.open_float(nil, { border = "rounded", scope = "line" })
    end, { noremap = true, silent = true, desc = "Show diagnostics for line" })

    -- Disable underlines and apply color directly to the words with diagnostics
end

return diagnostics
