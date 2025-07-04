-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap
local fn = vim.fn

-- Enhanced clean function to handle newlines in clipboard content
local function clean_clipboard()
    local reg_content = vim.fn.getreg("+")
    if reg_content then
        -- Replace Windows line endings (CRLF) with Unix line endings (LF)
        reg_content = reg_content:gsub("\r\n", "\n"):gsub("\r", "\n")
        -- Optionally trim trailing newlines when in insert mode or when cursor is between quotes
        local mode = vim.api.nvim_get_mode().mode
        if mode == 'i' then
            -- In insert mode, trim trailing newlines
            reg_content = reg_content:gsub("\n+$", "")
        end
        vim.fn.setreg("+", reg_content)
    end
end

-- Setup auto-command to clean clipboard content when entering Vim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    pattern = "*",
    callback = clean_clipboard
})

-- Setup auto-command to clean clipboard before pasting
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = clean_clipboard
})

-- Use the system clipboard for all operations
vim.opt.clipboard = "unnamedplus"

-- Make sure deleting text in visual mode doesn't overwrite the paste register
vim.keymap.set("v", "p", '"_dP', { noremap = true, desc = "Paste without yanking selected text" })

-- Always use the system clipboard for yanking
vim.keymap.set("n", "y", '"+y', { noremap = true, desc = "Yank to system clipboard" })
vim.keymap.set("v", "y", '"+y', { noremap = true, desc = "Yank selection to system clipboard" })
vim.keymap.set("n", "Y", '"+Y', { noremap = true, desc = "Yank line to system clipboard" })

-- Delete without yanking
vim.keymap.set("n", "d", '"+d', { noremap = true, desc = "Delete without yanking" })
vim.keymap.set("v", "d", '"+d', { noremap = true, desc = "Delete selection without yanking" })
vim.keymap.set("n", "D", '"+D', { noremap = true, desc = "Delete to end of line without yanking" })

-- Cut to system clipboard (when you actually want to cut)
vim.keymap.set("n", "x", '"+x', { noremap = true, desc = "Cut to system clipboard" })
vim.keymap.set("v", "x", '"+x', { noremap = true, desc = "Cut selection to system clipboard" })
vim.keymap.set("n", "X", '"+X', { noremap = true, desc = "Cut char before cursor to system clipboard" })

-- MODIFIED: Create separate Neovim clipboard history with leader commands

-- Map copying to Neovim's internal registers (not system clipboard)
keymap.set("n", "<leader>y", '"ay', { desc = "Yank to Neovim's register a" })
keymap.set("v", "<leader>y", '"ay', { desc = "Yank selection to Neovim's register a" })
keymap.set("n", "<leader>Y", '"aY', { desc = "Yank line to Neovim's register a" })

-- Delete/cut to Neovim's internal registers
keymap.set("n", "<leader>d", '"ad', { desc = "Delete to Neovim's register a" })
keymap.set("v", "<leader>d", '"ad', { desc = "Delete selection to Neovim's register a" })
keymap.set("n", "<leader>D", '"aD', { desc = "Delete to end of line to Neovim's register a" })

-- Paste from Neovim's internal register
keymap.set("n", "<leader>p", '"ap', { desc = "Paste from Neovim's register a" })
keymap.set("v", "<leader>p", '"ap', { desc = "Paste from Neovim's register a" })
keymap.set("n", "<leader>P", '"aP', { desc = "Paste before cursor from Neovim's register a" })

-- Optional: Enhanced smart paste from system clipboard
keymap.set("n", "p", function()
    clean_clipboard()
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    local before = line:sub(col, col)
    local after = line:sub(col + 1, col + 1)

    -- If we're between quotes, trim trailing newlines
    if (before == '"' and after == '"') or (before == "'" and after == "'") then
        local reg_content = vim.fn.getreg("+")
        reg_content = reg_content:gsub("\n+$", "")
        vim.fn.setreg("+", reg_content)
    end

    return 'p'
end, { expr = true, desc = "Smart paste that handles newlines" })

-- Rest of your configuration remains unchanged
keymap.set(
    "t",
    "<Esc",
    "<C-\\><C-n>:set modifiable<CR>",
    { noremap = true, silent = true, desc = "Alt + n to enter normal mode and make modifiable" }
)

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap.set("n", "<leader>|", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>_", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>eq", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>xx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>tw", ":set wrap!<CR>", { noremap = true, silent = true })

-- Tabs management
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "]t", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "[t", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tm", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Buffers management
keymap.set("n", "<S-h>", "<cmd>bnext<CR>", { desc = "Got to next buffer" })
keymap.set("n", "<S-l>", "<cmd>bprev<CR>", { desc = "Got to previous buffer" })

-- Function to navigate to a specific buffer
local function goto_buffer(n)
    local buffers = vim.fn.getbufinfo({ buflisted = true })
    if n > 0 and n <= #buffers then
        vim.cmd("buffer " .. buffers[n].bufnr)
    else
        print("Buffer " .. n .. " does not exist")
    end
end

-- Assign keymaps for buffers 1 to 9
for i = 1, 9 do
    vim.keymap.set("n", "<leader>b" .. i, function()
        goto_buffer(i)
    end, { desc = "Go to buffer " .. i })
end

-- Scrolling to stay in place
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "G", "Gzz")

