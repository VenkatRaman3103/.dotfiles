require("venkat.core")
require("venkat.lazy")

-- utils
require("venkat.utils.diagnostics").setup()
require("venkat.utils.colorscheme").colorMyPencils()
require("venkat.utils.colorscheme").syntax()
-- 4f5258

vim.opt.conceallevel = 1 -- or 2

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("set winhl=WinSeparator:WinSeparator")
    end,
})

-- Automatically wrap and enforce textwidth at 80 characters for Markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.textwidth = 80
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.formatoptions:append("t") -- Enforce textwidth for new lines
    end,
})

