return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local tab_buffers = {} -- To track buffers per tab
        local last_buffer_per_tab = {} -- To remember last visited buffer per tab
        local tab_names = {} -- To store custom tab names
        local background = "#111111"

        -- Get the current tab ID
        local function current_tab()
            return vim.api.nvim_get_current_tabpage()
        end

        -- Add the current buffer to the tab's buffer list
        local function track_buffer()
            local tab = current_tab()
            local buf = vim.api.nvim_get_current_buf()

            if not tab_buffers[tab] then
                tab_buffers[tab] = {}
            end

            -- Add buffer to the tab's buffer list if not already added
            if not vim.tbl_contains(tab_buffers[tab], buf) then
                table.insert(tab_buffers[tab], buf)
            end

            -- Update the last buffer for the tab
            last_buffer_per_tab[tab] = buf
        end

        -- Remove buffers when they are deleted
        local function remove_deleted_buffers()
            for tab, buffers in pairs(tab_buffers) do
                tab_buffers[tab] = vim.tbl_filter(function(buf)
                    return vim.api.nvim_buf_is_valid(buf)
                end, buffers)
            end
        end

        -- Get the buffers for the current tab
        local function get_tab_buffers()
            local tab = current_tab()
            local buffers = tab_buffers[tab] or {}
            local current_buf = vim.api.nvim_get_current_buf()

            local buffer_names = {}
            for _, buf in ipairs(buffers) do
                local buf_name = vim.fn.bufname(buf):match("^.+/(.+)$") or vim.fn.bufname(buf)
                local color = buf == current_buf and "%#BufferActive#" or "%#BufferInactive#"
                table.insert(buffer_names, color .. buf_name .. "%*")
            end

            return "" .. table.concat(buffer_names, " ")
        end

        -- Get the tabs list
        local function get_tabs()
            local tabs = vim.api.nvim_list_tabpages()
            local current_tab = vim.api.nvim_get_current_tabpage()
            local tab_labels = {}

            for i, tab in ipairs(tabs) do
                local tab_name = tab_names[tab] or ("Tab " .. i)
                local color = tab == current_tab and "%#TabActive#" or "%#TabInactive#"
                table.insert(tab_labels, color .. tab_name .. "%*")
            end

            return "" .. table.concat(tab_labels, " ")
        end

        -- Rename the current tab (expose this function globally)
        _G.rename_tab = function()
            local tab = current_tab()
            local new_name =
                vim.fn.input("Rename Tab: ", tab_names[tab] or ("Tab " .. vim.api.nvim_tabpage_get_number(tab)))
            if new_name ~= "" then
                tab_names[tab] = new_name
            end
        end

        -- Delete all buffers in the current tab except the current one
        _G.delete_tab_buffers = function()
            local tab = current_tab()
            local current_buf = vim.api.nvim_get_current_buf()
            local buffers = tab_buffers[tab] or {}

            for _, buf in ipairs(buffers) do
                if buf ~= current_buf and vim.api.nvim_buf_is_valid(buf) then
                    vim.api.nvim_buf_delete(buf, { force = true })
                end
            end

            -- Update the tab buffer list to only include the current buffer
            tab_buffers[tab] = { current_buf }
        end

        -- Map the rename_tab function to a key (e.g., `<Leader>tr`)
        vim.api.nvim_set_keymap("n", "<Leader>tr", ":lua rename_tab()<CR>", { noremap = true, silent = true })

        -- Map the delete_tab_buffers function to <Leader>bd
        vim.api.nvim_set_keymap("n", "<Leader>bd", ":lua delete_tab_buffers()<CR>", { noremap = true, silent = true })

        -- Autocommands to track buffer usage and cleanup
        vim.api.nvim_create_autocmd({ "BufEnter" }, {
            callback = function()
                track_buffer()
            end,
        })

        vim.api.nvim_create_autocmd({ "BufDelete" }, {
            callback = function()
                remove_deleted_buffers()
            end,
        })

        vim.api.nvim_create_autocmd({ "TabEnter" }, {
            callback = function()
                -- Switch to the last visited buffer for the tab
                local tab = current_tab()
                local last_buf = last_buffer_per_tab[tab]

                if last_buf and vim.api.nvim_buf_is_valid(last_buf) then
                    vim.api.nvim_set_current_buf(last_buf)
                end
            end,
        })

        -- Lualine setup
        require("lualine").setup({
            options = {
                theme = {
                    normal = {
                        a = { fg = "#ffffff", bg = background },
                        b = { fg = "#ffffff", bg = background },
                        c = { fg = "#ffffff", bg = background },
                    },
                    insert = { a = { fg = "#ffffff", bg = background } },
                    visual = { a = { fg = "#ffffff", bg = background } },
                    replace = { a = { fg = "#ffffff", bg = background } },
                    command = { a = { fg = "#ffffff", bg = background } },
                },
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                global_status = true,
            },
            sections = {
                lualine_a = {
                    { get_tabs, color = { fg = "#ffffff", bg = background } },
                },
                lualine_b = {
                    { get_tab_buffers, color = { fg = "#ffffff", bg = background } },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            extensions = {},
        })

        -- Highlight groups
        vim.cmd([[highlight TabActive guifg=#ffffff guibg=NONE]])
        vim.cmd([[highlight TabInactive guifg=#808080 guibg=NONE]])
        vim.cmd([[highlight BufferActive guifg=#ffffff guibg=NONE]])
        vim.cmd([[highlight BufferInactive guifg=#808080 guibg=NONE]])
    end,
}
