-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap
local fn = vim.fn

local function paste_clean()
    local reg_content = vim.fn.getreg("+")
    reg_content = reg_content:gsub("\r\n", "\n"):gsub("\r", "\n")
    vim.fn.setreg("+", reg_content)
    return '"+p'
end

-- Map copying to system clipboard
keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to clipboard" })

-- Map clean paste from system clipboard in all modes
keymap.set("n", "<leader>p", paste_clean, { expr = true, desc = "Paste from clipboard (cleaned)" })
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
keymap.set("n", "<leader>-", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>eq", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>xx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tabs management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Buffers management
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Got to next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Got to previous buffer" })
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

-- Pasting from the system clipboard
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader><CR>", ":source ~/.config/nvim/init.lua<CR>")

-- closing all buffers
keymap.set("n", "<leader>bd", ":%bd<CR>")

-- quick fix likst
keymap.set("n", "<leader>qo", ":copen<CR>")
keymap.set("n", "<leader>qc", ":cclose<CR>")
-- keymap.set("n", "<leader>a", function()
--     vim.fn.setqflist({ { bufnr = vim.fn.bufnr() } }, "a")
-- end)
keymap.set("n", "<leader>qn", ":cnext<CR>")
keymap.set("n", "<leader>qp", ":cprev<CR>")
