-- Remove the `use` here if you're using folke/lazy.nvim.
return {
    "Exafunction/codeium.vim",
    config = function()
        -- Disable Codeium initially
        vim.g.codeium_enabled = true

        -- Keybindings
        vim.keymap.set("i", "<C-g>", function()
            return vim.fn["codeium#Accept"]()
        end, { expr = true, silent = true })

        vim.keymap.set("i", "<c-;>", function()
            return vim.fn
        end, { expr = true, silent = true })

        vim.keymap.set("i", "<c-,>", function()
            return vim.fn["codeium#CycleCompletions"](-1)
        end, { expr = true, silent = true })

        vim.keymap.set("i", "<c-x>", function()
            return vim.fn["codeium#Clear"]()
        end, { expr = true, silent = true })
    end,
}
