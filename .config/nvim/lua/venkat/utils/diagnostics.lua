-- File: lua/venkat/toggle_diagnostics.lua

local diagnostics = {}

vim.g.diagnostics_visible = false

function diagnostics.toggle_diagnostics()
    if vim.g.diagnostics_visible then
        vim.diagnostic.disable()
        vim.cmd([[highlight DiagnosticUnderlineError gui=none]])
        vim.cmd([[highlight DiagnosticUnderlineWarn gui=none]])
        vim.cmd([[highlight DiagnosticUnderlineInfo gui=none]])
        vim.cmd([[highlight DiagnosticUnderlineHint gui=none]])
    else
        vim.diagnostic.enable()
        vim.cmd([[highlight DiagnosticUnderlineError gui=undercurl guisp=#e06c75]])
        vim.cmd([[highlight DiagnosticUnderlineWarn gui=undercurl guisp=#e5c07b]])
        vim.cmd([[highlight DiagnosticUnderlineInfo gui=undercurl guisp=#56b6c2]])
        vim.cmd([[highlight DiagnosticUnderlineHint gui=undercurl guisp=#7b95ce]])
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

    vim.diagnostic.disable()
    vim.cmd([[highlight DiagnosticUnderlineError gui=none]])
    vim.cmd([[highlight DiagnosticUnderlineWarn gui=none]])
    vim.cmd([[highlight DiagnosticUnderlineInfo gui=none]])
    vim.cmd([[highlight DiagnosticUnderlineHint gui=none]])
end

return diagnostics
