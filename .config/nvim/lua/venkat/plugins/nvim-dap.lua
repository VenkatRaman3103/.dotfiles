return {
    "mfussenegger/nvim-dap",

    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Configure dap-ui
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Key mappings for debugging
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>dc", dap.continue, {})

        -- Setup dap-ui
        require("dapui").setup()

        -- Configure dap for JavaScript (Node.js)
        dap.adapters.node2 = {
            type = "executable",
            command = "node",
            args = { os.getenv("HOME") .. "/.local/share/nvim/dap-adapters/vscode-node-debug2/out/src/nodeDebug.js" },
        }

        -- Set up configurations for JavaScript debugging
        dap.configurations.javascript = {
            {
                type = "node2",
                request = "launch",
                program = "${file}", -- Ensures the current file is launched
                cwd = vim.fn.getcwd(), -- Sets the current working directory
                sourceMaps = true,
                protocol = "inspector",
                console = "integratedTerminal", -- Use the integrated terminal
                runtimeExecutable = "node", -- Specifies the runtime to be used
            },
        }
    end,
}