-- Searching in place
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
-- keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader><CR>", ":source ~/.config/nvim/init.lua<CR>")

-- closing all buffers
vim.keymap.set("n", "<leader>bd", function()
    local current_buf = vim.fn.bufnr("%")    -- Get the current buffer number
    local buffers = vim.api.nvim_list_bufs() -- List all buffers

    for _, buf in ipairs(buffers) do
        if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
            vim.cmd("bdelete " .. buf)
        end
    end
end, { desc = "Delete all buffers except the current one" })

-- quick fix likst
keymap.set("n", "<leader>qo", ":copen<CR>")
keymap.set("n", "<leader>qc", ":cclose<CR>")

keymap.set("n", "]q", ":cnext<CR>")
keymap.set("n", "[q", ":cprev<CR>")

keymap.set("n", "gh", "^", { desc = "use H as ^" })

keymap.set("n", "gH", "^", { desc = "use H as 0" })
keymap.set("n", "gl", "g_", { desc = "use L as last non-blank character" })
keymap.set("n", "gm", "%", { desc = "use M as %" })

keymap.set("v", "gh", "^", { desc = "use H as ^" })

keymap.set("v", "gH", "^", { desc = "use H as 0" })
keymap.set("v", "gl", "g_", { desc = "use L as last non-blank character" })
keymap.set("v", "gm", "%", { desc = "use M as %" })

keymap.set("n", "gn", "g,", { desc = "Next position in change list" })

keymap.set("n", "gp", "g;", { desc = "Previous position in change list" })

keymap.set("v", ">", ">gv", { desc = "" })
keymap.set("v", "<", "<gv", { desc = "" })

keymap.set("n", "g'", "`.", { desc = "Last change in current buffer" })

keymap.set("n", 'g"', "<cmd>edit #<CR>`.", { desc = "Jump to last edited file and position" })
keymap.set("n", "g;", "``", { desc = "Back to position where jumped from" })
keymap.set("n", "gy[", "`[", { desc = "To beginning of changed/yanked text" })
keymap.set("n", "gy]", "`]", { desc = "To end of changed/yanked text" })
keymap.set("n", "gv[", "`<", { desc = "To beginning of last visual selection" })
keymap.set("n", "gv]", "`>", { desc = "To end of last visual selection" })

keymap.set("n", "g/", ":%s/", { desc = "Start substitute command" })
keymap.set("n", "g?", ":%s/<C-r><C-w>/", { desc = "Substitute word under cursor" })

keymap.set("v", "g/", ":s/", { desc = "Start substitute command" })
keymap.set("v", "g?", ":s/<C-r><C-w>", { desc = "Substitute word under cursor" })

-- Resize window
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Increase window width" })


keymap.set("n", "<leader>dbo", ":DBUI<CR>")


-- Keep cursor in the middle of the screen when jumping
-- Add this to your existing configuration
vim.keymap.set("n", "gd", "gdzz", { noremap = true })
vim.keymap.set("n", "gr", "grzz", { noremap = true })

-- Add for other similar jump commands you might use
vim.keymap.set("n", "gD", "gDzz", { noremap = true })
vim.keymap.set("n", "gi", "gizz", { noremap = true })
vim.keymap.set("n", "gt", "gtzz", { noremap = true })


-- Improved Netrw toggle function
vim.g.netrw_banner = 0       -- Hide the banner
vim.g.netrw_liststyle = 3    -- Tree view
vim.g.netrw_browse_split = 4 -- Open files in previous window
vim.g.netrw_altv = 1         -- Open splits to the right
vim.g.netrw_winsize = 25     -- Set width to 25% of screen

-- Global variable to track if Netrw is open
-- vim.g.NetrwIsOpen = 0
--
-- -- Set Netrw preferences
-- vim.g.netrw_browse_split = 0 -- Open files in the same window
-- vim.g.netrw_liststyle = 3    -- Tree style listing
-- vim.g.netrw_winsize = 25     -- Set explorer width to 25% of screen
--
-- vim.api.nvim_create_user_command("ToggleNetrw", function()
--     if vim.g.NetrwIsOpen == 1 then
--         -- Find the Netrw window and close it
--         local i = 1
--         while i <= vim.fn.winnr("$") do
--             if vim.fn.getbufvar(vim.fn.winbufnr(i), "&filetype") == "netrw" then
--                 vim.cmd(i .. "close")
--                 vim.g.NetrwIsOpen = 0
--                 break
--             end
--             i = i + 1
--         end
--     else
--         vim.cmd("Lexplore")
--         vim.g.NetrwIsOpen = 1
--     end
-- end, {})
--
-- vim.keymap.set("n", "<leader>eo", ":ToggleNetrw<CR>", {
--     desc = "Toggle Netrw file explorer",
--     silent = true,
-- })
