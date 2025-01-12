require("venkat.core")
require("venkat.lazy")

-- utils
require("venkat.utils.diagnostics").setup()
require("venkat.utils.colorscheme").colorMyPencils()
-- require("venkat.utils.colorscheme").syntax()
-- 4f5258

-- vim.o.cmdheight = 0

vim.opt.conceallevel = 1 -- or 2

vim.api.nvim_set_hl(0, "@comment", { fg = "#777777", italic = true })
vim.api.nvim_set_hl(0, "@comment.documentation", { fg = "#777777", italic = true })

-- vim.cmd([[packadd pieces.nvim]])

vim.cmd([[autocmd BufWritePre *.scss lua vim.lsp.buf.format({ async = true })]])

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("set winhl=WinSeparator:WinSeparator")
    end,
})

local some

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
