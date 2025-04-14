require("venkat.core")
require("venkat.lazy")

-- utils
require("venkat.utils.diagnostics").setup()
require("venkat.utils.colorscheme").colorMyPencils()
require("venkat.utils.colorscheme").syntax()

vim.g.loaded_nvim_tree = 1
vim.g.loaded_nvimtree = 1

vim.lsp.buf_request_timeout = 5000

vim.opt.showtabline = 0

-- local grey = "#a9a9a9";
local grey = "#a9a9a9";
local lightGrey = "#666666";
local white = "#ffffff";
local secondaryBgColor = "#090909"

vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#d2a374", bold = true })
vim.api.nvim_set_hl(0, "FlashBackdrop", { link = "Normal" })

vim.api.nvim_set_hl(0, 'MsgArea', { fg = grey })  -- Command area text
vim.api.nvim_set_hl(0, 'Question', { fg = grey }) -- Prompt/question text
vim.api.nvim_set_hl(0, 'WildMenu', { fg = grey }) -- Command-line completion menu
vim.api.nvim_set_hl(0, "Delimiter", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#ffffff" })

vim.api.nvim_set_hl(0, "@attribute", { fg = grey })
vim.api.nvim_set_hl(0, "@tag.attribute", { fg = grey })

vim.o.cmdheight = 0
-- vim.opt.updatetime = 300
vim.opt.conceallevel = 1 -- or 2

vim.cmd([[autocmd BufWritePre *.scss lua vim.lsp.buf.format({ async = true })]])

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("set winhl=WinSeparator:WinSeparator")
    end,
})

-- Automatically wrap and enforce textwidth at 80 characters for Markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.textwidth = 100
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.formatoptions:append("t") -- Enforce textwidth for new lines
    end,
})
