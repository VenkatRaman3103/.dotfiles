return {
    "jpalardy/vim-slime",
    config = function()
        vim.g.slime_target = "tmux"
        vim.g.slime_default_config = {
            socket_name = "default",
            target_pane = ":.1",
        }
        vim.g.slime_dont_ask_default = 1
        vim.g.slime_bracketed_paste = 1
        vim.g.slime_cell_delimiter = "# %%"

        vim.g.slime_paste_file = vim.fn.tempname()

        function _G.SlimeSendAndSwitch()
            vim.fn["slime#send_cell"]()

            local config = vim.b.slime_config or vim.g.slime_default_config
            local target_pane = config.target_pane

            local session, window_pane = target_pane:match("([^:]+):?(.*)")

            if not window_pane then
                window_pane = session
                session = nil
            end

            local switch_cmd
            if session then
                switch_cmd = string.format("tmux select-window -t %s && tmux select-pane -t %s",
                    target_pane:gsub("%.%d+$", ""), target_pane)
            else
                switch_cmd = string.format("tmux select-pane -t %s", target_pane)
            end

            vim.fn.system(switch_cmd)

            vim.cmd("redraw")
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                vim.b.slime_cell_delimiter = "```"

                vim.b.slime_get_cell = function()
                    local pos = vim.api.nvim_win_get_cursor(0)
                    local line = pos[1]
                    local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)

                    local start_line = line
                    while start_line > 1 and not content[start_line]:match("^```%w*%s*$") do
                        start_line = start_line - 1
                    end

                    local end_line = line
                    while end_line < #content and not content[end_line]:match("^```%s*$") do
                        end_line = end_line + 1
                    end

                    if start_line < end_line then
                        local lang = content[start_line]:match("^```(%w+)")

                        local code_lines = {}
                        for i = start_line + 1, end_line - 1 do
                            table.insert(code_lines, content[i])
                        end

                        return table.concat(code_lines, "\n")
                    end
                    return ""
                end
            end
        })

        vim.api.nvim_create_user_command("SlimePickTarget", function()
            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local conf = require("telescope.config").values
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            local layout_config = {
                height = 0.5,
                width = 0.6,
                prompt_position = "top",
            }

            local session_cmd = "tmux list-sessions -F '#S'"
            local sessions = vim.fn.systemlist(session_cmd)

            pickers.new({}, {
                prompt_title = "",
                prompt_prefix = "enter session > ",
                finder = finders.new_table({
                    results = sessions
                }),
                sorter = conf.generic_sorter({}),
                layout_strategy = "horizontal",
                layout_config = layout_config,
                attach_mappings = function(prompt_bufnr, map)
                    actions.select_default:replace(function()
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        local session = selection[1]

                        local win_cmd = string.format("tmux list-windows -t %s -F '#W'", session)
                        local windows = vim.fn.systemlist(win_cmd)

                        pickers.new({}, {
                            prompt_title = "",
                            prompt_prefix = "enter window > ",
                            finder = finders.new_table({
                                results = windows
                            }),
                            sorter = conf.generic_sorter({}),
                            layout_strategy = "horizontal",
                            layout_config = layout_config,
                            attach_mappings = function(prompt_bufnr, map)
                                actions.select_default:replace(function()
                                    local selection = action_state.get_selected_entry()
                                    actions.close(prompt_bufnr)
                                    local window = selection[1]
                                    local full_window = string.format("%s:%s", session, window)

                                    local pane_cmd = string.format(
                                        "tmux list-panes -t %s -F '#{pane_index}:#{pane_current_command}'",
                                        full_window
                                    )
                                    local panes = vim.fn.systemlist(pane_cmd)

                                    pickers.new({}, {
                                        prompt_title = "",
                                        prompt_prefix = "enter pane > ",
                                        finder = finders.new_table({
                                            results = panes
                                        }),
                                        sorter = conf.generic_sorter({}),
                                        layout_strategy = "horizontal",
                                        layout_config = layout_config,
                                        attach_mappings = function(prompt_bufnr, map)
                                            actions.select_default:replace(function()
                                                local selection = action_state.get_selected_entry()
                                                actions.close(prompt_bufnr)
                                                local pane_index = selection[1]:match("^(%d+):")
                                                if pane_index then
                                                    local target = string.format("%s.%s", full_window, pane_index)
                                                    vim.g.slime_default_config.target_pane = target
                                                    vim.b.slime_config = {
                                                        socket_name = "default",
                                                        target_pane = target,
                                                    }
                                                    vim.notify("Slime target set to: " .. target)
                                                else
                                                    vim.notify("Failed to parse target pane", vim.log.levels.ERROR)
                                                end
                                            end)
                                            return true
                                        end,
                                    }):find()
                                end)
                                return true
                            end,
                        }):find()
                    end)
                    return true
                end,
            }):find()
        end, {})

        vim.api.nvim_create_user_command("SlimeSendCellNoSwitch", function()
            vim.fn["slime#send_cell"]()
        end, {})
    end,
    keys = {
        { "<leader>tss", "<Plug>SlimeSend",               desc = "Slime Send" },
        { "<leader>tro", ":lua SlimeSendAndSwitch()<CR>", desc = "Slime Send Cell & Switch" },
        { "<leader>trr", ":SlimeSendCellNoSwitch<CR>",    desc = "Slime Send Cell (No Switch)" },
        { "<leader>trt", ":SlimePickTarget<CR>",          desc = "Slime: Pick Target Pane" },
    },
}
