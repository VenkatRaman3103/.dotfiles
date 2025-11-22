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
-- local grey = "#505050";
-- local lightGrey = "#666666";
-- local white = "#ffffff";
-- local secondaryBgColor = "#090909"

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

vim.api.nvim_create_autocmd("BufWriteCmd", {
    pattern = "kulala://*",
    callback = function()
        -- Just mark it as saved, avoid E212
        vim.bo.modified = false
    end,
})

-- vim.api.nvim_create_autocmd("ModeChanged", {
--     callback = function()
--         local mode_map = {
--             n = "Normal",
--             i = "Insert",
--             v = "Visual",
--             V = "V-Line",
--             [""] = "V-Block",
--             c = "Command",
--             R = "Replace",
--             s = "Select",
--             t = "Terminal",
--         }
--
--         local mode = vim.fn.mode()
--         local mode_name = mode_map[mode] or mode
--         vim.cmd("echo 'MODE: " .. mode_name .. "'")
--     end,
-- })


vim.cmd([[
    highlight LualineModeText guifg=#ffffff guibg=NONE
    highlight LualineModeBar guifg=#569CD6 guibg=NONE
    augroup UpdateLualineModeBar
        autocmd!
        autocmd ModeChanged * lua UpdateLualineModeBar()
    augroup END
]])

function UpdateLualineModeBar()
    local mode = vim.fn.mode()
    local mode_colors = {
        n = "#569CD6",     -- Normal
        i = "#98C379",     -- Insert
        v = "#C678DD",     -- Visual
        V = "#C678DD",     -- Visual Line
        [""] = "#C678DD", -- Visual Block
        c = "#E5C07B",     -- Command
        R = "#E06C75",     -- Replace
        t = "#56B6C2",     -- Terminal
    }

    local color = mode_colors[mode] or "#aaaaaa"
    vim.api.nvim_set_hl(0, "LualineModeBar", { fg = color, bg = "NONE" })
end

-- Call once on startup
UpdateLualineModeBar()

-- // 🔹 Extra data from first two tabs


-- vim.api.nvim_set_hl(0, "GitConflictCurrent", { link = "DiffAdd" })
-- vim.api.nvim_set_hl(0, "GitConflictIncoming", { link = "DiffDelete" })
-- vim.api.nvim_set_hl(0, "GitConflictAncestor", { link = "DiffChange" })
-- vim.api.nvim_set_hl(0, "GitConflictMarker", { link = "Comment" })
