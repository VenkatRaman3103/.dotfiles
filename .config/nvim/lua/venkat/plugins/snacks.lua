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
                position = "left", -- Explicitly set position to left
                width = 0.25,      -- Set width to 25% of screen
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
                wo = { wrap = true } -- Wrap notifications
            },
        },
        picker = {
            enabled = true,
            layout = {
                -- preview = "main",
                -- preset = "ivy",
                preset = "telescope",
                layout = {
                    box = "horizontal",
                    width = 0,
                    min_width = 120,
                    height = 0.93,
                    -- position = "",
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
                    jump = { close = false }
                },
            }
        },
    },
    keys = {
        {
            "<leader>/",
            function()
                Snacks.picker.lines({
                    layout = "vscode",
                })
            end,
            desc = "man page",
        },
        {
            "<leader>xp",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "man page",
        },
        {
            "<leader>xf",
            function()
                Snacks.picker.diagnostics_buffer()
            end,
            desc = "man page",
        },
        {
            "<leader>fq",
            function()
                Snacks.picker.qflist()
            end,
            desc = "man page",
        },
        {
            "<leader>fm",
            function()
                Snacks.picker.marks()
            end,
            desc = "marks",
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
            desc = "man page",
        },
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "<leader>fk",
            function()
                Snacks.picker.keymaps({
                    layout = "vertical"
                })
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
            desc = "Goto T[y]pe Definition",
        },
        {
            "<leader>fs",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>reg",
            function()
                Snacks.picker.registers({
                    layout = "vertical"
                })
            end,
            desc = "View Registers",
        },
        {
            "<leader>fS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },
        -- {
        --     "<leader>eo",
        --     function()
        --         Snacks.explorer.open({
        --             layout = "sidebar",
        --             position = "left",
        --             float = false,
        --         })
        --     end,
        --     desc = "Open Explorer",
        -- },
        -- {
        --     "<leader>et",
        --     function()
        --         if Snacks.explorer.is_open() then
        --             Snacks.explorer.close()
        --         else
        --             Snacks.explorer.open({
        --                 layout = "sidebar",
        --                 position = "left",
        --                 float = false,
        --             })
        --         end
        --     end,
        --     desc = "Toggle Explorer",
        -- },
        -- {
        --     "<leader>eo",
        --     function()
        --         Snacks.explorer.open({
        --             layout = "sidebar",
        --         })
        --     end,
        --     desc = "Registers",
        -- },
        -- {
        --     "<leader>gb",
        --     function()
        --         Snacks.picker.git_branches()
        --     end,
        --     desc = "Git Branches",
        -- },
        {
            "<leader>gl",
            function()
                Snacks.picker.git_log({
                    layout = "vertical"
                })
            end,
            desc = "Git Log",
        },
        -- {
        --     "<leader>gL",
        --     function()
        --         Snacks.picker.git_log_line()
        --     end,
        --     desc = "Git Log Line",
        -- },
        -- {
        --     "<leader>gs",
        --     function()
        --         Snacks.picker.git_status()
        --     end,
        --     desc = "Git Status",
        -- },
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
            desc = "Git Log File",
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
            desc = "Recent",
        },
        -- picker
        -- {
        --     "<leader>re",
        --     function()
        --         Snacks.picker.registers()
        --     end,
        --     desc = "Registers",
        -- },
        {
            "<leader>fc",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Visual selection or word",
            mode = { "n", "x" },
        },
        --
        -- {
        --     "<leader>fg",
        --     function()
        --         Snacks.picker.git_files()
        --     end,
        --     desc = "Find Git Files",
        -- },
        -- -- git
        -- {
        --     "<leader>gc",
        --     function()
        --         Snacks.picker.git_log()
        --     end,
        --     desc = "Git Log",
        -- },
        -- {
        --     "<leader>gs",
        --     function()
        --         Snacks.picker.git_status()
        --     end,
        --     desc = "Git Status",
        -- },
        -- {
        --     "<leader>fd",
        --     function()
        --         Snacks.picker.smart(
        --         )
        --     end,
        --     desc = "Smart Find Files",
        -- },
        {
            "<leader>fd",
            function()
                Snacks.picker.files({
                    cwd = vim.fn.getcwd(), -- Use current working directory
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
                Snacks.picker.command_history({
                    layout = "vscode"
                })
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
        -- {
        --     "<leader>Z",
        --     function()
        --         Snacks.zen.zoom()
        --     end,
        --     desc = "Toggle Zoom",
        -- },
        {
            "<leader>.",
            function()
                Snacks.scratch()
            end,
            desc = "Toggle Scratch Buffer",
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
        -- {
        --     "<leader>bd",
        --     function()
        --         Snacks.bufdelete()
        --     end,
        --     desc = "Delete Buffer",
        -- },
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
        -- {
        --     "<leader>gb",
        --     function()
        --         Snacks.git.blame_line()
        --     end,
        --     desc = "Git Blame Line",
        -- },
        {
            "<leader>gf",
            function()
                Snacks.lazygit.log_file()
            end,
            desc = "Lazygit Current File History",
        },
        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
        -- {
        --     "<leader>gl",
        --     function()
        --         Snacks.lazygit.log()
        --     end,
        --     desc = "Lazygit Log (cwd)",
        -- },
        {
            "<leader>un",
            function()
                Snacks.notifier.hide()
            end,
            desc = "Dismiss All Notifications",
        },
        {
            "<c-/>",
            function()
                Snacks.terminal()
            end,
            desc = "Toggle Terminal",
        },
        -- {
        --     "<c-_>",
        --     function()
        --         Snacks.terminal()
        --     end,
        --     desc = "which_key_ignore",
        -- },
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
            desc = "Prev Reference",
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
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                -- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
                Snacks.toggle.diagnostics():map("<leader>td")
                Snacks.toggle.line_number():map("<leader>tl")
                -- Snacks.toggle
                --     .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                --     :map("<leader>tc")
                Snacks.toggle.treesitter():map("<leader>tT")
                -- Snacks.toggle
                --     .option("background", { off = "light", on = "dark", name = "Dark Background" })
                --     :map("<leader>ub")
                Snacks.toggle.inlay_hints():map("<leader>th")

                Snacks.toggle.indent():map("<leader>ti")
                -- Snacks.toggle.dim():map("<leader>tD")
            end,
        })
    end,
}
