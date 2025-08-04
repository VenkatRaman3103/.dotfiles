local js_based_languages = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
    "vue",
}

return {
    { "nvim-neotest/nvim-nio" },
    {
        "mfussenegger/nvim-dap",
        ft = js_based_languages,
        config = function()
            local dap = require("dap")

            -- Optional: highlight the line when stopped
            vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

            -- Define your own signs (remove this block if you don’t want icons)
            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
            vim.fn.sign_define("DapStopped",
                { text = "▶", texthl = "DiagnosticWarn", linehl = "Visual", numhl = "Visual" })

            for _, language in ipairs(js_based_languages) do
                dap.configurations[language] = {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = vim.fn.getcwd(),
                        sourceMaps = true,
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require("dap.utils").pick_process,
                        cwd = vim.fn.getcwd(),
                        sourceMaps = true,
                    },
                    {
                        type = "pwa-chrome",
                        request = "launch",
                        name = "Launch & Debug Chrome",
                        url = function()
                            local co = coroutine.running()
                            return coroutine.create(function()
                                vim.ui.input({
                                    prompt = "Enter URL: ",
                                    default = "http://localhost:3000",
                                }, function(url)
                                    if url ~= nil and url ~= "" then
                                        coroutine.resume(co, url)
                                    end
                                end)
                            end)
                        end,
                        webRoot = vim.fn.getcwd(),
                        protocol = "inspector",
                        sourceMaps = true,
                        userDataDir = false,
                    },
                    {
                        name = "----- ↓ launch.json configs ↓ -----",
                        type = "",
                        request = "launch",
                    },
                }
            end
        end,
        keys = {
            {
                "<leader>dO",
                function()
                    require("dap").step_out()
                end,
                desc = "Step Out",
            },
            {
                "<leader>do",
                function()
                    require("dap").step_over()
                end,
                desc = "Step Over",
            },
            {
                "<leader>da",
                function()
                    if vim.fn.filereadable(".vscode/launch.json") then
                        local dap_vscode = require("dap.ext.vscode")
                        dap_vscode.load_launchjs(nil, {
                            ["pwa-node"] = js_based_languages,
                            ["chrome"] = js_based_languages,
                            ["pwa-chrome"] = js_based_languages,
                        })
                    end
                    require("dap").continue()
                end,
                desc = "Run with Args",
            },
        },
        dependencies = {
            {
                "microsoft/vscode-js-debug",
                build =
                "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
                version = "1.*",
            },
            {
                "mxsdev/nvim-dap-vscode-js",
                config = function()
                    require("dap-vscode-js").setup({
                        debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
                        adapters = {
                            "chrome",
                            "pwa-node",
                            "pwa-chrome",
                            "pwa-msedge",
                            "pwa-extensionHost",
                            "node-terminal",
                        },
                    })
                end,
            },
            {
                "Joakker/lua-json5",
                build = "./install.sh",
            },
        },
    },
    { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
}
