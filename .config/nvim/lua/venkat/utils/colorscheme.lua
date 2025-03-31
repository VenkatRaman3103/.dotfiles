local colorscheme = {}

-- local bgColor = "#0e0e0e"
local bgColor = ""

local selectionBgColor = "#ffb86c"

function colorscheme.colorMyPencils()
    -- Set a dark background
    vim.opt.background = "dark"

    -- Set background to none for specific highlight groups
    local hl_groups = {
        "Normal",
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
        vim.api.nvim_set_hl(0, group, { bg = bgColor })
    end

    -- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#242424" })
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#333333" })

    -- Zen-mode highlights
    vim.api.nvim_set_hl(0, "ZenBg", { bg = bgColor })

    vim.api.nvim_set_hl(0, "Delimiter", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = white })

    -- Borders and caret highlights
    -- vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#ffffff", bg = bgColor })
    -- vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#ffffff", bg = bgColor })
    -- vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#ffffff", bg = bgColor })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = bgColor })

    -- Borders and caret highlights
    vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#555555", bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#555555", bg = bgColor })
    vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#555555", bg = bgColor })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#555555", bg = bgColor })

    -- set title colors
    vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = "#ffffff", bold = false })
    vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#ffffff", bold = false })

    -- markdown
    -- vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "none" })


    -- -- Neogit notification highlights
    -- vim.api.nvim_set_hl(0, "NeogitNotificationInfo", { bg = "#103510", fg = "#4BB543" })
    -- vim.api.nvim_set_hl(0, "NeogitNotificationWarning", { bg = "#351010", fg = "#FF3333" })
    -- vim.api.nvim_set_hl(0, "NeogitNotificationError", { fg = "#FF3333", bold = true })
    --
    -- -- Consistent Neogit diff highlights
    -- vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "#103510", fg = "#4BB543" })
    -- vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "#351010", fg = "#FF3333" })
    -- vim.api.nvim_set_hl(0, "NeogitDiffContext", { bg = bgColor, fg = "#ffffff" })
    --
    -- -- Consistent Hunk and File Name Highlights
    -- vim.api.nvim_set_hl(0, "NeogitHunkHeader", {
    --     bg = "#222222",
    --     fg = "#ffffff",
    --     bold = true
    -- })
    -- vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", {
    --     bg = "#333333",
    --     fg = "#ffffff",
    --     bold = true
    -- })
    --
    -- -- File names with consistent styling
    -- vim.api.nvim_set_hl(0, "NeogitFileName", {
    --     bg = "#2a2a2a",
    --     fg = "#ffffff",
    --     bold = true
    -- })
    --
    -- -- Consistent status highlights
    -- vim.api.nvim_set_hl(0, "NeogitBranch", { fg = "#ffb86c", bold = true })
    -- vim.api.nvim_set_hl(0, "NeogitRemote", { fg = "#ff6a00", bold = true })
    -- vim.api.nvim_set_hl(0, "NeogitUntrackedfiles", { fg = "#ff6a00" })
    -- vim.api.nvim_set_hl(0, "NeogitStagedChanges", { fg = "#4BB543" })
    -- vim.api.nvim_set_hl(0, "NeogitUnstagedChanges", { fg = "#FFB800" })
    -- vim.api.nvim_set_hl(0, "NeogitRecentCommits", { fg = "#ffb86c" })
    -- vim.api.nvim_set_hl(0, "NeogitSectionTitle", { fg = white, bold = true })
    --
    -- -- Git signs highlights with consistent colors
    -- vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#4BB543" })
    -- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FFB800" })
    -- vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FF3333" })
    --
    -- -- Diff view colors
    -- vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#103510" })
    -- vim.api.nvim_set_hl(0, "DiffChange", { bg = "#262626" })
    -- vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#351010" })
    -- vim.api.nvim_set_hl(0, "DiffText", { bg = "#ffb86c" })
    -- vim.api.nvim_set_hl(0, "Cursor", { fg = "#ffb86c", bg = "#000000" })

    -- Visual selection highlight
    -- vim.api.nvim_set_hl(0, "Visual", { bg = "#ffb86c", fg = "#000000" })
    -- vim.api.nvim_set_hl(0, "Visual", { bg = "#45475a", bold = false })

    -- Highlight the current line with a subtle background 0e0e0e
    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })
    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })

    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#505050", bg = "" })

    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = bgColor })
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "", bg = "" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#666666", bg = "" })

    -- Inactive lines with grayed-out numbers
    -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#505050", bg = bgColor })
    -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#191919", bg = bgColor })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#222222", bg = bgColor })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = bgColor, fg = "none" })

    -- Custom settings for completion menu
    vim.api.nvim_set_hl(0, "Pmenu", { bg = bgColor, fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#ffb86c" })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = bgColor })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "", fg = "none" })

    -- Telescope specific highlights
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bgColor })
    -- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#222222", fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#ff6a00", bold = true })
    -- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = selectionBgColor, fg = "#000000" })
    -- vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#ffffff", bold = true })

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
    -- vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = redistOrange })

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

    -- vim.api.nvim_create_autocmd("ColorScheme", {
    --     callback = function()
    --         vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#ffb86c", fg = "#000000" })
    --     end,
    -- })
end

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
    vim.api.nvim_set_hl(0, "@string", { fg = sageGreen })       -- String literals
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
    vim.api.nvim_set_hl(0, "@comment", { fg = lightGrey })               -- Regular comments
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
    vim.api.nvim_set_hl(0, "String", { fg = sageGreen })
    vim.api.nvim_set_hl(0, "Number", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "Boolean", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "Identifier", { fg = white, underline = false })
    vim.api.nvim_set_hl(0, "Type", { fg = grey })
    vim.api.nvim_set_hl(0, "Special", { fg = grey })
    vim.api.nvim_set_hl(0, "Statement", { fg = grey })
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

    -- Python specific
    vim.api.nvim_set_hl(0, "@method.python", { fg = white })  -- Python methods
    vim.api.nvim_set_hl(0, "@property.python", { fg = grey }) -- Python properties

    -- Ensure consistent bracket and delimiter colors
    vim.api.nvim_set_hl(0, "Delimiter", { fg = white })
    vim.api.nvim_set_hl(0, "MatchParen", { fg = white, bold = true })

    -- UI-related highlights
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = grey })
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

    -- Telescope specific highlights
    -- vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = warnCoral })
    -- vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = warnCoral })
    -- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#363738" })

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

    -- vim.api.nvim_set_hl(0, "Normal", { fg = white, bg = black })
end

return colorscheme
