return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        indent = { enabled = false },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
            ---@type snacks.notifier.style
            style = "compact",
        },
        ---@class snacks.dim.Config
        dim = {
            enabled = true,
            ---@type snacks.scope.Config
            scope = {
                min_size = 5,
                max_size = 20,
                siblings = true,
            },
            ---@type snacks.animate.Config|{enabled?: boolean}
            animate = {
                enabled = false,
                easing = "outQuad",
                duration = {
                    step = 20,
                    total = 300,
                },
            },
            filter = function(buf)
                return vim.g.snacks_dim ~= false
                    and vim.b[buf].snacks_dim ~= false
                    and vim.bo[buf].buftype == ""
            end,
        },
        explorer = {
            enabled = false,
            finder = "explorer",
            sort = { fields = { "sort" } },
            supports_live = true,
            tree = true,
            watch = true,
            diagnostics = true,
            diagnostics_open = false,
            git_status = true,
            git_status_open = false,
            git_untracked = true,
            follow_file = true,
            focus = "list",
            auto_close = true,
            jump = { close = true },
            layout = {
                preset = "sidebar",
                preview = false,
                position = "left",
                width = 0.25,
                height = 1,
                float = false,
            },
            formatters = {
                file = { filename_only = true },
                severity = { pos = "right" },
            },
            matcher = { sort_empty = false, fuzzy = false },
            config = function(opts)
                return require("snacks.picker.source.explorer").setup(opts)
            end,
            win = {
                list = {
                    keys = {
                        ["<BS>"] = "explorer_up",
                        ["l"] = "confirm",
                        ["h"] = "explorer_close",
                        ["a"] = "explorer_add",
                        ["d"] = "explorer_del",
                        ["r"] = "explorer_rename",
                        ["c"] = "explorer_copy",
                        ["m"] = "explorer_move",
                        ["o"] = "explorer_open",
                        ["P"] = "toggle_preview",
                        ["y"] = "explorer_yank",
                        ["u"] = "explorer_update",
                        ["<c-c>"] = "tcd",
                        ["<c-f>"] = "picker_grep",
                        ["<c-t>"] = "terminal",
                        ["."] = "explorer_focus",
                        ["I"] = "toggle_ignored",
                        ["H"] = "toggle_hidden",
                        ["Z"] = "explorer_close_all",
                        ["]g"] = "explorer_git_next",
                        ["[g"] = "explorer_git_prev",
                        ["]d"] = "explorer_diagnostic_next",
                        ["[d"] = "explorer_diagnostic_prev",
                        ["]w"] = "explorer_warn_next",
                        ["[w"] = "explorer_warn_prev",
                        ["]e"] = "explorer_error_next",
                        ["[e"] = "explorer_error_prev",
                    },
                },
            },
        },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = false },
        styles = {
            notification = {
                wo = { wrap = true },
            },
        },

        --- ✅ FIX: Added show_delay + show_duration to prevent nil arithmetic error
        picker = {
            enabled = true,
            show_delay = 0,
            show_duration = 100,
            layout = {
                preset = "default",
                layout = {
                    box = "horizontal",
                    width = 0,
                    min_width = 100,
                    height = 0.93,
                    {
                        box = "vertical",
                        border = "rounded",
                        title = "{title} {live} {flags}",
                        { win = "input", height = 1,     border = "bottom" },
                        { win = "list",  border = "none" },
                    },
                    { win = "preview", title = "{preview}", border = "rounded", width = 0.55 },
                },
            },
            layouts = {
                sidebar = {
                    layout = {
                        width = 0.25,
                        height = 1,
                        position = "left",
                        preview = false,
                        float = false,
                    },
                    jump = { close = false },
                },
                ivy = {
                    layout = {
                        box = "horizontal",
                        width = 0,
                        min_width = 100,
                        height = 0.93,
                        {
                            box = "vertical",
                            border = "rounded",
                            title = "{title} {live} {flags}",
                            { win = "input", height = 1,     border = "bottom" },
                            { win = "list",  border = "none" },
                        },
                        { win = "preview", title = "{preview}", border = "rounded", width = 0.55 },
                    },
                },
                telescope = {
                    reverse = true,
                    layout = {
                        box = "horizontal",
                        width = 0,
                        min_width = 100,
                        height = 0.93,
                        {
                            box = "vertical",
                            { win = "list",  title = " Results ", title_pos = "center", border = "rounded" },
                            { win = "input", height = 1,          border = "rounded",   title = "{title} {live} {flags}", title_pos = "center" },
                        },
                        {
                            win = "preview",
                            title = "{preview:Preview}",
                            width = 0.55,
                            border = "rounded",
                            title_pos = "center",
                        },
                    },
                },
                default = {
                    layout = {
                        box = "horizontal",
                        width = 0,
                        min_width = 100,
                        height = 0.93,
                        {
                            box = "vertical",
                            border = "rounded",
                            title = "{title} {live} {flags}",
                            { win = "input", height = 1,     border = "bottom" },
                            { win = "list",  border = "none" },
                        },
                        { win = "preview", title = "{preview}", border = "rounded", width = 0.55 },
                    },
                },
            },
        },
    },

    keys = {
        {
            "<leader>/",
            function()
                Snacks.picker.lines({ layout = "default" })
            end,
            desc = "Search Lines",
        },
        {
            "<leader>xp",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Diagnostics (Project)",
        },
        {
            "<leader>xf",
            function()
                Snacks.picker.diagnostics_buffer()
            end,
            desc = "Diagnostics (File)",
        },
        {
            "<leader>fq",
            function()
                Snacks.picker.qflist()
            end,
            desc = "Quickfix List",
        },
        {
            "<leader>fm",
            function()
                Snacks.picker.marks()
            end,
            desc = "Marks",
        },
        {
            "<leader>fj",
            function()
                Snacks.picker.jumps()
            end,
            desc = "Jumps",
        },
        {
            "<leader>man",
            function()
                Snacks.picker.man()
            end,
            desc = "Man Pages",
        },
        {
            "gd",
            function()
                local client = vim.lsp.get_active_clients({ bufnr = 0 })[1]
                if not client then
                    return
                end

                local encoding = client.offset_encoding or "utf-16"

                local params = vim.lsp.util.make_position_params(0, encoding)

                vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result)
                    if err or not result then
                        return
                    end

                    if result.result then
                        result = result.result
                    end

                    if not result or vim.tbl_isempty(result) then
                        return
                    end

                    if #result == 1 then
                        vim.lsp.util.jump_to_location(result[1], encoding)
                        return
                    end

                    Snacks.picker.lsp_definitions()
                end)
            end,
            desc = "Goto Definition",
        },
        {
            "<leader>fk",
            function()
                Snacks.picker.keymaps({ layout = "vertical" })
            end,
            desc = "Keymaps",
        },
        {
            "gD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "Goto Declaration",
        },
        {
            "gr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gi",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = "Goto Type Definition",
        },
        {
            "<leader>fs",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>fS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "Workspace Symbols",
        },
        {
            "<leader>gl",
            function()
                Snacks.picker.git_log()
            end,
            desc = "Git Log",
        },
        {
            "<leader>gS",
            function()
                Snacks.picker.git_stash()
            end,
            desc = "Git Stash",
        },
        {
            "<leader>gd",
            function()
                Snacks.picker.git_diff()
            end,
            desc = "Git Diff (Hunks)",
        },
        {
            "<leader>gf",
            function()
                Snacks.picker.git_log_file()
            end,
            desc = "Git Log (File)",
        },
        {
            "<leader>fp",
            function()
                Snacks.picker.projects()
            end,
            desc = "Projects",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Recent Files",
        },
        {
            "<leader>fc",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Grep Word / Selection",
            mode = { "n", "x" },
        },
        {
            "<leader>fd",
            function()
                Snacks.picker.files({
                    cwd = vim.fn.getcwd(),
                    prompt_title = "Project Files",
                })
            end,
            desc = "Find Project Files",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>fw",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>:",
            function()
                Snacks.picker.command_history({ layout = "vscode" })
            end,
            desc = "Command History",
        },
        {
            "<leader>n",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Notification History",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.git_files()
            end,
            desc = "Find Git Files",
        },
        {
            "<leader>zz",
            function()
                Snacks.zen()
            end,
            desc = "Toggle Zen Mode",
        },
        {
            "<leader>.",
            function()
                Snacks.scratch()
            end,
            desc = "Scratch Buffer",
        },
        {
            "<leader>fsb",
            function()
                Snacks.scratch.select()
            end,
            desc = "Select Scratch Buffer",
        },
        {
            "<leader>his",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "Notification History",
        },
        {
            "<leader>cR",
            function()
                Snacks.rename.rename_file()
            end,
            desc = "Rename File",
        },
        {
            "<leader>gB",
            function()
                Snacks.gitbrowse()
            end,
            desc = "Git Browse",
            mode = { "n", "v" },
        },
        {
            "<leader>gf",
            function()
                Snacks.lazygit.log_file()
            end,
            desc = "Lazygit File History",
        },
        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Open Lazygit",
        },
        {
            "<leader>un",
            function()
                Snacks.notifier.hide()
            end,
            desc = "Dismiss Notifications",
        },
        {
            "<c-/>",
            function()
                Snacks.terminal()
            end,
            desc = "Toggle Terminal",
        },
        {
            "]]",
            function()
                Snacks.words.jump(vim.v.count1)
            end,
            desc = "Next Reference",
            mode = { "n", "t" },
        },
        {
            "[[",
            function()
                Snacks.words.jump(-vim.v.count1)
            end,
            desc = "Previous Reference",
            mode = { "n", "t" },
        },
        {
            "<leader>N",
            desc = "Neovim News",
            function()
                Snacks.win({
                    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                    width = 0.6,
                    height = 0.6,
                    wo = {
                        spell = false,
                        wrap = false,
                        signcolumn = "yes",
                        statuscolumn = " ",
                        conceallevel = 3,
                    },
                })
            end,
        },
    },

    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                _G.dd = function(...) Snacks.debug.inspect(...) end
                _G.bt = function() Snacks.debug.backtrace() end
                vim.print = _G.dd

                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
                Snacks.toggle.diagnostics():map("<leader>td")
                Snacks.toggle.line_number():map("<leader>tl")
                Snacks.toggle.treesitter():map("<leader>tT")
                Snacks.toggle.inlay_hints():map("<leader>th")
                Snacks.toggle.indent():map("<leader>ti")
                Snacks.toggle.dim():map("<leader>tD")
            end,
        })
    end,
}
