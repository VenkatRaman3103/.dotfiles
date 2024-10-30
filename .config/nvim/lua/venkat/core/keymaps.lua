-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap

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
