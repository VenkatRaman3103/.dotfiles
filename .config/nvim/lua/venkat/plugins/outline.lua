return {
    "hedyhli/outline.nvim",
    config = function()
        vim.keymap.set("n", "<leader>to", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

        require("outline").setup({
            symbols = {
                icons = {
                    File = { icon = "󰈙", hl = "Identifier" },
                    Module = { icon = "󰆧", hl = "Include" }, -- keep if needed
                    Namespace = { icon = "󰆧", hl = "Include" }, -- moved module icon here
                    Package = { icon = "󰏖", hl = "Include" },
                    Class = { icon = "󰠱", hl = "Type" },

                    -- Your custom changes
                    Function = { icon = "λ", hl = "Function" },
                    Method = { icon = "α", hl = "Function" },

                    Property = { icon = "󰜢", hl = "Identifier" },
                    Field = { icon = "󰜢", hl = "Identifier" },
                    -- Constructor = { icon = "", hl = "Special" },
                    Enum = { icon = "󰕘", hl = "Type" },
                    Interface = { icon = "󰕘", hl = "Type" },
                    -- Variable = { icon = "󰀫", hl = "Constant" },
                    Variable = { icon = "⋅", hl = "Constant" },
                    -- 
                    -- Constant = { icon = "", hl = "Constant" },
                    Constant = { icon = "⋅", hl = "Constant" },
                    -- Constant = { icon = "󰏿", hl = "Constant" },
                    String = { icon = "󰉿", hl = "String" },
                    Number = { icon = "󰎠", hl = "Number" },
                    Boolean = { icon = "󰨙", hl = "Boolean" },
                    Array = { icon = "󰅪", hl = "Type" },
                    Object = { icon = "󰅩", hl = "Type" },
                    Key = { icon = "󰌋", hl = "Identifier" },
                    Null = { icon = "󰟢", hl = "Comment" },
                    EnumMember = { icon = "󰕘", hl = "Constant" },
                    Struct = { icon = "󰆼", hl = "Type" },
                    Event = { icon = "", hl = "Special" },
                    Operator = { icon = "󰆕", hl = "Operator" },
                    TypeParameter = { icon = "󰊄", hl = "Type" },
                },
            },
        })
    end,
}
