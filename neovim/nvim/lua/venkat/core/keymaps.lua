-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- Function to clean CRLF from pasted text
local function paste_clean()
	-- Save the current register content
	local reg_content = vim.fn.getreg("+")
	-- Remove CRLF characters (^M)
	reg_content = reg_content:gsub("\r\n", "\n")
	-- Update the register
	vim.fn.setreg("+", reg_content)
	-- Perform the paste
	return '"+p'
end

-- Map the paste command with CRLF cleaning
keymap.set("n", "p", paste_clean, { expr = true, desc = "Paste and clean CRLF" })
keymap.set("n", "P", function()
	local cleaned = paste_clean()
	return "P"
end, { expr = true, desc = "Paste before cursor and clean CRLF" })

-- Add these specific clipboard-related mappings
keymap.set("n", "<leader>p", function()
	local cleaned = paste_clean()
	return cleaned
end, { expr = true, desc = "Paste from system clipboard (cleaned)" })

-- For visual mode pasting
keymap.set("v", "p", paste_clean, { expr = true, desc = "Paste and clean CRLF" })

-- First, properly map Alt+n for insert mode escape
-- The <A-n> notation should work, but if it doesn't, we can use the ASCII code
keymap.set("i", "<A-n>", "<Esc>", { noremap = true, silent = true, desc = "Alt + n to escape insert mode" })
-- Disable the Alt+n combination in normal mode to prevent interference with search
keymap.set("n", "<A-n>", "<Nop>", { noremap = true, silent = true })
-- disable it in visual mode
keymap.set("v", "<A-n>", "<Nop>", { noremap = true, silent = true })
-- Alternative notation if <A-n> doesn't work
-- keymap.set("i", "\233", "<Esc>", { noremap = true, silent = true, desc = "Alt + n to escape insert mode" })

-- Map Ctrl + V to paste from clipboard in Insert mode
keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- Increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- Decrement

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- Make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- Close current split window

-- Tabs management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- Open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- Close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- Go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- Go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- Move current buffer to new tab

-- Scrolling to stay in place
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Searching in place
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Pasting from the system clipboard
-- keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })

keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_')

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
