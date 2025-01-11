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

    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#242424" })

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
    vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#ffffff", bold = true })

    vim.api.nvim_set_hl(0, "NeogitNotificationInfo", { fg = "#4BB543", bold = true })
    vim.api.nvim_set_hl(0, "NeogitNotificationWarning", { fg = "#FFB800", bold = true })
    vim.api.nvim_set_hl(0, "NeogitNotificationError", { fg = "#FF3333", bold = true })

    -- neogit specific highlights
    vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "#103510", fg = "#4BB543" }) -- green background for added lines
    vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "#351010", fg = "#FF3333" }) -- red background for deleted lines
    vim.api.nvim_set_hl(0, "NeogitDiffContext", { bg = bgColor, fg = "#ffffff" }) -- context lines
    vim.api.nvim_set_hl(0, "NeogitHunkHeader", { bg = bgColor, fg = "#ffffff", bold = true }) -- hunk headers
    vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", { bg = "#333333", fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = "#4BB543" })
    vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = "#FF3333" })

    vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = "#4BB543", bg = bgColor })
    vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = "#FF3333", bg = bgColor })
    vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { bg = "#1e1e1e" })
    vim.api.nvim_set_hl(0, "NeogitHunkHeader", { bg = "#1e1e1e", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", { bg = "#2e2e2e", fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "NeogitFoldIcon", { fg = "#ffb86c" })

    -- Status highlights for better readability in the Neogit interface
    vim.api.nvim_set_hl(0, "NeogitBranch", { fg = "#ffb86c", bold = true }) -- branch name
    vim.api.nvim_set_hl(0, "NeogitRemote", { fg = "#ff6a00", bold = true }) -- remote
    vim.api.nvim_set_hl(0, "NeogitUntrackedfiles", { fg = "#ff6a00" }) -- untracked files
    vim.api.nvim_set_hl(0, "NeogitStagedChanges", { fg = "#4BB543" }) -- staged changes
    vim.api.nvim_set_hl(0, "NeogitUnstagedChanges", { fg = "#FFB800" }) -- unstaged changes
    vim.api.nvim_set_hl(0, "NeogitRecentCommits", { fg = "#ffb86c" }) -- recent commits

    -- Section titles in Neogit (e.g., staged changes, untracked files)
    vim.api.nvim_set_hl(0, "NeogitSectionTitle", { fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "NeogitSectionHighlight", { bg = "#222222", fg = "#ffffff" })

    -- -- Add these to your ColorMyPencils function or init.lua
    -- vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#4BB543" }) -- A nice bright green
    -- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FFB800" }) -- A warm yellow/orange
    -- vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FF3333" }) -- A vibrant red
    --
    -- -- Diff colors for the actual diff view
    -- vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#103510" }) -- Subtle dark green background
    -- vim.api.nvim_set_hl(0, "DiffChange", { bg = "#262626" }) -- Subtle gray for changed lines
    -- vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#351010" }) -- Subtle dark red background
    -- vim.api.nvim_set_hl(0, "DiffText", { bg = "#264F78" }) -- Bright blue for changed text within lines

    -- Custom caret (cursor) color
    vim.api.nvim_set_hl(0, "Cursor", { fg = "#ffb86c", bg = "#000000" })

    -- Visual selection highlight
    vim.api.nvim_set_hl(0, "Visual", { bg = "#ffb86c", fg = "#000000" })

    -- Highlight the current line with a subtle background 0e0e0e
    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })
    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })

    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#505050", bg = "" })

    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = bgColor })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bg = "" })

    -- Inactive lines with grayed-out numbers
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#505050", bg = bgColor })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = bgColor })

    -- Custom settings for completion menu
    vim.api.nvim_set_hl(0, "Pmenu", { bg = bgColor, fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#ffb86c" })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = bgColor })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "", fg = "none" })

    -- Telescope specific highlights
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bgColor })
    vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#222222", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#ff6a00", bold = true })
    -- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = selectionBgColor, fg = "#000000" })
    -- vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#ffffff", bold = true })

    -- Disable underlines
    vim.api.nvim_set_hl(0, "Underlined", { underline = false })
    vim.api.nvim_set_hl(0, "SpellBad", { underline = false })
    vim.api.nvim_set_hl(0, "SpellCap", { underline = false })
    vim.api.nvim_set_hl(0, "SpellRare", { underline = false })
    vim.api.nvim_set_hl(0, "SpellLocal", { underline = false })

    -- Modified: Thicker window separators with custom characters
    vim.opt.fillchars = {
        horiz = "─", -- Horizontal separator (thin)
        vert = "│", -- Vertical separator (thin)
        vertleft = "┤", -- T-piece pointing left (thin)
        vertright = "├", -- T-piece pointing right (thin)
        verthoriz = "┼", -- Cross piece (thin)
    }

    -- Make window separators more visible with a brighter color
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#222222", bg = bgColor })
    vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = redistOrange })

    -- Add top and bottom border highlights for buffers
    vim.api.nvim_set_hl(0, "BufferLineTop", { fg = "#222222", bg = bgColor })
    vim.api.nvim_set_hl(0, "BufferLineBottom", { fg = "#222222", bg = bgColor })

    -- Enable window borders
    vim.opt.laststatus = 3 -- Global status line
    vim.opt.winbar = "" -- Empty winbar to create space for top border

    -- Make sure window separators are always visible
    vim.opt.fillchars:append("eob: ") -- Hide empty line tildes
    vim.opt.lazyredraw = false -- Ensure separators are always drawn
    vim.opt.splitkeep = "screen" -- Maintain window separators during splits

    vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
            vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#ffb86c", fg = "#000000" })
        end,
    })
