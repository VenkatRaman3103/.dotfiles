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

        -- Add markdown support
        vim.g.slime_paste_file = vim.fn.tempname()

        -- Function to switch to target pane after sending text
        function _G.SlimeSendAndSwitch()
            -- First use the standard SlimeSendCell functionality
            vim.fn["slime#send_cell"]()

            -- Get the current target pane
            local config = vim.b.slime_config or vim.g.slime_default_config
            local target_pane = config.target_pane

            -- Extract session, window, and pane from the target string
            local session, window_pane = target_pane:match("([^:]+):?(.*)")

            -- If there's no explicit session, use the current session
            if not window_pane then
                window_pane = session
                session = nil
            end

            -- Format the command to switch to the pane
            local switch_cmd
            if session then
                switch_cmd = string.format("tmux select-window -t %s && tmux select-pane -t %s",
                    target_pane:gsub("%.%d+$", ""), target_pane)
            else
                switch_cmd = string.format("tmux select-pane -t %s", target_pane)
            end

            -- Execute the tmux command to switch focus
            vim.fn.system(switch_cmd)

            -- Force Vim to recognize the focus has changed (optional, might help with redraw issues)
            vim.cmd("redraw")
        end

        -- Define markdown code block handling
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                -- Use markdown code fences as cell delimiters for markdown files
                vim.b.slime_cell_delimiter = "```"

                -- Custom function to extract and send code from markdown code blocks
                vim.b.slime_get_cell = function()
                    local pos = vim.api.nvim_win_get_cursor(0)
                    local line = pos[1]
                    local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)

                    -- Find the start of the code block (looking backward)
                    local start_line = line
                    while start_line > 1 and not content[start_line]:match("^```%w*%s*$") do
                        start_line = start_line - 1
                    end

                    -- Find the end of the code block (looking forward)
                    local end_line = line
                    while end_line < #content and not content[end_line]:match("^```%s*$") do
                        end_line = end_line + 1
                    end

                    -- Extract the code (excluding the backtick delimiters)
                    if start_line < end_line then
                        -- Get the language if specified
                        local lang = content[start_line]:match("^```(%w+)")

                        -- Collect the code lines
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

        -- FZF picker to set target pane (session → window → pane)
        vim.api.nvim_create_user_command("SlimePickTarget", function()
            local fzf = require("fzf-lua")
            -- Step 1: Pick a session
            local session_cmd = "tmux list-sessions -F '#S'"
            local sessions = vim.fn.systemlist(session_cmd)
            fzf.fzf_exec(sessions, {
                prompt = "Select TMUX Session> ",
                actions = {
                    default = function(selected_session)
                        local session = selected_session[1]
                        -- Step 2: Pick a window in the selected session
                        local win_cmd = string.format("tmux list-windows -t %s -F '#W'", session)
                        local windows = vim.fn.systemlist(win_cmd)
                        fzf.fzf_exec(windows, {
                            prompt = "Select TMUX Window> ",
                            actions = {
                                default = function(selected_window)
                                    local window = selected_window[1]
                                    local full_window = string.format("%s:%s", session, window)
                                    -- Step 3: Pick a pane in the selected window
                                    local pane_cmd = string.format(
                                        "tmux list-panes -t %s -F '#{pane_index}:#{pane_current_command}'",
                                        full_window
                                    )
                                    local panes = vim.fn.systemlist(pane_cmd)
                                    -- Show only the pane index and its running command
                                    fzf.fzf_exec(panes, {
                                        prompt = "Select TMUX Pane> ",
                                        actions = {
                                            default = function(selected_pane)
                                                local pane_index = selected_pane[1]:match("^(%d+):")
                                                if pane_index then
                                                    local target = string.format("%s.%s", full_window, pane_index)
                                                    -- Set new target globally and in buffer-local config
                                                    vim.g.slime_default_config.target_pane = target
                                                    vim.b.slime_config = {
                                                        socket_name = "default",
                                                        target_pane = target,
                                                    }
                                                    vim.notify("Slime target set to: " .. target)
                                                else
                                                    vim.notify("Failed to parse target pane", vim.log.levels.ERROR)
                                                end
                                            end,
                                        },
                                    })
                                end,
                            },
                        })
                    end,
                },
            })
        end, {})

        -- Create another keybinding for just sending without switching
        vim.api.nvim_create_user_command("SlimeSendCellNoSwitch", function()
            vim.fn["slime#send_cell"]()
        end, {})
    end,
    keys = {
        { "<leader>ss", "<Plug>SlimeSend",               desc = "Slime Send" },
        { "<leader>ro", ":lua SlimeSendAndSwitch()<CR>", desc = "Slime Send Cell & Switch" },
        { "<leader>rr", ":SlimeSendCellNoSwitch<CR>",    desc = "Slime Send Cell (No Switch)" },
        { "<leader>rt", ":SlimePickTarget<CR>",          desc = "Slime: Pick Target Pane" },
    },
}
