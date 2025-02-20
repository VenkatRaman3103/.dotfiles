require("venkat.core")
require("venkat.lazy")

-- hello world
-- hello big bird

-- utils
require("venkat.utils.diagnostics").setup()
require("venkat.utils.colorscheme").colorMyPencils()

local blue = "#3aa8e3"
-- local orange = "#fb8a20"
local orange = "#de8430"
local brightGree = "#5ad39d"
local green = "#70b276"
local purple = "#7b95ce"
local white = "#FFFFFF"
local lightBlue = "#8db4d4"
local gray = "#5f5f5f"
local yellow = "#e5c07b"
local red = "#e06c75"
local cyan = "#56b6c2"
local redistOrange = "#c95b20" --#e25303

-- -- Delimiters
vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = gray })
vim.api.nvim_set_hl(0, "@tag.delimiter.tsx", { fg = gray })
--
-- -- Attributes like className, id, class
-- vim.api.nvim_set_hl(0, "@attribute", { fg = lightBlue })
-- vim.api.nvim_set_hl(0, "@tag.attribute", { fg = lightBlue })

-- require("venkat.utils.colorscheme").syntax()
-- 4f5258
-- require("command-completion").setup()

-- vim.o.cmdheight = 0
-- vim.opt.updatetime = 300
vim.opt.conceallevel = 1 -- or 2

vim.opt.guicursor = ""

-- vim.api.nvim_set_hl(0, "@comment", { fg = "#777777", italic = true })
-- vim.api.nvim_set_hl(0, "@comment.documentation", { fg = "#777777", italic = true })

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
