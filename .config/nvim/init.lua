require("venkat.core")
require("venkat.lazy")

-- utils
require("venkat.utils.diagnostics").setup()
require("venkat.utils.colorscheme").colorMyPencils()
require("venkat.utils.colorscheme").syntax()

vim.lsp.buf_request_timeout = 5000

vim.opt.showtabline = 0

-- local grey = "#a9a9a9";
local grey = "#a9a9a9";
local lightGrey = "#666666";
local white = "#ffffff";

vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#d2a374", bold = true })
-- Prevent graying out
vim.api.nvim_set_hl(0, "FlashBackdrop", { link = "Normal" })

vim.api.nvim_set_hl(0, 'MsgArea', { fg = grey })  -- Command area text
vim.api.nvim_set_hl(0, 'Question', { fg = grey }) -- Prompt/question text
vim.api.nvim_set_hl(0, 'WildMenu', { fg = grey }) -- Command-line completion menu

-- -- Delimiters
-- vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = grey })
-- vim.api.nvim_set_hl(0, "@tag.delimiter.tsx", { fg = grey })

-- Add these lines to make delimiters white
vim.api.nvim_set_hl(0, "Delimiter", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#ffffff" })

-- vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#545c7e", italic = true })

-- -- Attributes like className, id, class
vim.api.nvim_set_hl(0, "@attribute", { fg = grey })
vim.api.nvim_set_hl(0, "@tag.attribute", { fg = grey })

-- require("venkat.utils.colorscheme").syntax()
-- 4f5258
-- require("command-completion").setup()

vim.o.cmdheight = 1
-- vim.opt.updatetime = 300
vim.opt.conceallevel = 1 -- or 2

-- vim.opt.guicursor = ""

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


vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#060606", bg = "NONE" })  -- General floating windows
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#060606", bg = "NONE" }) -- Window separators
vim.api.nvim_set_hl(0, "NormalBorder", { fg = "#060606", bg = "NONE" }) -- Normal floating borders
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#060606", bg = "NONE" })    -- Split lines

-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE", fg = "#a7a7a7" })        -- Popup menu background & text
-- vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "NONE", bg = "#a7a7a7" })  -- 🔹 Border for nvim-cmp popups
-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#505050", fg = "NONE" })     -- Selected item in the popup
-- vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" })                   -- Scrollbar color in completion popup

-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#030303", bg = "#060606" }) -- Adjust grey shade if needed
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#060606", bg = "#060606" }) -- Adjust grey shade if needed
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#505050", bg = "" }) -- Adjust grey shade if needed
vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#555555", bg = "#030303" })
vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#555555", bg = "" })
-- Add these to your colorscheme or init.lua
vim.api.nvim_set_hl(0, "NoiceNotifyNormal", { bg = "#1a1b26" })  -- Change background color
vim.api.nvim_set_hl(0, "NoiceNotifyBorder", { fg = "#7aa2f7" })  -- Change border color

vim.api.nvim_set_hl(0, "NoiceCmdlineNormal", { bg = "#090909" }) -- Command line background
vim.api.nvim_set_hl(0, "NoiceCmdlineBorder", { fg = "#555555" }) -- Command line border
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#060606", bg = "#060606" }) -- Adjust grey shade if needed
