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
keymap.set("n", "p", paste_clean, { expr = true, desc = "Paste from clipboard (cleaned)" })
keymap.set("v", "p", '"_dP', { desc = "Paste without yanking replaced text" })
-- keymap.set("v", "p", '"+p', { expr = true, desc = "normal paste" })

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
keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Got to next buffer" })
keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "Got to previous buffer" })
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
vim.keymap.set("n", "<leader>bd", function()
    local current_buf = vim.fn.bufnr("%") -- Get the current buffer number
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

-- keymap.set("n", "<leader>a", function()
--     vim.fn.setqflist({ { bufnr = vim.fn.bufnr() } }, "a")
-- end)

keymap.set("n", "]q", ":cnext<CR>")
keymap.set("n", "[q", ":cprev<CR>")

keymap.set("n", "]]", function()
    vim.lsp.buf.references()
end, { desc = "Next reference" })

keymap.set("n", "[[", function()
    vim.lsp.buf.references()
end, { desc = "Previous reference" })

keymap.set("n", "gh", "^", { desc = "use H as ^" })
keymap.set("n", "gH", "^", { desc = "use H as 0" })
keymap.set("n", "gl", "$", { desc = "use L as $" })
keymap.set("n", "gm", "%", { desc = "use M as %" })

keymap.set("v", "gh", "^", { desc = "use H as ^" })
keymap.set("v", "gH", "^", { desc = "use H as 0" })
keymap.set("v", "gl", "$", { desc = "use L as $" })
keymap.set("v", "gm", "%", { desc = "use M as %" })

keymap.set("v", ">", ">gv", { desc = "" })
keymap.set("v", "<", "<gv", { desc = "" })

-- keymap.set("n", "g-", "`^", { desc = "Last position in insert mode" })
keymap.set("n", "g,", "`.", { desc = "Last change in current buffer" })
keymap.set("n", 'g"', '`"', { desc = "Last exited current buffer" })
keymap.set("n", "g.", "<cmd>edit #<CR>`.", { desc = "Jump to last edited file and position" })
-- keymap.set("n", "g;", "''", { desc = "Back to line where jumped from" })
keymap.set("n", "g;", "``", { desc = "Back to position where jumped from" })
keymap.set("n", "g[", "`[", { desc = "To beginning of changed/yanked text" })
keymap.set("n", "g]", "`]", { desc = "To end of changed/yanked text" })
keymap.set("n", "g<", "`<", { desc = "To beginning of last visual selection" })
keymap.set("n", "g>", "`>", { desc = "To end of last visual selection" })

keymap.set("n", "g/", ":%s/", { desc = "Start substitute command" })
keymap.set("n", "g?", ":%s/<C-r><C-w>", { desc = "Substitute word under cursor" })

-- Resize window
keymap.set("n", "<A-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<A-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<A-Left>", ":vertical resize +2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<A-Right>", ":vertical resize -2<CR>", { desc = "Increase window width" })

-- some
