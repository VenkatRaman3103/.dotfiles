local M = {}

-- local bgColor = "#0e0e0e"
local bgColor = ""
local secondaryBgColor = "#090909"
local borderColor = "#090909"
-- local secondaryBgColor = "#090909"
-- local secondaryBgColor = "#111111"
-- local secondaryBgColor = "#101010"
-- local secondaryBgColor = "#090909"
-- local secondaryBgColor = "#040404"
-- local secondaryBgColor = "#030303"
-- local secondaryBgColor = "#060606"

-- local secondaryBgColor = "#080808"
local whiteLike = "#d0d0d0"

local selectionBgColor = "#ffb86c"

-- Borders

-- ====================================================================
-- COLORSCHEME
-- ====================================================================
function M.colorMyPencils()
    -- Set a dark background
    vim.opt.background = "dark"

    -- Set background to none for specific highlight groups
    local hl_groups = {
        -- "Normal",
        "NormalFloat",
        "SignColumn",
        "StatusLine",
        "StatusLineNC",
        "LineNr",
        "FzfLuaNormal",
        "HarpoonNormal",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineTab",
        "BufferLineTabSelected",
        "BufferLineTabClose",
        "TabLine",
        "TabLineFill",
        "TabLineSel",
        -- "Pmenu",
        -- "PmenuSbar",
        -- "PmenuThumb",
        -- "PmenuSel",
        "VertSplit",
        "VisualNOS",
        -- "DiffAdd",
        -- "DiffChange",
        -- "DiffDelete",
        -- "DiffText",
        "HarpoonWindow",
        "HarpoonWindowTitle",
        "HarpoonBorder",

    }

    --171717
    -- Set background to none for specific groups
    for _, group in ipairs(hl_groups) do
        vim.api.nvim_set_hl(0, group, { bg = secondaryBgColor })
    end

    vim.api.nvim_set_hl(0, "Normal", { bg = bgColor })

    vim.api.nvim_set_hl(0, "CmpNormal", { bg = secondaryBgColor })    -- Dark background (adjust the color to your preference)
    vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = secondaryBgColor }) -- Same color for documentation

    -- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#242424" })
    -- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#333333" })
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#222222" })

    -- Zen-mode highlights
    vim.api.nvim_set_hl(0, "ZenBg", { bg = bgColor })

    vim.api.nvim_set_hl(0, "Delimiter", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = white })

    -- Borders and caret highlights
    -- vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#555555", bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = borderColor, bg = secondaryBgColor })
    -- vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = secondaryBgColor, bg = secondaryBgColor })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#555555", bg = bgColor })

    vim.api.nvim_set_hl(0, "FloatBorder", { fg = borderColor, bg = secondaryBgColor }) -- General floating windows
    vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = secondaryBgColor, fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = borderColor, bg = secondaryBgColor })
    vim.api.nvim_set_hl(0, "NormalBorder", { fg = borderColor, bg = "NONE" }) -- Normal floating borders
    vim.api.nvim_set_hl(0, "VertSplit", { fg = borderColor, bg = "NONE" })    -- Split lines

    -- set title colors
    vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = bgColor, bold = false })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#ffffff", bold = false })
    -- vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#ffffff", bold = false })

    -- Visual selection highlight
    -- vim.api.nvim_set_hl(0, "Visual", { bg = "#ffb86c", fg = "#000000" })
    -- vim.api.nvim_set_hl(0, "Visual", { bg = "#45475a", bold = false })

    -- vim.api.nvim_set_hl(0, "OutlineCurrent", { fg = "#aff1bc", bg = "#2c2e33", bold = true })
    vim.api.nvim_set_hl(0, "OutlineCurrent", { fg = "#aff1bc", bg = "", bold = true })
    vim.api.nvim_set_hl(0, "OutlineDetails", { fg = "#333333" })
    vim.api.nvim_set_hl(0, "OutlineFoldMarker", { fg = "#333333" })
    vim.api.nvim_set_hl(0, "OutlineGuides", { fg = "#333333" })
    vim.api.nvim_set_hl(0, "OutlineHelpTip", { fg = "#333333", italic = true })
    vim.api.nvim_set_hl(0, "OutlineJumpHighlight", { fg = "#aff1bc", bold = true })
    vim.api.nvim_set_hl(0, "OutlineKeymapHelpDisabled", { fg = "#666666" })
    vim.api.nvim_set_hl(0, "OutlineKeymapHelpKey", { fg = "#00afff", bold = true })
    vim.api.nvim_set_hl(0, "OutlineLineno", { fg = "#8888ff" })
    vim.api.nvim_set_hl(0, "OutlineStatusError", { fg = "#ff0000", bold = true })
    vim.api.nvim_set_hl(0, "OutlineStatusFt", { fg = "#00ff87" })
    vim.api.nvim_set_hl(0, "OutlineStatusProvider", { fg = "#ffff5f" })

    -- Cursorline customization
    vim.api.nvim_set_hl(0, "CursorLine", { bg = bgColor })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#666666", bg = "" })

    -- Inactive lines with grayed-out numbers
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#222222", bg = bgColor })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = bgColor, fg = "none" })

    -- Custom settings for completion menu
    vim.api.nvim_set_hl(0, "Pmenu", { bg = bgColor, fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = bgColor })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "", fg = "none" })

    -- Telescope specific highlights
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = secondaryBgColor })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = secondaryBgColor })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = secondaryBgColor })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = secondaryBgColor })

    -- Disable underlines
    vim.api.nvim_set_hl(0, "Underlined", { underline = false })
    vim.api.nvim_set_hl(0, "SpellBad", { underline = false })
    vim.api.nvim_set_hl(0, "SpellCap", { underline = false })
    vim.api.nvim_set_hl(0, "SpellRare", { underline = false })
    vim.api.nvim_set_hl(0, "SpellLocal", { underline = false })

    vim.opt.fillchars = {
        horiz = "─", -- Horizontal separator (thin)
        vert = "│", -- Vertical separator (thin)
        vertleft = "┤", -- T-piece pointing left (thin)
        vertright = "├", -- T-piece pointing right (thin)
        verthoriz = "┼", -- Cross piece (thin)
    }

    -- vim.opt.fillchars = {
    --     horiz = " ",     -- Horizontal separator (thin)
    --     vert = " ",      -- Vertical separator (thin)
    --     vertleft = " ",  -- T-piece pointing left (thin)
    --     vertright = " ", -- T-piece pointing right (thin)
    --     verthoriz = " ", -- Cross piece (thin)
    -- }

    -- Make window separators more visible with a brighter color
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#222222", bg = bgColor })

    -- Add top and bottom border highlights for buffers
    vim.api.nvim_set_hl(0, "BufferLineTop", { fg = "#222222", bg = bgColor })
    vim.api.nvim_set_hl(0, "BufferLineBottom", { fg = "#222222", bg = bgColor })

    -- Enable window borders
    vim.opt.laststatus = 3 -- Global status line
    vim.opt.winbar = ""    -- Empty winbar to create space for top border

    -- Make sure window separators are always visible
    vim.opt.fillchars:append("eob: ") -- Hide empty line tildes
    vim.opt.lazyredraw = false        -- Ensure separators are always drawn
    vim.opt.splitkeep = "screen"      -- Maintain window separators during splits

    -- ====================================================================
    -- FIX BRIGHT BLUE UI ELEMENTS
    -- ====================================================================
    -- Neutral gray palette for UI elements
    local uiNeutral = "#aaaaaa" -- Standard gray for most UI elements
    local uiBright = "#cccccc"  -- Brighter gray for important UI elements
    local uiSubdued = "#777777" -- Subdued gray for less important elements

    -- Fix headings, titles and general UI elements that might be blue
    vim.api.nvim_set_hl(0, "Title", { fg = uiBright, bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "Directory", { fg = uiNeutral, bg = "NONE" })
    vim.api.nvim_set_hl(0, "Question", { fg = uiNeutral, bg = "NONE" })
    vim.api.nvim_set_hl(0, "MoreMsg", { fg = uiNeutral, bg = "NONE" })
    vim.api.nvim_set_hl(0, "ModeMsg", { fg = uiNeutral, bg = "NONE" })



    -- QuickFix window styling
    vim.api.nvim_set_hl(0, "qfFileName", { fg = uiBright, bg = "NONE" })
    vim.api.nvim_set_hl(0, "qfLineNr", { fg = uiSubdued, bg = "NONE" })
    vim.api.nvim_set_hl(0, "QuickFixLine", { fg = "#ffffff", bg = "#282828" })

    -- Search and incremental search
    vim.api.nvim_set_hl(0, "Search", { fg = "#000000", bg = "#d2a374" })
    vim.api.nvim_set_hl(0, "IncSearch", { fg = "#000000", bg = "#7ca68c" })

    -- Special keys and matched parentheses
    vim.api.nvim_set_hl(0, "SpecialKey", { fg = uiSubdued, bg = "NONE" })
    vim.api.nvim_set_hl(0, "MatchParen", { fg = "#ffffff", bg = "#444444", bold = true })

    -- Fold styling
    vim.api.nvim_set_hl(0, "Folded", { fg = uiSubdued, bg = "#1a1a1a" })
    -- vim.api.nvim_set_hl(0, "Folded", { fg = uiSubdued, bg = "NONE" })
    vim.api.nvim_set_hl(0, "FoldColumn", { fg = uiSubdued, bg = "NONE" })

    -- Error messages
    vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "#e67e7e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#d2a374", bg = "NONE" })

    -- Status line components
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#444444", bg = "NONE" })
    vim.api.nvim_set_hl(0, "StatusLine", { fg = "#777777", bg = "NONE" })

    -- Wild menu (command completion)
    vim.api.nvim_set_hl(0, "WildMenu", { fg = "#ffffff", bg = "#333333" })

    -- Tab styling
    vim.api.nvim_set_hl(0, "TabLine", { fg = "#555555", bg = "NONE" })
    vim.api.nvim_set_hl(0, "TabLineFill", { fg = "#555555", bg = "NONE" })
    vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#aaaaaa", bg = "#222222" })

    -- Links (such as HTML, help files)
    vim.api.nvim_set_hl(0, "Url", { fg = "#7ca68c", bg = "NONE", underline = true })
    vim.api.nvim_set_hl(0, "htmlLink", { fg = "#7ca68c", bg = "NONE", underline = true })

    -- -- ====================================================================
    -- -- NEOGIT CUSTOMIZATIONS
    -- -- ====================================================================
    -- -- Color definitions for consistency
    local addColor = "#7ca68c"     -- Sage green for additions
    local deleteColor = "#e67e7e"  -- Soft salmon for deletions
    local changeColor = "#d2a374"  -- Warm coral for changes
    local contextColor = "#aaaaaa" -- Gray for context

    -- Base Neogit diff highlights (overview)
    vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "NONE", fg = addColor })
    vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "NONE", fg = deleteColor })
    vim.api.nvim_set_hl(0, "NeogitDiffContext", { bg = "NONE", fg = contextColor })


    -- Inside hunks - consistent with overview
    vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { bg = "NONE", fg = addColor })
    vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = "NONE", fg = deleteColor })
    vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { bg = "NONE", fg = contextColor })

    -- Override core diff highlights to ensure consistency
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "NONE", fg = addColor })
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = "NONE", fg = deleteColor })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "NONE", fg = changeColor })
    vim.api.nvim_set_hl(0, "DiffText", { bg = "NONE", fg = changeColor, italic = true })

    -- Generic diff view syntax highlights
    vim.api.nvim_set_hl(0, "diffAdded", { fg = addColor, bg = "NONE" })
    vim.api.nvim_set_hl(0, "diffRemoved", { fg = deleteColor, bg = "NONE" })
    vim.api.nvim_set_hl(0, "diffChanged", { fg = changeColor, bg = "NONE" })

    -- Additional Neogit highlight groups that might be used in hunks
    vim.api.nvim_set_hl(0, "NeogitDiffAddRegion", { bg = "NONE", fg = addColor })
    vim.api.nvim_set_hl(0, "NeogitDiffDeleteRegion", { bg = "NONE", fg = deleteColor })
    vim.api.nvim_set_hl(0, "NeogitDiffContextRegion", { bg = "NONE", fg = contextColor })

    -- Use foreground colors only for hunk headers
    vim.api.nvim_set_hl(0, "NeogitHunkHeader", {
        bg = "#181818",
        fg = "#888888",
        bold = true
    })
    vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", {
        bg = "#181818",
        fg = "#aaaaaa",
        bold = true
    })

    -- File names with foreground styling only
    vim.api.nvim_set_hl(0, "NeogitFileName", {
        bg = "#181818",
        fg = "#aaaaaa",
        bold = true
    })

    vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", { fg = changeColor, bold = true, bg = "#ffffff" })

    -- vim.api.nvim_set_hl(0, "NeogitHunkHeader", { fg = changeColor, bold = true, bg = "#ffffff" })

    -- Consistent status highlights using grayscale
    vim.api.nvim_set_hl(0, "NeogitBranch", { fg = "#ffffff", bold = true, bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeogitRemote", { fg = "#ffffff", bold = true, bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "NeogitUntrackedfiles", { fg = "#7a7a7a", bold = true, bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "NeogitStagedChanges", { fg = addColor, bold = true, bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "NeogitUnstagedChanges", { fg = "#5f9ea0", bold = true, bg = "NONE" })

    -- vim.api

    -- vim.api.nvim_set_hl(0, "NeogitRecentCommits", { fg = changeColor, bold = true, bg = "NONE" })

    vim.api.nvim_set_hl(0, "NeogitRecentcommits", { bg = changeColor, bold = true, fg = "#000000" })
    vim.api.nvim_set_hl(0, "NeogitUntrackedfiles", { bg = "#7a7a7a", bold = true, fg = "#000000" })
    vim.api.nvim_set_hl(0, "NeogitStagedChanges", { bg = addColor, bold = true, fg = "#000000" })
    vim.api.nvim_set_hl(0, "NeogitUnstagedChanges", { bg = "#1e1e1e", bold = true, fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "NeogitUnmergedchanges", { bg = "#5f9ea0", bold = true, fg = "#000000" })


    vim.api.nvim_set_hl(0, "NeogitSectionTitle", { fg = "#ffffff", bold = true, bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeogitChangeModified", { bg = "NONE", bold = true, fg = "#7ca68c" })

    -- Notifications with subtle colors
    vim.api.nvim_set_hl(0, "NeogitNotificationInfo", { bg = "NONE", fg = "#5f9ea0" })
    vim.api.nvim_set_hl(0, "NeogitNotificationWarning", { bg = "NONE", fg = changeColor })
    vim.api.nvim_set_hl(0, "NeogitNotificationError", { fg = deleteColor, bold = true, bg = "NONE" })

    -- Change highlighting for change/delete/add words
    vim.api.nvim_set_hl(0, "NeogitChangeDeleted", { bg = "NONE", fg = deleteColor })
    vim.api.nvim_set_hl(0, "NeogitChangeBroken", { bg = "NONE", fg = changeColor })
    vim.api.nvim_set_hl(0, "NeogitChangeAdded", { bg = "NONE", fg = addColor })


    -- ====================================================================
    -- DIFFVIEW CUSTOMIZATIONS
    -- ====================================================================
    -- Diffview-specific highlights
    vim.api.nvim_set_hl(0, "DiffviewDiffAddAsText", { fg = addColor, bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffviewDiffDeleteAsText", { fg = deleteColor, bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffviewDiffChangeAsText", { fg = changeColor, bg = "NONE" })

    -- Subtle gutter indicators
    vim.api.nvim_set_hl(0, "DiffAddGutter", { fg = addColor, bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffDeleteGutter", { fg = deleteColor, bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffChangeGutter", { fg = changeColor, bg = "NONE" })

    -- File panel highlights
    vim.api.nvim_set_hl(0, "DiffviewFilePanelTitle", { fg = "#a0a0a0", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffviewFilePanelCounter", { fg = "#8a8a8a", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffviewFilePanelFileName", { fg = "#9a9a9a", bg = "NONE" })

    -- Git signs highlights with consistent colors
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = addColor, bg = "NONE" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = changeColor, bg = "NONE" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = deleteColor, bg = "NONE" })
end

-- ====================================================================
-- SYNTAX HIGHLIGHTS
-- ====================================================================


return M
