local colorscheme = {}

-- local bgColor = "#0e0e0e"
local bgColor = ""
-- local secondaryBgColor = "#090909"
-- local secondaryBgColor = "#101010"
local secondaryBgColor = "#0c0c0c"
local whiteLike = "#d0d0d0"


local selectionBgColor = "#ffb86c"

-- ====================================================================
-- COLORSCHEME
-- ====================================================================
function colorscheme.colorMyPencils()
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
        -- "HarpoonNormal",
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
        -- "HarpoonWindow",
        -- "HarpoonWindowTitle",
        -- "HarpoonBorder",

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
    -- vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#555555", bg = bgColor })
    -- vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = secondaryBgColor, bg = secondaryBgColor })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#555555", bg = bgColor })


    vim.api.nvim_set_hl(0, "FloatBorder", { fg = secondaryBgColor, bg = secondaryBgColor }) -- General floating windows
    vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = secondaryBgColor, fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = secondaryBgColor, bg = secondaryBgColor })
    vim.api.nvim_set_hl(0, "NormalBorder", { fg = "#060606", bg = "NONE" }) -- Normal floating borders
    vim.api.nvim_set_hl(0, "VertSplit", { fg = "#060606", bg = "NONE" })    -- Split lines

    -- set title colors
    vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#ffffff", bold = false })
    -- vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#ffffff", bold = false })

    -- Visual selection highlight
    -- vim.api.nvim_set_hl(0, "Visual", { bg = "#ffb86c", fg = "#000000" })
    -- vim.api.nvim_set_hl(0, "Visual", { bg = "#45475a", bold = false })

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
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bgColor })

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

    vim.api.nvim_set_hl(0, "Function", { fg = uiSubdued, bg = "NONE" })


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

    -- ====================================================================
    -- NEOGIT CUSTOMIZATIONS
    -- ====================================================================
    -- Color definitions for consistency
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

    -- Consistent status highlights using grayscale
    vim.api.nvim_set_hl(0, "NeogitBranch", { fg = "#a0a0a0", bold = true, bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeogitRemote", { fg = "#909090", bold = true, bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeogitUntrackedfiles", { fg = "#7a7a7a", bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeogitStagedChanges", { fg = addColor, bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeogitUnstagedChanges", { fg = "#5f9ea0", bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeogitRecentCommits", { fg = changeColor, bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeogitSectionTitle", { fg = "#ffffff", bold = true, bg = "NONE" })

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

function colorscheme.syntax()
    -- Monochrome color palette
    local grey = "#a7a7a7"
    local lightGrey = "#666666"
    local evenLightGrey = "#505050"
    local white = "#ffffff"
    local black = "#191919"
    local oceanGray = "#70787f"
    local silver = "#bec2cb"
    local warnCoral = "#d2a374"  -- Warm coral for numbers and function names
    local mutedTeal = "#5f9ea0"  -- Muted teal for operators
    local softSalmon = "#e67e7e" -- Soft salmon for booleans
    local sageGreen = "#7ca68c"  -- Muted sage green

    -- Basic syntax
    -- Variables highlight settings
    vim.api.nvim_set_hl(0, "@variable", { fg = white })           -- Regular variables
    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = grey })    -- Built-in variables like self, this, etc
    vim.api.nvim_set_hl(0, "@variable.parameter", { fg = white }) -- Function parameters
    vim.api.nvim_set_hl(0, "@variable.member", { fg = grey })     -- Member variables, will affect things like .len in some languages

    -- Constants highlight settings
    vim.api.nvim_set_hl(0, "@constant", { fg = white })        -- User-defined constants
    vim.api.nvim_set_hl(0, "@constant.builtin", { fg = grey }) -- Built-in constants like nil, true, false
    vim.api.nvim_set_hl(0, "@constant.macro", { fg = grey })   -- Constants defined by macros

    -- Functions - all set to warnCoral (orange) for function names and calls
    vim.api.nvim_set_hl(0, "@function", { fg = white })         -- Function declarations
    vim.api.nvim_set_hl(0, "@function.builtin", { fg = white }) -- Built-in functions
    vim.api.nvim_set_hl(0, "@function.call", { fg = white })    -- Function calls
    vim.api.nvim_set_hl(0, "@function.macro", { fg = white })   -- Macro function calls
    vim.api.nvim_set_hl(0, "@method", { fg = white })           -- Method declarations
    vim.api.nvim_set_hl(0, "@method.call", { fg = white })      -- Method calls

    -- Keywords and operators highlight settings
    vim.api.nvim_set_hl(0, "@keyword", { fg = grey })           -- General keywords
    vim.api.nvim_set_hl(0, "@keyword.function", { fg = grey })  -- Keywords used to define functions
    vim.api.nvim_set_hl(0, "@keyword.operator", { fg = grey })  -- Keywords that operate (e.g., typeof, instanceof)
    vim.api.nvim_set_hl(0, "@keyword.return", { fg = grey })    -- Keywords like return, yield
    vim.api.nvim_set_hl(0, "@keyword.import", { fg = grey })    -- Import related keywords
    vim.api.nvim_set_hl(0, "@keyword.export", { fg = grey })    -- Export related keywords
    vim.api.nvim_set_hl(0, "@keyword.modifiers", { fg = grey }) -- Modifiers like static, volatile etc
    vim.api.nvim_set_hl(0, "@conditional", { fg = grey })       -- if, else, etc
    vim.api.nvim_set_hl(0, "@repeat", { fg = grey })            -- for, while, etc
    vim.api.nvim_set_hl(0, "@operator", { fg = grey })          -- =, +, -, etc
    vim.api.nvim_set_hl(0, "@exception", { fg = grey })         -- try, catch, throw

    -- Types highlight settings
    vim.api.nvim_set_hl(0, "@type", { fg = grey })            -- Type names
    vim.api.nvim_set_hl(0, "@type.builtin", { fg = grey })    -- Built-in types
    vim.api.nvim_set_hl(0, "@type.qualifier", { fg = grey })  -- Type qualifiers
    vim.api.nvim_set_hl(0, "@type.definition", { fg = grey }) -- Type definitions
    vim.api.nvim_set_hl(0, "@storageclass", { fg = grey })    -- Storage class modifiers
    vim.api.nvim_set_hl(0, "@structure", { fg = grey })       -- Struct, union, enum, etc.

    -- Strings and numeric values highlight settings
    -- vim.api.nvim_set_hl(0, "@string", { fg = sageGreen })       -- String literals
    vim.api.nvim_set_hl(0, "@string", { fg = grey })            -- String literals
    vim.api.nvim_set_hl(0, "@string.regex", { fg = sageGreen }) -- Regular expressions
    vim.api.nvim_set_hl(0, "@string.escape", { fg = grey })     -- Escape characters in strings
    vim.api.nvim_set_hl(0, "@string.special", { fg = grey })    -- Special strings like urls, file paths
    vim.api.nvim_set_hl(0, "@character", { fg = sageGreen })    -- Character literals
    vim.api.nvim_set_hl(0, "@number", { fg = warnCoral })       -- Numeric literals
    vim.api.nvim_set_hl(0, "@boolean", { fg = warnCoral })      -- Boolean literals
    vim.api.nvim_set_hl(0, "@float", { fg = warnCoral })        -- Floating point numbers

    -- Properties and parameters - key section for controlling .len appearance
    vim.api.nvim_set_hl(0, "@property", { fg = grey })   -- Object/class properties - for .len and similar
    vim.api.nvim_set_hl(0, "@field", { fg = grey })      -- Struct/Union fields - also affects properties in some languages
    vim.api.nvim_set_hl(0, "@parameter", { fg = white }) -- Function parameters

    -- Method properties - these can sometimes override @property for methods like .len()
    vim.api.nvim_set_hl(0, "@method.property", { fg = grey })      -- Custom rule for method properties
    vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = grey })    -- LSP property types
    vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = warnCoral }) -- LSP method types

    -- Attribute highlights - relevant for some languages
    vim.api.nvim_set_hl(0, "@attribute", { fg = grey })  -- Attributes/annotations
    vim.api.nvim_set_hl(0, "@namespace", { fg = white }) -- Namespace identifiers

    -- Comments highlight settings
    vim.api.nvim_set_hl(0, "@comment", { fg = evenLightGrey })           -- Regular comments
    vim.api.nvim_set_hl(0, "@comment.documentation", { fg = lightGrey }) -- Documentation comments
    vim.api.nvim_set_hl(0, "@comment.error", { fg = "#d2788c" })         -- Error comments like TODO, FIXME
    vim.api.nvim_set_hl(0, "@comment.warning", { fg = "#e6be8c" })       -- Warning comments

    -- Punctuation highlight settings
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = white })   -- Brackets, braces, parentheses
    vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = white }) -- Delimiters like commas, colons
    vim.api.nvim_set_hl(0, "@punctuation.special", { fg = grey })    -- Special punctuation like quotes, bullets

    -- Custom colors for syntax highlighting - non-treesitter fallbacks
    vim.api.nvim_set_hl(0, "Keyword", { fg = grey, underline = false })
    -- vim.api.nvim_set_hl(0, "Function", { fg = white, underline = false }) -- Changed to warnCoral
    -- vim.api.nvim_set_hl(0, "String", { fg = sageGreen })
    vim.api.nvim_set_hl(0, "String", { fg = sageGreen })
    vim.api.nvim_set_hl(0, "Number", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "Boolean", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "Identifier", { fg = white, underline = false })
    vim.api.nvim_set_hl(0, "Type", { fg = grey })
    vim.api.nvim_set_hl(0, "Special", { fg = grey })
    vim.api.nvim_set_hl(0, "restKeyword", { fg = grey })
    vim.api.nvim_set_hl(0, "restComment", { fg = lightGrey })
    vim.api.nvim_set_hl(0, "Statement", { fg = grey })
    vim.api.nvim_set_hl(0, "yamlBlockMappingKey", { fg = grey })

    -- vim.api.nvim_set_hl(0, "Normal", { fg = white, bg = black })

    -- Additional language-specific highlighting
    vim.api.nvim_set_hl(0, "@tag", { fg = white })          -- HTML/XML tags
    vim.api.nvim_set_hl(0, "@tag.attribute", { fg = grey }) -- HTML/XML tag attributes
    vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = grey }) -- HTML/XML tag delimiters
    vim.api.nvim_set_hl(0, "@constructor", { fg = white })  -- Constructors

    -- Language-specific tweaks
    -- Rust specific - for handling methods like .len() in Rust
    vim.api.nvim_set_hl(0, "@function.method.call.rust", { fg = white }) -- Method calls in Rust
    vim.api.nvim_set_hl(0, "@property.rust", { fg = grey })              -- Properties in Rust

    -- JavaScript/TypeScript specific
    vim.api.nvim_set_hl(0, "@property.javascript", { fg = grey })     -- JS properties
    vim.api.nvim_set_hl(0, "@property.typescript", { fg = grey })     -- TS properties
    vim.api.nvim_set_hl(0, "@method.call.javascript", { fg = white }) -- JS method calls
    vim.api.nvim_set_hl(0, "@method.call.typescript", { fg = white }) -- TS method calls
    vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = grey })       -- TS method calls


    -- Python specific
    vim.api.nvim_set_hl(0, "@method.python", { fg = white })  -- Python methods
    vim.api.nvim_set_hl(0, "@property.python", { fg = grey }) -- Python properties

    -- Ensure consistent bracket and delimiter colors
    vim.api.nvim_set_hl(0, "Delimiter", { fg = white })
    vim.api.nvim_set_hl(0, "MatchParen", { fg = white, bold = true })

    -- UI-related highlights
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = grey })
    vim.api.nvim_set_hl(0, "Border", { fg = grey })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#363738" })
    vim.api.nvim_set_hl(0, "Search", { bg = "#363738", fg = warnCoral })

    -- Search highlight and UI integrations (FZF, Telescope, completion)
    vim.api.nvim_set_hl(0, "Search", { bg = "#363738" })
    vim.api.nvim_set_hl(0, "IncSearch", { bg = "#363738", fg = warnCoral })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })

    -- FZF specific highlights
    vim.api.nvim_set_hl(0, "fzf_match", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "FzfLuaMatch", { fg = warnCoral })

    -- Autocompletion menu highlights
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "CmpItemKind", { fg = grey })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = grey })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#363738" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = black, fg = white })

    -- Native neovim completion highlights
    vim.api.nvim_set_hl(0, "PmenuMatch", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "PmenuMatchSelected", { fg = warnCoral, bold = true })

    -- Neovim diagnostic highlights
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#d2788c" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#e6be8c" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = mutedTeal })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = evenLightGrey })


    -- Error and warning colors
    vim.api.nvim_set_hl(0, "Error", { fg = "#d2788c" })
    vim.api.nvim_set_hl(0, "Warning", { fg = "#e6be8c" })
    vim.api.nvim_set_hl(0, "Hint", { fg = evenLightGrey })
    vim.api.nvim_set_hl(0, "Info", { fg = mutedTeal })


    -- LSP semantic tokens support (newer treesitter integration)
    -- These can override treesitter highlighting in newer Neovim versions
    vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = white })
    vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = white })
    vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = grey })
    vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = white })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = white })
    vim.api.nvim_set_hl(0, "@lsp.type.keyword", { fg = grey })
    -- vim.api.nvim_set_hl(0, "@lsp.type.function.javascript", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "@lsp.mod.defaultLibrary", { fg = grey })

    -- For LSP diagnostics
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#e67e7e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#d2a374", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#7ca68c", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#aaaaaa", bg = "NONE" })

    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "#e67e7e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = "#d2a374", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = "#7ca68c", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#aaaaaa", bg = "NONE" })

    -- vim.api.nvim_set_hl(0, "@comment.documentation", { fg = grey })


    -- vim.api.nvim_set_hl(0, "Normal", { fg = white, bg = black })

    -- ============================================================
    -- Markdown-specific highlighting
    -- ============================================================

    -- Headers with distinct highlighting based on level
    vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = lightGrey, bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = lightGrey, bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = lightGrey, bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = lightGrey, bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = lightGrey, bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = lightGrey, bold = true })

    vim.api.nvim_set_hl(0, "@text.markdown", { fg = whiteLike })
    vim.api.nvim_set_hl(0, "markdownParagraph", { fg = whiteLike })

    -- Header markers (# symbols)
    vim.api.nvim_set_hl(0, "@markup.heading.marker.markdown", { fg = grey })

    -- Text formatting
    vim.api.nvim_set_hl(0, "@markup.bold.markdown", { fg = grey, bold = true })
    vim.api.nvim_set_hl(0, "@markup.strong.markdown", { fg = grey, bold = true })
    vim.api.nvim_set_hl(0, "@markup.strong", { fg = grey, bold = true })
    vim.api.nvim_set_hl(0, "@markup.italic.markdown", { fg = white, italic = true })
    vim.api.nvim_set_hl(0, "@markup.strikethrough.markdown", { fg = lightGrey, strikethrough = true })
    vim.api.nvim_set_hl(0, "@markup.raw.markdown", { fg = sageGreen }) -- Inline code

    -- Links and references
    vim.api.nvim_set_hl(0, "@markup.link.markdown", { fg = mutedTeal, underline = true })
    vim.api.nvim_set_hl(0, "@markup.link.label.markdown", { fg = mutedTeal })
    vim.api.nvim_set_hl(0, "@markup.link.url.markdown", { fg = mutedTeal, italic = true })

    -- List markers
    vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = grey })
    vim.api.nvim_set_hl(0, "@markup.list.checked.markdown", { fg = sageGreen })
    vim.api.nvim_set_hl(0, "@markup.list.unchecked.markdown", { fg = grey })

    -- Code blocks
    vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { fg = sageGreen })
    vim.api.nvim_set_hl(0, "@markup.raw.delimiter.markdown", { fg = grey })

    -- Blockquotes
    vim.api.nvim_set_hl(0, "@markup.quote.markdown", { fg = silver, italic = true })
    vim.api.nvim_set_hl(0, "@markup.quote.delimiter.markdown", { fg = grey })

    -- Tables
    vim.api.nvim_set_hl(0, "@markup.table.markdown", { fg = white })
    vim.api.nvim_set_hl(0, "@markup.table.delimiter.markdown", { fg = grey })

    -- HTML in Markdown
    vim.api.nvim_set_hl(0, "@markup.raw.html_inline.markdown", { fg = grey })

    -- //@markup.heading.1.markdown

    -- Traditional highlight groups for Markdown (fallbacks)
    vim.api.nvim_set_hl(0, "markdownH1", { fg = whiteLike, bold = true })
    vim.api.nvim_set_hl(0, "markdownH2", { fg = whiteLike, bold = true })
    vim.api.nvim_set_hl(0, "markdownH3", { fg = whiteLike })
    vim.api.nvim_set_hl(0, "markdownH4", { fg = whiteLike })
    vim.api.nvim_set_hl(0, "markdownH5", { fg = silver })
    vim.api.nvim_set_hl(0, "markdownH6", { fg = silver })
    vim.api.nvim_set_hl(0, "@spell.markdown", { fg = whiteLike })

    vim.api.nvim_set_hl(0, "markdownBold", { fg = grey, bold = true })
    vim.api.nvim_set_hl(0, "markdownItalic", { fg = white, italic = true })
    vim.api.nvim_set_hl(0, "markdownCode", { fg = sageGreen })
    vim.api.nvim_set_hl(0, "markdownCodeBlock", { fg = sageGreen })
    vim.api.nvim_set_hl(0, "markdownBlockquote", { fg = silver, italic = true })

    vim.api.nvim_set_hl(0, "markdownLink", { fg = mutedTeal, underline = true })
    vim.api.nvim_set_hl(0, "markdownLinkText", { fg = mutedTeal })
    vim.api.nvim_set_hl(0, "markdownUrl", { fg = mutedTeal, italic = true })

    vim.api.nvim_set_hl(0, "markdownListMarker", { fg = grey })
    vim.api.nvim_set_hl(0, "markdownOrderedListMarker", { fg = grey })

    vim.api.nvim_set_hl(0, "gitcommitComment", { fg = evenLightGrey })
    vim.api.nvim_set_hl(0, "gitcommitFirstLine", { fg = white })
    vim.api.nvim_set_hl(0, "gitcommitSummary", { fg = white })
end

return colorscheme

-- vim.api.nvim_set_hl(0, "NeogitChangeModified", { bg = "NONE", fg = "#7ca68c" })
