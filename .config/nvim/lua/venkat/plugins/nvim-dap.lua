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
        vim.keymap.set("n", "<leader>dtb", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>dc", dap.continue, {})
        vim.keymap.set("n", "<leader>dn", dap.step_over, {}) -- Step over
        vim.keymap.set("n", "<leader>di", dap.step_into, {}) -- Step into
        vim.keymap.set("n", "<leader>do", dap.step_out, {})  -- Step out
        vim.keymap.set("n", "<leader>dr", dap.repl.open, {}) -- Open REPL

        -- Setup dap-ui
        dapui.setup()

        -- SIMPLIFIED NODE ADAPTER - Direct Node Inspector Protocol
        dap.adapters.node = {
            type = "executable",
            command = "node",
            args = { "--inspect-brk=${port}", "${file}" },
            options = {
                detached = false,
            },
        }

        -- Simple Node.js configuration
        dap.configurations.javascript = {
            {
                type = "node",
                request = "launch",
                name = "Launch File (Node)",
                runtimeArgs = { "--inspect-brk=${port}" },
                program = "${file}",
                cwd = "${workspaceFolder}",
                sourceMaps = true,
                protocol = "inspector",
                console = "integratedTerminal",
                port = function()
                    return math.random(40000, 50000)
                end,
            },
        }

        -- Add TypeScript support (same as JavaScript)
        dap.configurations.typescript = dap.configurations.javascript
    end,
}
