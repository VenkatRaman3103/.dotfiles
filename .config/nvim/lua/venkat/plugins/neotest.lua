return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-jest", -- Add the jest adapter as a dependency
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-jest")({
                    jestCommand = "npm test --",
                    jestConfigFile = "custom.jest.config.ts",
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                }),
            },
        })

        -- Keybindings for Neotest
        vim.keymap.set("n", "<leader>nti", function()
            require("neotest").run.run()
        end, { desc = "Run nearest test" })

        vim.keymap.set("n", "<leader>ntf", function()
            require("neotest").run.run(vim.fn.expand("%"))
        end, { desc = "Run test file" })

        vim.keymap.set("n", "<leader>ntr", function()
            require("neotest").output.open()
        end, { desc = "Open test output" })

        vim.keymap.set("n", "<leader>ntS", function()
            require("neotest").run.stop()
        end, { desc = "Stop test run" })

        vim.keymap.set("n", "<leader>nts", function()
            require("neotest").summary.toggle()
        end, { desc = "Toggle test summary" })
    end,
}
