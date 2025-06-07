require("venkat.core")
require("venkat.lazy")

-- utils
require("venkat.utils.diagnostics").setup()
require("venkat.utils.colorscheme_base").colorMyPencils()
require("venkat.utils.colorscheme_syntax").syntax()

vim.g.loaded_nvim_tree = 1
vim.g.loaded_nvimtree = 1

vim.lsp.buf_request_timeout = 5000

vim.opt.showtabline = 0

-- local grey = "#a9a9a9";
-- local grey = "#a9a9a9";
-- local grey = "#333333";
local grey = "#505050";
local lightGrey = "#666666";
local white = "#ffffff";
local secondaryBgColor = "#090909"

-- vim.o.cmdheight = 0
vim.o.cmdheight = 1
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
local original_require = require

_G.require = function(module_name)
    if module_name == "mason-lspconfig.features.automatic_enable" then
        return {
            init = function()
                vim.notify("Bypassed automatic_enable feature", vim.log.levels.INFO)
            end
        }
    end
    return original_require(module_name)
end
