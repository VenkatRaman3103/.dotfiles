return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Setup dap-ui
        dapui.setup()

        -- Setup virtual text
        require("nvim-dap-virtual-text").setup()

        -- Setup listeners
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            -- Keep UI open to see results
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- Simple Node.js adapter that runs entirely within Neovim
        dap.adapters.node = function(callback, config, parent)
            local spawn_opts = {
                args = {
                    "--inspect-brk=0", -- Use port 0 to get any available port
                    config.program
                },
                detached = false,
            }

            local handle, pid_or_err = vim.loop.spawn("node", spawn_opts, function(code)
                if code ~= 0 then
                    print("Node.js process exited with code", code)
                end
            end)

            if not handle then
                print("Failed to start Node.js:", pid_or_err)
                return
            end

            -- Give Node.js time to start and find the actual port it's using
            vim.defer_fn(function()
                -- Try to find the inspector port from Node.js output
                -- For now, we'll use a common approach with a random high port
                local port = math.random(9000, 9999)
                callback({
                    type = "server",
                    host = "127.0.0.1",
                    port = port,
                    options = {
                        initialize_timeout_sec = 10,
                    }
                })
            end, 500)
        end

        -- Alternative: Direct executable approach (simpler)
        dap.adapters.node_exec = {
            type = "executable",
            command = vim.fn.exepath("node") or "node",
            args = function(config)
                local args = { "--inspect-brk" }
                if config.args then
                    vim.list_extend(args, config.args)
                end
                table.insert(args, config.program)
                return args
            end,
            options = {
                env = function(config)
                    local env = {}
                    if config.env then
                        for k, v in pairs(config.env) do
                            env[k] = v
                        end
                    end
                    return env
                end,
                cwd = function(config)
                    return config.cwd or vim.fn.getcwd()
                end,
            }
        }

        -- Even simpler: use a custom function that handles everything
        local function debug_current_file()
            local file = vim.fn.expand("%:p")
            if not file or file == "" then
                print("No file to debug")
                return
            end

            -- Kill any existing debug session
            dap.terminate()

            -- Start debugging with a simple configuration
            local config = {
                type = "node_exec",
                request = "launch",
                name = "Debug Current File",
                program = file,
                cwd = vim.fn.getcwd(),
                console = "internalConsole",
                internalConsoleOptions = "openOnSessionStart",
            }

            dap.run(config)
        end

        -- Register custom debug function
        vim.api.nvim_create_user_command("DebugFile", debug_current_file, {})

        -- Configurations
        for _, language in ipairs({ "javascript", "typescript" }) do
            dap.configurations[language] = {
                {
                    name = "Launch Current File",
                    type = "node_exec",
                    request = "launch",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                    console = "internalConsole",
                    skipFiles = { "<node_internals>/**" },
                },
                {
                    name = "Launch with Arguments",
                    type = "node_exec",
                    request = "launch",
                    program = "${file}",
                    args = function()
                        local input = vim.fn.input("Arguments: ")
                        return vim.split(input, " ", { trimempty = true })
                    end,
                    cwd = "${workspaceFolder}",
                    console = "internalConsole",
                },
            }
        end

        -- Keymaps
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
        end

        map("n", "<leader>db", dap.toggle_breakpoint, "Toggle Breakpoint")
        map("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, "Conditional Breakpoint")
        map("n", "<leader>dc", dap.continue, "Continue/Start Debug")
        map("n", "<leader>df", debug_current_file, "Debug Current File")
        map("n", "<leader>ds", dap.step_over, "Step Over")
        map("n", "<leader>di", dap.step_into, "Step Into")
        map("n", "<leader>do", dap.step_out, "Step Out")
        map("n", "<leader>dr", dap.repl.toggle, "Toggle REPL")
        map("n", "<leader>dt", dapui.toggle, "Toggle Debug UI")
        map("n", "<leader>dx", dap.terminate, "Terminate Debug Session")

        -- Function keys
        map("n", "<F5>", debug_current_file, "Debug Current File")
        map("n", "<F9>", dap.toggle_breakpoint, "Toggle Breakpoint")
        map("n", "<F10>", dap.step_over, "Step Over")
        map("n", "<F11>", dap.step_into, "Step Into")
        map("n", "<F12>", dap.step_out, "Step Out")

        -- Signs
        vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DiagnosticError', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DiagnosticWarn', linehl = 'CursorLine', numhl = '' })
        vim.fn.sign_define('DapBreakpointRejected', { text = '○', texthl = 'DiagnosticHint', linehl = '', numhl = '' })

        -- Simple usage message
        -- print("Node.js Debugging Ready!")
        -- print("Set breakpoints: <leader>db")
        -- print("Debug current file: <leader>df or <F5>")
        -- print("Step through: <F10> (over), <F11> (into), <F12> (out)")
    end,
}
