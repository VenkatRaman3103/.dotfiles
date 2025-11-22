return {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest", "js", "ts", "jsx", "tsx" },
    opts = {
        curl_path = "curl",
        additional_curl_options = {},
        grpcurl_path = "grpcurl",
        websocat_path = "websocat",
        openssl_path = "openssl",

        environment_scope = "b",
        default_env = "dev",
        vscode_rest_client_environmentvars = false,

        request_timeout = nil,
        halt_on_error = true,

        certificates = {},
        urlencode = "always",
        infer_content_type = true,

        contenttypes = {
            ["application/json"] = {
                ft = "json",
                formatter = vim.fn.executable("jq") == 1 and { "jq", "." },
                pathresolver = function(...)
                    return require("kulala.parser.jsonpath").parse(...)
                end,
            },
            ["application/graphql"] = {
                ft = "graphql",
                formatter = vim.fn.executable("prettier") == 1
                    and { "prettier", "--stdin-filepath", "graphql", "--parser", "graphql" },
                pathresolver = nil,
            },
            ["application/xml"] = {
                ft = "xml",
                formatter = vim.fn.executable("xmllint") == 1 and { "xmllint", "--format", "-" },
                pathresolver = vim.fn.executable("xmllint") == 1 and { "xmllint", "--xpath", "{{path}}", "-" },
            },
            ["text/html"] = {
                ft = "html",
                formatter = vim.fn.executable("xmllint") == 1 and { "xmllint", "--format", "--html", "-" },
                pathresolver = nil,
            },
        },

        scripts = {
            node_path_resolver = nil,
        },

        ui = {
            -- display_mode = "float",
            display_mode = "split",
            split_direction = "horizontal", -- this ensures response opens in horizontal split
            win_opts = { bo = {}, wo = {} }, ---@type kulala.ui.win_config
            default_view = "body",
            winbar = true,
            default_winbar_panes = {
                "body",
                "headers",
                "headers_body",
                "verbose",
                "script_output",
                "report",
                -- "help"
            },
            show_variable_info_text = { mode = "float" },
            show_icons = "on_request",
            icons = {
                inlay = {
                    loading = "⟳ ",
                    done = "✓",
                    error = "✗",
                },
                lualine = "🐼",
                textHighlight = "WarningMsg",
            },
            syntax_hl = {
                ["@punctuation.bracket.kulala_http"] = "Number",
                ["@character.special.kulala_http"] = "Special",
                ["@operator.kulala_http"] = "Special",
                ["@variable.kulala_http"] = "String",
            },
            show_request_summary = false,
            disable_script_print_output = false,
            report = {
                show_script_output = true,
                show_asserts_output = true,
                show_summary = true,
                headersHighlight = "Special",
                successHighlight = "String",
                errorHighlight = "Error",
            },
            scratchpad_default_contents = {
                "GET http://localhost:5000/api HTTP/1.1",
            },
            disable_news_popup = false,
            lua_syntax_hl = true,
            pickers = {
                snacks = {
                    layout = function()
                        local has_snacks, snacks_picker = pcall(require, "snacks.picker")
                        if not has_snacks or type(snacks_picker.config.layout("telescope")) ~= "table" then
                            return {
                                reverse = true,
                                layout = {
                                    { { win = "list" }, { height = 1, win = "input" }, box = "vertical" },
                                    { win = "preview",  width = 0.6 },
                                    box = "horizontal",
                                    width = 0.8,
                                },
                            }
                        end

                        return vim.tbl_deep_extend("force", snacks_picker.config.layout("telescope"), {
                            reverse = true,
                            layout = {
                                { { win = "list" }, { height = 1, win = "input" }, box = "vertical" },
                                { win = "preview",  width = 0.6 },
                                box = "horizontal",
                                width = 0.8,
                            },
                        })
                    end,
                },
            },
        },

        lsp = {
            enable = true,
            keymaps = false,
            formatter = {
                sort = {
                    metadata = true,
                    variables = true,
                    commands = false,
                    json = true,
                },
            },
            on_attach = nil,
        },

        debug = 3,
        generate_bug_report = false,

        global_keymaps = false,
        global_keymaps_prefix = "<leader>R",

        kulala_keymaps = true,
        kulala_keymaps_prefix = "",
    },
    keys = {
        {
            "<leader>rs",
            function()
                require("kulala").run()
            end,
            desc = "Send request",
        },
        {
            "<leader>ra",
            function()
                require("kulala").run_all()
            end,
            desc = "Send all requests",
        },
        {
            "<leader>ro",
            function()
                vim.cmd("tabnew") -- Open a new tab
                require("kulala").scratchpad()
            end,
            desc = "Open scratchpad (tab)",
        },
    },
}
