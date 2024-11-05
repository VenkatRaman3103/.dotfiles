-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap
local fn = vim.fn

-- Function to clean CRLF from pasted text
local function paste_clean()
    -- Get the current content in the clipboard
    local reg_content = vim.fn.getreg("+")
    -- Remove both CR and CRLF patterns to ensure all are cleaned
    reg_content = reg_content:gsub("\r\n", "\n"):gsub("\r", "\n")
    -- Set the cleaned content back in the register
    vim.fn.setreg("+", reg_content)
    -- Perform the paste
    return '"+p'
end

-- Map copying to system clipboard
keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to clipboard" })

-- Map clean paste from system clipboard in all modes
keymap.set("n", "<leader>p", paste_clean, { expr = true, desc = "Paste from clipboard (cleaned)" })
keymap.set("v", "<leader>p", paste_clean, { expr = true, desc = "Paste selection from clipboard (cleaned)" })
-- keymap.set("n", "<leader>p", function()
--     -- Set cleaned clipboard content
--     local reg_content = vim.fn.getreg("+"):gsub("\r\n", "\n"):gsub("\r", "\n")
--     vim.fn.setreg("+", reg_content)
--     -- Paste in insert mode
--     return vim.api.nvim_replace_termcodes("<C-r>+", true, true, true)
-- end, { expr = true, desc = "Paste from clipboard in insert mode (cleaned)" })

-- Mapping for Alt+n to escape insert mode
keymap.set("i", "<A-n>", "<Esc>", { noremap = true, silent = true, desc = "Alt + n to escape insert mode" })
keymap.set("n", "<A-n>", "<Esc>", { noremap = true, silent = true })
keymap.set("v", "<A-n>", "<Esc>", { noremap = true, silent = true })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tabs management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Scrolling to stay in place
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "G", "Gzz")

-- Searching in place
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Pasting from the system clipboard
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader><CR>", ":source ~/.config/nvim/init.lua<CR>")

-- closing all buffers
keymap.set("n", "<leader>bd", ":%bd<CR>")

-- quick fix likst
keymap.set("n", "<leader>co", ":copen<CR>")
keymap.set("n", "<leader>cc", ":cclose<CR>")
-- keymap.set("n", "<leader>a", function()
--     vim.fn.setqflist({ { bufnr = vim.fn.bufnr() } }, "a")
-- end)
keymap.set("n", "<leader>cn", ":cnext<CR>")
keymap.set("n", "<leader>cp", ":cprev<CR>")

-- Function to add the current buffer to the quickfix list without duplication
local function add_to_quickfix()
    local bufnr = fn.bufnr()
    local filename = fn.bufname(bufnr)

    -- Check for duplicates
    local quickfix_list = fn.getqflist()
    for _, item in ipairs(quickfix_list) do
        if item.bufnr == bufnr then
            print("File is already in the quickfix list.")
            return
        end
    end

    -- Add current buffer to the quickfix list
    fn.setqflist({ { bufnr = bufnr, filename = filename } }, "a")
    print("File added to the quickfix list.")
end

-- Function to add files from nvim-tree to the quickfix list without duplication
local function add_from_nvim_tree_to_quickfix()
    local selected_files = require("nvim-tree.api").marks.list() -- Updated API call
    local quickfix_list = vim.fn.getqflist()
    local new_entries = {}

    -- Check each selected file for duplicates before adding
    for _, file in ipairs(selected_files) do
        local already_exists = false
        for _, item in ipairs(quickfix_list) do
            if item.filename == file.absolute_path then
                already_exists = true
                break
            end
        end
        if not already_exists then
            table.insert(new_entries, { filename = file.absolute_path })
        end
    end

    if #new_entries > 0 then
        vim.fn.setqflist(new_entries, "a")
        print("Files added to the quickfix list.")
    else
        print("No new files to add.")
    end
end

-- Function to sort quickfix list by file path or other criteria
local function sort_quickfix()
    local quickfix_list = fn.getqflist()

    -- Sort by filename
    table.sort(quickfix_list, function(a, b)
        return a.filename < b.filename
    end)

    -- Replace quickfix list with sorted list
    fn.setqflist(quickfix_list, "r")
    print("Quickfix list sorted.")
end

-- Function to remove a specific buffer from the quickfix list
local function remove_from_quickfix(bufnr)
    local quickfix_list = vim.fn.getqflist()
    local new_list = {}

    -- Build a new quickfix list without the specified buffer
    for _, item in ipairs(quickfix_list) do
        if item.bufnr ~= bufnr then
            table.insert(new_list, item)
        end
    end

    -- Set the new quickfix list
    vim.fn.setqflist(new_list, "r")
    print("Removed buffer from Quickfix List.")
end

-- Function to remove the currently selected entry from the quickfix list
local function remove_selected_quickfix()
    local quickfix_list = fn.getqflist()
    local idx = fn.getqflist({ idx = 0 }).idx

    if idx == 0 then
        print("No entry selected in Quickfix List.")
        return
    end

    table.remove(quickfix_list, idx) -- Remove the selected entry
    fn.setqflist(quickfix_list, "r")
    print("Removed selected entry from Quickfix List.")
end

keymap.set("n", "<leader>ac", add_to_quickfix, { desc = "Add to Quickfix List" })
keymap.set("n", "<leader>cf", add_from_nvim_tree_to_quickfix, { desc = "Add from nvim-tree to Quickfix List" })
keymap.set("n", "<leader>cr", remove_selected_quickfix, { desc = "Remove Selected Quickfix Entry" })
keymap.set("n", "<leader>cs", sort_quickfix, { desc = "Sort Quickfix List" })
