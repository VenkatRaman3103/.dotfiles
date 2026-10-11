require("venkat.core")
require("venkat.lazy")


-- utils
require("venkat.utils.diagnostics").setup()
require("venkat.utils.colorscheme_base").colorMyPencils()
require("venkat.utils.colorscheme_syntax").syntax()

-- local grey = "#888888"
-- local lightGrey = "#666666"
-- local evenLightGrey = "#404040"
-- local white = "#eeeeee"
-- local black = "#191919"
-- local oceanGray = "#70787f"
-- local silver = "#bec2cb"
-- local warnCoral = "#d2a374"
-- local mutedTeal = "#5f9ea0"
-- local softSalmon = "#e67e7e"
-- local sageGreen = "#7ca68c"

-- vim.api.nvim_set_hl(0, "jsFunction", { fg = grey })   -- Macro function calls
-- - jsFunction links to Type

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

-- _G.require = function(module_name)
--     if module_name == "mason-lspconfig.features.automatic_enable" then
--         return {
--             init = function()
--                 vim.notify("Bypassed automatic_enable feature", vim.log.levels.INFO)
--             end
--         }
--     end
--     return original_require(module_name)
-- end

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

local orig_notify = vim.notify

vim.notify = function(msg, level, opts)
    local text = ""

    if type(msg) == "string" then
        text = msg
    elseif type(msg) == "table" then
        text = msg.message or vim.inspect(msg)
    else
        text = tostring(msg)
    end

    -- Suppress ONLY these repeating warnings
    -- 1) lspconfig deprecation spam
    if text:match("require%(['\"]lspconfig['\"]%)") and text:match("deprecated") then
        return
    end

    -- 2) nvim-treesitter 'setup nil value' spam
    if text:match("nvim%-treesitter") and text:match("nil value") then
        return
    end

    -- fallback to original notify
    return orig_notify(msg, level, opts)
end

local orig_notify = vim.notify
vim.notify = function(msg, level, opts)
    local text = type(msg) == "string" and msg or (msg.message or vim.inspect(msg))

    -- Hide Lazy / plugin stacktrace spam
    if text:match("stack traceback") then
        return
    end

    -- Still show other notifications
    return orig_notify(msg, level, opts)
end

-- Also suppress stderr traceback dump (printed in :messages)
local orig_err = vim.api.nvim_err_writeln
vim.api.nvim_err_writeln = function(msg)
    if type(msg) == "string" and msg:match("stack traceback") then
        return
    end

    -- common noisy traces (optional, uncomment if needed)
    -- if msg:match("lazy.nvim") then return end
    -- if msg:match("nvim%-lspconfig") then return end

    return orig_err(msg)
end

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.backupdir = ""
vim.opt.directory = ""
vim.opt.autochdir = false

vim.cmd [[
  cabbrev w w!
  cabbrev wa wa!
  cabbrev wq wq!
  cabbrev waq waq!
]]

-- List the themes you actually have installed
-- local themes = {
--     "mfd-stealth",
--     "koda",
--     "xeno",
--     "solarized-osaka",
--     "vague",
--     "poimandres",
--     "nightfox",
--     "darkvoid",
--     "catppuccin",
--     "oscura",
--     "no-clown-fiesta",
--     "shadow",
--     "rose-pine",
--     "vesper",
--     "candle-grey",
--     "rasmus",
--     "zenbones",
--     "darcula-solid",
--     "neofusion",
--     "substrata",
--     "nord",
--     "gruvbox-material",
--     "kanagawa-dragon",
--     "solarized",
--     "vscode",
--     "github_dark_default",
--     "monochrome",
--     "lackluster",
--     "nordic",
--     "tokyonight",
--     "kanso",
-- }

-- vim.api.nvim_create_user_command("ChangeThemes", function()
--     vim.ui.select(themes, {
--         prompt = "Select Colorscheme:",
--     }, function(choice)
--         if choice then
--             vim.cmd.colorscheme(choice)
--             print("Switched to " .. choice)
--         end
--     end)
-- end, {})

-- Add mason bin to PATH
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"
--
-- -- LSP setup (load after lazy)
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         require("venkat.plugins.lspconfig")
--     end,
-- })