end

function colorscheme.syntax()
    -- Custom color scheme
    local blue = "#3aa8e3"
    -- local orange = "#fb8a20"
    local orange = "#de8430"
    local brightGree = "#5ad39d"
    local green = "#70b276"
    local purple = "#7b95ce"
    local white = "#FFFFFF"
    local gray = "#5f5f5f"
    local yellow = "#e5c07b"
    local red = "#e06c75"
    local cyan = "#56b6c2"
    local redistOrange = "#c95b20" --#e25303

    -- Basic syntax
    vim.api.nvim_set_hl(0, "@variable", { fg = white })
    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = purple }) -- self, this, etc
    vim.api.nvim_set_hl(0, "@constant", { fg = purple })
    vim.api.nvim_set_hl(0, "@constant.builtin", { fg = purple }) -- nil, true, false

    -- Functions
    vim.api.nvim_set_hl(0, "@function", { fg = orange })
    vim.api.nvim_set_hl(0, "@function.builtin", { fg = orange })
    vim.api.nvim_set_hl(0, "@function.call", { fg = orange })
    vim.api.nvim_set_hl(0, "@method", { fg = orange })
    vim.api.nvim_set_hl(0, "@method.call", { fg = orange })

    -- Keywords and operators
    vim.api.nvim_set_hl(0, "@keyword", { fg = blue })
    vim.api.nvim_set_hl(0, "@keyword.function", { fg = redistOrange })
    vim.api.nvim_set_hl(0, "@keyword.operator", { fg = redistOrange })
    vim.api.nvim_set_hl(0, "@keyword.return", { fg = redistOrange })
    vim.api.nvim_set_hl(0, "@conditional", { fg = blue }) -- if, else, etc
    vim.api.nvim_set_hl(0, "@repeat", { fg = blue }) -- for, while, etc
    vim.api.nvim_set_hl(0, "@operator", { fg = blue }) -- =, +, -, etc
    vim.api.nvim_set_hl(0, "@operator.cpp", { fg = white }) -- =, +, -, etc
    -- vim.api.nvim_set_hl(0, "@lsp.type.operator.cpp", { fg = redistOrange }) -- =, +, -, etc

    --@lsp.type.operator.cpp
    -- Types
    vim.api.nvim_set_hl(0, "@type", { fg = yellow })
    vim.api.nvim_set_hl(0, "@type.builtin", { fg = yellow })
    vim.api.nvim_set_hl(0, "@type.qualifier", { fg = blue })
    vim.api.nvim_set_hl(0, "@type.definition", { fg = yellow })

    -- Strings and numbers
    vim.api.nvim_set_hl(0, "@string", { fg = green })
    vim.api.nvim_set_hl(0, "@string.escape", { fg = orange })
    vim.api.nvim_set_hl(0, "@number", { fg = brightGree })
    vim.api.nvim_set_hl(0, "@boolean", { fg = purple })

    -- Properties and parameters
    vim.api.nvim_set_hl(0, "@property", { fg = white })
    vim.api.nvim_set_hl(0, "@parameter", { fg = white })
    vim.api.nvim_set_hl(0, "@field", { fg = white })

    -- Comments
    vim.api.nvim_set_hl(0, "@comment", { fg = gray, italic = true })
    vim.api.nvim_set_hl(0, "@comment.documentation", { fg = gray, italic = true })

    -- Punctuation
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.special", { fg = blue })

    -- Tags (for JSX/HTML)
    vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = gray })

    -- CSS/SCSS specific
    vim.api.nvim_set_hl(0, "@property.css", { fg = blue })
    vim.api.nvim_set_hl(0, "@number.css", { fg = orange })
    vim.api.nvim_set_hl(0, "@string.css", { fg = green })

    -- JSON specific
    vim.api.nvim_set_hl(0, "@label.json", { fg = blue })
    vim.api.nvim_set_hl(0, "@string.json", { fg = green })

    -- LSP Semantic tokens
    vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = orange })
    vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = orange })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = white })
    vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = white })
    vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = white })
    vim.api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary", { fg = orange })
    vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary", { fg = purple })

    -- Custom colors for syntax highlighting
    vim.api.nvim_set_hl(0, "Keyword", { fg = blue, underline = false }) -- Blue
    vim.api.nvim_set_hl(0, "Function", { fg = orange, underline = false }) -- Orange
    vim.api.nvim_set_hl(0, "Class", { fg = "#FF4500", underline = false }) -- Reddish Orange
    vim.api.nvim_set_hl(0, "Tag", { fg = blue, underline = false }) -- Blue
    vim.api.nvim_set_hl(0, "TagName", { fg = blue, underline = false }) -- Blue

    -- Other colors
    vim.api.nvim_set_hl(0, "String", { fg = green }) -- Green
    vim.api.nvim_set_hl(0, "Number", { fg = orange }) -- Light Orange
    vim.api.nvim_set_hl(0, "Boolean", { fg = purple }) -- Purple
    vim.api.nvim_set_hl(0, "Null", { fg = purple }) -- Purple
    vim.api.nvim_set_hl(0, "None", { fg = purple }) -- Purple
    vim.api.nvim_set_hl(0, "Identifier", { fg = "#FFFFFF", underline = false })
    vim.api.nvim_set_hl(0, "Normal", { fg = "#FFFFFF", bg = bgColor })
    vim.api.nvim_set_hl(0, "Variable", { fg = "#FFFFFF", bg = bgColor }) -- Variable names

    -- Add these to your ColorMyPencils function
    vim.api.nvim_set_hl(0, "@function", { fg = orange, underline = false })
    vim.api.nvim_set_hl(0, "@function.call", { fg = orange, underline = false })
    vim.api.nvim_set_hl(0, "@method", { fg = orange, underline = false })
    vim.api.nvim_set_hl(0, "@method.call", { fg = orange, underline = false })

    -- Also ensure these are set (you already have some of these)
    vim.api.nvim_set_hl(0, "Function", { fg = orange, underline = false })
    vim.api.nvim_set_hl(0, "Identifier", { fg = "#FFFFFF", underline = false })

    vim.api.nvim_set_hl(0, "@keyword.import", { fg = redistOrange, underline = false })

    -- Regular brackets in white
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = white }) -- For {}, [], ()
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = white }) -- For {}, [], () in TSX
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = white }) -- For {}, [], () in JSX

    -- Component name in orange, brackets in blue
    vim.api.nvim_set_hl(0, "@constructor", { fg = orange }) -- For component names
    vim.api.nvim_set_hl(0, "@tag", { fg = orange }) -- For component names
    vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = blue }) -- For < > / brackets
    vim.api.nvim_set_hl(0, "@constructor", { fg = orange }) -- Specific to TSX
    vim.api.nvim_set_hl(0, "@tag.tsx", { fg = orange }) -- Specific to TSX
    vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = blue }) -- Specific to TSX

    -- Additional JSX/TSX specific highlights
    vim.api.nvim_set_hl(0, "@punctuation.bracket.tsx", { fg = blue }) -- Ensure brackets are blue
    vim.api.nvim_set_hl(0, "@punctuation.special.tsx", { fg = blue }) -- For special characters like /

    -- Ensure consistency in JSX attributes
    vim.api.nvim_set_hl(0, "@tag.attribute", { fg = white }) -- For props/attributes
    vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = white }) -- For props/attributes in TSX

    -- HTML tags in blue, Component names in orange, brackets in blue
    vim.api.nvim_set_hl(0, "@constructor", { fg = orange }) -- For component names (PascalCase)
    vim.api.nvim_set_hl(0, "@constructor.tsx", { fg = orange }) -- For component names in TSX

    -- HTML tags in blue
    vim.api.nvim_set_hl(0, "@tag", { fg = blue }) -- For HTML tags (div, span, etc)
    vim.api.nvim_set_hl(0, "@tag.builtin", { fg = blue }) -- For built-in HTML tags

    -- Angle brackets in blue
    vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = gray }) -- For < > / in JSX
    vim.api.nvim_set_hl(0, "@tag.delimiter.tsx", { fg = gray }) -- For < > / in TSX

    -- Additional JSX/TSX specific highlights
    vim.api.nvim_set_hl(0, "@punctuation.bracket.tsx", { fg = blue }) -- Ensure brackets are blue
    vim.api.nvim_set_hl(0, "@punctuation.special.tsx", { fg = blue }) -- For special characters like /

    -- Ensure consistency in JSX attributes
    vim.api.nvim_set_hl(0, "@tag.attribute", { fg = white }) -- For props/attributes
    vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = white }) -- For props/attributes in TSX

    -- Custom highlighting for capital-case components vs lowercase HTML tags
    vim.api.nvim_set_hl(0, "@type.tsx", { fg = orange }) -- Ensures custom components (PascalCase) are orange
    vim.api.nvim_set_hl(0, "@keyword.tsx", { fg = blue }) -- Additional support for HTML keywords

    -- Specific HTML tag highlighting
    vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { fg = blue }) -- Built-in HTML elements in TSX
    vim.api.nvim_set_hl(0, "@tag.builtin.jsx", { fg = blue }) -- Built-in HTML elements in JSX

    -- Make all brackets white
    vim.api.nvim_set_hl(0, "Delimiter", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = white }) -- Basic bracket highlighting
    vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = white }) -- Other delimiters

    -- Ensure brackets are white in every language
    vim.api.nvim_set_hl(0, "@punctuation", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.bracket.javascript", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.bracket.typescript", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.bracket.tsx", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.bracket.jsx", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.bracket.python", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.bracket.lua", { fg = white })

    -- Move control flow keywords to orange
    vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = redistOrange }) -- if, else
    vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = redistOrange }) -- for, while
    vim.api.nvim_set_hl(0, "@keyword.function", { fg = redistOrange }) -- function keyword
    vim.api.nvim_set_hl(0, "@conditional", { fg = redistOrange }) -- if, else (tree-sitter)
    vim.api.nvim_set_hl(0, "@repeat", { fg = redistOrange }) -- for, while (tree-sitter)

    -- Keep type-related keywords in blue
    vim.api.nvim_set_hl(0, "@keyword", { fg = blue }) -- other keywords
    vim.api.nvim_set_hl(0, "@keyword.operator", { fg = blue }) -- operators
    vim.api.nvim_set_hl(0, "@keyword.return", { fg = redistOrange }) -- return
    vim.api.nvim_set_hl(0, "@operator", { fg = blue }) -- =, +, -, etc
    vim.api.nvim_set_hl(0, "@type.qualifier", { fg = blue }) -- const, let, var
    vim.api.nvim_set_hl(0, "@storageclass", { fg = blue }) -- storage class keywords
    vim.api.nvim_set_hl(0, "@type", { fg = blue }) -- int, char, etc.
    vim.api.nvim_set_hl(0, "@type.builtin", { fg = blue }) -- int, char, etc.

    -- Functions and methods
    vim.api.nvim_set_hl(0, "@function", { fg = orange })
    vim.api.nvim_set_hl(0, "@function.builtin", { fg = orange })
    vim.api.nvim_set_hl(0, "@function.call", { fg = orange })
    vim.api.nvim_set_hl(0, "@method", { fg = orange })
    vim.api.nvim_set_hl(0, "@method.call", { fg = orange })

    -- LSP semantic tokens
    vim.api.nvim_set_hl(0, "@lsp.type.keyword.cpp", { fg = blue }) -- type keywords in C++
    vim.api.nvim_set_hl(0, "@lsp.type.keyword.typescript", { fg = blue }) -- type keywords in TypeScript
    vim.api.nvim_set_hl(0, "@lsp.type.keyword.javascript", { fg = blue }) -- type keywords in JavaScript
    -- Make sure all types of brackets are white
    vim.api.nvim_set_hl(0, "MatchParen", { fg = white, bold = true }) -- Matching parentheses

    vim.api.nvim_set_hl(0, "@keyword.require", { fg = redistOrange }) -- require keyword in Lua
    vim.api.nvim_set_hl(0, "@function.require", { fg = redistOrange }) -- require function calls
end

return colorscheme
