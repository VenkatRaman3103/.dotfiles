return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = {
                    normal = {
                        a = { fg = "#ffffff", bg = "#111111" }, -- active section
                        b = { fg = "#ffffff", bg = "#111111" }, -- inactive section (lighter shade)
                        c = { fg = "#ffffff", bg = "#111111" }, -- current section (lighter shade)
                        x = { fg = "#505050", bg = "#111111" }, -- current section (lighter shade)
                        y = { fg = "#505050", bg = "#111111" }, -- current section (lighter shade)
                        z = { fg = "#505050", bg = "#111111" }, -- current section (lighter shade)
                    }, --2f2f2f -- 1a1a1a

                    -- normal = {
                    --     a = { fg = "#ffffff", bg = "#c95b20" }, -- active section
                    --     b = { fg = "#ffffff", bg = "#1a1a1a" }, -- inactive section (lighter shade)
                    --     c = { fg = "#ffffff", bg = "#111111" }, -- current section (lighter shade)
                    -- }, --2f2f2f -- 1a1a1a

                    insert = { a = { fg = "#ffffff", bg = "#111111" } }, -- Insert mode
                    visual = { a = { fg = "#ffffff", bg = "#111111" } }, -- Visual mode
                    replace = { a = { fg = "#ffffff", bg = "#111111" } }, -- Replace mode
                    command = { a = { fg = "#ffffff", bg = "#111111" } }, -- Command mode
                },
                -- component_separators = { left = "│", right = "│" }, -- Component separators
                -- section_separators = { left = "", right = "" }, -- Section separators
                section_separators = { left = "", right = "" }, -- Section separators
                global_status = true, -- If you want a global status line (optional)
            },
            -- sections = {
            --     lualine_a = { "mode" }, -- Modes (leftmost)
            --     lualine_b = { "filename" }, -- Branch section
            --     lualine_c = { "diagnostics" }, -- Filename section
            --     lualine_x = { "filetype" }, -- Encoding, file format, file type
            --     lualine_y = { "diff" }, -- Progress section
            --     lualine_z = { "branch" }, -- Location section
            -- },

            sections = {
                lualine_a = { "filename" }, -- Modes (leftmost)
                lualine_b = { "diagnostics" }, -- Branch section
                lualine_c = { "" }, -- Filename section
                lualine_x = { "diff" }, -- Encoding, file format, file type
                lualine_y = { "branch" }, -- Progress section
                lualine_z = { "" }, -- Location section
            },
            extensions = {}, -- Extensions if you have any
        })

        -- Set branch section color
        -- vim.cmd([[highlight LualineBranch guifg=#000000]]) -- Set branch name to black

        vim.g.catppuccin_flavour = "mocha"
    end,
}
