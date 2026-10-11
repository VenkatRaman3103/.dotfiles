return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "williamboman/mason.nvim",
    },

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        --------------------------------------------------------------------
        -- Custom layouts with fixed REPL and Breakpoints height
        --------------------------------------------------------------------
        local default_layout = {
            layouts = {
                {
                    elements = {
                        { id = "scopes",  size = 0.71 },
                        -- { id = "stacks", size = 0.29 },
                        { id = "console", size = 0.29 },
                        -- { id = "repl",   size = 0.29 },
                    },
                    size = 60,
                    position = "right",
                },
            },
            floating = { border = "rounded" },
            controls = { enabled = false },
            icons = { expanded = "▾", collapsed = "▸" },
        }

        local full_layout = {
            layouts = {
                {
                    elements = {
                        { id = "scopes",      size = 0.5 },
                        { id = "breakpoints", size = 0.25 },
                        { id = "stacks",      size = 0.25 },
                    },
                    size = 40,
                    position = "left",
                },
                {
                    elements = {
                        { id = "repl",    size = 1.0 },
                        { id = "console", size = 1.0 },
                    },
                    size = 15,
                    position = "bottom",
                },
            },
            floating = { border = "rounded" },
            controls = { enabled = false },
            icons = { expanded = "▾", collapsed = "▸" },
        }

        --------------------------------------------------------------------
        -- Setup DAP UI and virtual text
        --------------------------------------------------------------------
        dapui.setup(default_layout)

        require("nvim-dap-virtual-text").setup({
            enabled = true,
            enabled_commands = true,
            highlight_changed_variables = false,
            highlight_new_as_changed = true,
            show_stop_reason = true,
            -- Custom colors for virtual text
            highlight = { changed = "DapVirtualTextChanged", new = "DapVirtualText" },
        })

        --------------------------------------------------------------------
        -- Mason + DAP adapter install
        --------------------------------------------------------------------
        require("mason").setup()
        require("mason-nvim-dap").setup({
            ensure_installed = { "js-debug-adapter", "cpptools", "netcoredbg", "codelldb" },
            automatic_installation = true,
        })

        --------------------------------------------------------------------
        -- JS Debug Adapter (Node.js)
        --------------------------------------------------------------------
        local mason_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                args = { mason_path, "${port}" },
            },
        }

        --------------------------------------------------------------------
        -- C / C++ Debug Adapter (cpptools)
        --------------------------------------------------------------------
        dap.adapters.cppdbg = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "cpptools",
                args = { "--server", "${port}" },
            },
        }

        --------------------------------------------------------------------
        -- C# / .NET Debug Adapter (netcoredbg)
        --------------------------------------------------------------------
        dap.adapters.coreclr = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "netcoredbg",
                args = { "--interpreter=vscode", "--port", "${port}" },
            },
        }

        --------------------------------------------------------------------
        -- JavaScript / TypeScript configurations
        --------------------------------------------------------------------
        dap.configurations.javascript = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch current file",
                program = "${file}",
                cwd = "${workspaceFolder}",
                sourceMaps = true,
                protocol = "inspector",
                console = "integratedTerminal",
            },
        }
        dap.configurations.typescript = dap.configurations.javascript

        --------------------------------------------------------------------
        -- C / C++ configurations
        --------------------------------------------------------------------
        dap.configurations.c = {
            {
                name = "Launch",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
                setupCommands = {
                    {
                        description = "Enable pretty-printing for gdb",
                        text = "-enable-pretty-printing",
                        request = "execute",
                        expression = "",
                    },
                },
            },
            {
                name = "Attach to process",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
                setupCommands = {
                    {
                        description = "Enable pretty-printing for gdb",
                        text = "-enable-pretty-printing",
                        request = "execute",
                        expression = "",
                    },
                },
            },
        }
        dap.configurations.cpp = dap.configurations.c

        --------------------------------------------------------------------
        -- C# / .NET configurations
        --------------------------------------------------------------------
        dap.configurations.cs = {
            {
                name = "Launch .NET",
                type = "coreclr",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/Debug/net', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
            },
        }

        --------------------------------------------------------------------
        -- Auto open / close DAP UI
        --------------------------------------------------------------------
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        --------------------------------------------------------------------
        -- Signs (breakpoints / current line)
        --------------------------------------------------------------------
        vim.api.nvim_set_hl(0, "DapStoppedLine", { fg = "#7c7c7c", bold = true }) -- green triangle
        vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#00ff87", bold = true })  -- red dot

        vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStoppedLine', linehl = 'Debug', numhl = '' })

        --------------------------------------------------------------------
        -- Inline virtual text colors
        --------------------------------------------------------------------
        vim.api.nvim_set_hl(0, "DapVirtualText", { fg = "#7c7c7c", italic = true })
        -- vim.api.nvim_set_hl(0, "DapVirtualTextChanged", { fg = "#00ff87", bold = true })
        -- vim.api.nvim_set_hl(0, "DapVirtualTextError", { fg = "#ff5f5f", bold = true })

        --------------------------------------------------------------------
        -- Keymaps (<leader>d prefix)
        --------------------------------------------------------------------
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
        vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "DAP: Step Over" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
        vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "DAP: Step Out" })
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "DAP: Conditional Breakpoint" })
        vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
        vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP: Run Last" })
        vim.keymap.set("n", "<leader>dx", ":DapDisconnect<CR>")

        --------------------------------------------------------------------
        -- Toggle full layout with terminal: <leader>dtf
        --------------------------------------------------------------------
        local dapui_full = false
        vim.keymap.set("n", "<leader>dtf", function()
            dapui.close()
            if dapui_full then
                dapui.setup(default_layout)
                dapui_full = false
            else
                dapui.setup(full_layout)
                dapui_full = true
            end
            dapui.open()
        end, { desc = "DAP: Toggle full layout" })
    end,
}
