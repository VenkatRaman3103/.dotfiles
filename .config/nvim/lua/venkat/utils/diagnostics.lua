-- File: lua/venkat/toggle_diagnostics.lua

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
end

return diagnostics
