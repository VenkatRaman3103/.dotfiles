-- vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
local api = vim.api

opt.relativenumber = true
opt.number = true

opt.showmode = false

-- -- tabs & indentation
opt.tabstop = 4       -- 2 spaces for tabs (prettier default)
opt.softtabstop = 4
opt.shiftwidth = 4    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

--line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- backup using undotree
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- searching
opt.incsearch = true -- This you already have
opt.hlsearch = true  -- This will highlight search results

opt.scrolloff = 15

opt.updatetime = 50

opt.spelllang = 'en_us'
opt.spell = true

opt.ff = "unix"
-- color column
-- opt.colorcolumn = "80"

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.rest",
    command = "setfiletype rest",
})

api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight the yanked region",
    callback = function()
        vim.highlight.on_yank()
    end,
})


api.nvim_create_user_command("ClearMarks", function()
    vim.cmd("delmarks a-zA-Z0-9")
end, {})

api.nvim_create_user_command("GetFullPath", function()
    local path = vim.fn.expand("%:p") -- Get the full file path
    vim.fn.setreg("+", path)          -- Set it to the system clipboard register
    print(path)                       -- Optional confirmation message
end, {})

api.nvim_create_user_command("GetDirectoryPath", function()
    local path = vim.fn.expand("%:p:h")
    vim.fn.setreg("+", path)
    print(path)
end, {})

api.nvim_create_user_command("GetFilePath", function()
    local path = vim.fn.expand("%")
    vim.fn.setreg("+", path)
    print(path)
end, {})

api.nvim_create_autocmd("BufWritePost", {
    desc = "Clear command line message after saving file",
    callback = function()
        vim.defer_fn(function()
            vim.cmd("echo ''")
        end, 2000)
    end,
})

api.nvim_create_user_command("ReloadConfig", function()
    vim.cmd("source ~/Code/.dotfiles/.config/nvim/init.lua")
end, {})

opt.report = 9999

-- netrw
-- vim.g.netrw_banner = 0       -- Hide the banner
-- vim.g.netrw_liststyle = 3    -- Tree view
-- vim.g.netrw_browse_split = 4 -- Open files in previous window
-- vim.g.netrw_altv = 1         -- Open splits to the right
-- vim.g.netrw_winsize = 25     -- Set width to 25% of screen

-- api.nvim_create_autocmd("InsertEnter", {
--     desc = "Center screen when entering insert mode",
--     callback = function()
--         vim.cmd("normal! zz")
--     end,
-- })
-- api.nvim_create_autocmd("InsertLeave", {
--     desc = "Restore normal scrolloff when leaving insert mode",
--     callback = function()
--         vim.opt_local.scrolloff = 15
--     end,
-- })

-- api.nvim_create_autocmd("CursorMoved", {
--     desc = "Center screen after vertical cursor movement",
--     callback = function()
--         local current_line = vim.fn.line(".")
--         local last_line = tonumber(vim.b.last_cursor_line) or current_line
--
--         if current_line ~= last_line then
--             vim.cmd("normal! zz")
--             vim.b.last_cursor_line = current_line
--         end
--     end,
-- })

-- vim.keymap.set('n', 'k', 'kzz', { noremap = true })
-- vim.keymap.set('n', 'j', 'jzz', { noremap = true })
