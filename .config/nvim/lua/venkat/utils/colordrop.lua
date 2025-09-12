local M = {}

-- Toggle variable: set to true for colored theme, false for monochrome
M.use_colors = false

function M.syntax()
    -- Base colors for both themes
    local black = "#191919"
    local white = "#eeeeee"
    local whiteLike = "#ffffff"

    -- Monochrome palette
    local mono = {
        grey = "#888888",
        lightGrey = "#666666",
        evenLightGrey = "#404040",
        oceanGray = "#70787f",
        silver = "#bec2cb"
    }

    -- Colored palette - muted colors only
    local colors = {
        warnCoral = "#d2a374",  -- Warm coral for numbers and function names
        mutedTeal = "#5f9ea0",  -- Muted teal for operators
        softSalmon = "#e67e7e", -- Soft salmon for booleans
        sageGreen = "#7ca68c"   -- Muted sage green for strings
    }

    -- Select palette based on toggle
    local theme = M.use_colors and {
        primary = white,              -- Functions, numbers
        secondary = mono.grey,        -- Operators (keep grey)
        accent = colors.softSalmon,   -- Booleans
        string = colors.sageGreen,    -- Strings
        comment = mono.evenLightGrey, -- Comments (keep grey)
        keyword = mono.grey,          -- Keywords (keep grey)
        type = mono.grey,             -- Types (keep grey)
        property = mono.grey,         -- Properties (keep grey)
        warning = "#e6be8c",          -- Warnings
        grey = mono.grey,
        lightGrey = mono.lightGrey,
        evenLightGrey = mono.evenLightGrey
    } or {
        primary = white,
        secondary = mono.grey,
        accent = mono.grey,
        string = mono.grey,
        comment = mono.evenLightGrey,
        keyword = mono.grey,
        type = mono.grey,
        property = mono.grey,
        warning = "#e6be8c",
        grey = mono.grey,
        lightGrey = mono.lightGrey,
        evenLightGrey = mono.evenLightGrey
    }

    -- Flash plugin highlights
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = theme.primary, bold = true })
    vim.api.nvim_set_hl(0, "FlashBackdrop", { link = "Normal" })

    -- Command area and prompts
    vim.api.nvim_set_hl(0, 'MsgArea', { fg = theme.grey })
    vim.api.nvim_set_hl(0, 'Question', { fg = theme.grey })
    vim.api.nvim_set_hl(0, 'WildMenu', { fg = theme.grey })
    vim.api.nvim_set_hl(0, "Delimiter", { fg = white })

    -- Attributes
    vim.api.nvim_set_hl(0, "@attribute", { fg = theme.grey })
    vim.api.nvim_set_hl(0, "@tag.attribute", { fg = theme.grey })

    -- Variables
    vim.api.nvim_set_hl(0, "@variable", { fg = white })
    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "@variable.parameter", { fg = white })
    vim.api.nvim_set_hl(0, "@variable.member", { fg = theme.property })

    vim.api.nvim_set_hl(0, "@_jsx_element", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "@tag.tsx", { fg = theme.primary })

    -- Constants
    vim.api.nvim_set_hl(0, "@constant", { fg = white })
    vim.api.nvim_set_hl(0, "@constant.builtin", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "@constant.macro", { fg = theme.secondary })

    -- Functions
    vim.api.nvim_set_hl(0, "Function", { fg = theme.primary, bg = "NONE" })
    vim.api.nvim_set_hl(0, "@function", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "@function.builtin", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "@function.call", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "@function.macro", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "@method", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "@method.call", { fg = theme.primary })

    -- Keywords and operators
    vim.api.nvim_set_hl(0, "@keyword", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@keyword.function", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@keyword.operator", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@keyword.return", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@keyword.import", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@keyword.export", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@keyword.modifiers", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@conditional", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@repeat", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@operator", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "@exception", { fg = theme.keyword })

    -- Types
    vim.api.nvim_set_hl(0, "@type", { fg = theme.type })
    vim.api.nvim_set_hl(0, "@type.builtin", { fg = theme.type })
    vim.api.nvim_set_hl(0, "@type.qualifier", { fg = theme.type })
    vim.api.nvim_set_hl(0, "@type.definition", { fg = theme.type })
    vim.api.nvim_set_hl(0, "@storageclass", { fg = theme.type })
    vim.api.nvim_set_hl(0, "@structure", { fg = theme.type })

    -- Strings and literals
    vim.api.nvim_set_hl(0, "@string", { fg = theme.string })
    vim.api.nvim_set_hl(0, "@string.regex", { fg = theme.string })
    vim.api.nvim_set_hl(0, "@string.escape", { fg = theme.accent })
    vim.api.nvim_set_hl(0, "@string.special", { fg = theme.string })
    vim.api.nvim_set_hl(0, "@character", { fg = theme.string })
    vim.api.nvim_set_hl(0, "@number", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "@boolean", { fg = theme.accent })
    vim.api.nvim_set_hl(0, "@float", { fg = theme.primary })

    -- Properties and fields
    vim.api.nvim_set_hl(0, "@property", { fg = theme.property })
    vim.api.nvim_set_hl(0, "@field", { fg = theme.property })
    vim.api.nvim_set_hl(0, "@parameter", { fg = white })

    -- Comments
    vim.api.nvim_set_hl(0, "@comment", { fg = theme.comment })
    vim.api.nvim_set_hl(0, "@comment.documentation", { fg = theme.lightGrey })
    vim.api.nvim_set_hl(0, "@comment.error", { fg = theme.accent })
    vim.api.nvim_set_hl(0, "@comment.warning", { fg = theme.warning })

    -- Punctuation
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = white })
    vim.api.nvim_set_hl(0, "@punctuation.special", { fg = theme.secondary })

    -- Language-specific highlights
    vim.api.nvim_set_hl(0, "@tag", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@tag.attribute", { fg = theme.property })
    vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "@constructor", { fg = theme.type })

    -- Language-specific overrides
    local langs = { "rust", "javascript", "typescript", "python" }
    for _, lang in ipairs(langs) do
        vim.api.nvim_set_hl(0, "@function.method.call." .. lang, { fg = theme.primary })
        vim.api.nvim_set_hl(0, "@property." .. lang, { fg = theme.property })
        vim.api.nvim_set_hl(0, "@method.call." .. lang, { fg = theme.primary })
        vim.api.nvim_set_hl(0, "@method." .. lang, { fg = theme.primary })
    end

    -- TSX/JSX specific
    vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = theme.property })
    vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = theme.property })
    vim.api.nvim_set_hl(0, "@variable.member", { fg = theme.property })

    -- UI Elements
    vim.api.nvim_set_hl(0, "Border", { fg = theme.grey })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#2C2C2D" })
    vim.api.nvim_set_hl(0, "Search", { bg = "#2C2C2D", fg = theme.primary })
    vim.api.nvim_set_hl(0, "IncSearch", { bg = "#2C2C2D", fg = theme.primary })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "MatchParen", { fg = theme.primary, bold = true })

    -- FZF highlights
    vim.api.nvim_set_hl(0, "fzf_match", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "FzfLuaMatch", { fg = theme.primary })

    -- Completion menu
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "CmpItemKind", { fg = theme.type })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = theme.comment })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2C2C2D" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = black, fg = white })
    vim.api.nvim_set_hl(0, "PmenuMatch", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "PmenuMatchSelected", { fg = theme.primary, bold = true })

    -- Diagnostics
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = theme.accent })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = theme.warning })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = theme.comment })

    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = theme.accent })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = theme.warning })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = theme.comment })

    -- LSP semantic tokens
    vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = theme.property })
    vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = white })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = white })
    vim.api.nvim_set_hl(0, "@lsp.type.keyword", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@lsp.mod.defaultLibrary", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "@tag.builtin", { fg = theme.secondary })

    -- Fallback syntax groups
    vim.api.nvim_set_hl(0, "Keyword", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "String", { fg = theme.string })
    vim.api.nvim_set_hl(0, "Number", { fg = theme.primary })
    vim.api.nvim_set_hl(0, "Boolean", { fg = theme.accent })
    vim.api.nvim_set_hl(0, "Identifier", { fg = white })
    vim.api.nvim_set_hl(0, "Type", { fg = theme.type })
    vim.api.nvim_set_hl(0, "Special", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "Statement", { fg = theme.keyword })

    -- Markdown-specific highlights
    for i = 1, 6 do
        vim.api.nvim_set_hl(0, "@markup.heading." .. i .. ".markdown", { fg = theme.primary, bold = true })
        vim.api.nvim_set_hl(0, "markdownH" .. i, { fg = theme.primary, bold = true })
    end

    vim.api.nvim_set_hl(0, "@markup.heading.marker.markdown", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "@markup.bold.markdown", { fg = theme.accent, bold = true })
    vim.api.nvim_set_hl(0, "@markup.strong.markdown", { fg = theme.accent, bold = true })
    vim.api.nvim_set_hl(0, "@markup.italic.markdown", { fg = white, italic = true })
    vim.api.nvim_set_hl(0, "@markup.raw.markdown", { fg = theme.string })
    vim.api.nvim_set_hl(0, "@markup.link.markdown", { fg = theme.secondary, underline = true })
    vim.api.nvim_set_hl(0, "@markup.link.label.markdown", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "@markup.link.url.markdown", { fg = theme.secondary, italic = true })
    vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = theme.keyword })
    vim.api.nvim_set_hl(0, "@markup.list.checked.markdown", { fg = theme.string, bold = true })
    vim.api.nvim_set_hl(0, "@markup.list.unchecked.markdown", { fg = theme.secondary })
    vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { fg = theme.string })
    vim.api.nvim_set_hl(0, "@markup.quote.markdown", { fg = theme.comment, italic = true })

    -- Git commit highlights
    vim.api.nvim_set_hl(0, "gitcommitComment", { fg = theme.comment })
    vim.api.nvim_set_hl(0, "gitcommitFirstLine", { fg = white })
    vim.api.nvim_set_hl(0, "gitcommitSummary", { fg = white })

    -- JSON specific
    vim.api.nvim_set_hl(0, "@property.json", { fg = theme.property })

    -- REST/HTTP files
    vim.api.nvim_set_hl(0, "restComment", { fg = theme.comment })
    vim.api.nvim_set_hl(0, "restKeyword", { fg = theme.keyword })

    -- YAML
    vim.api.nvim_set_hl(0, "yamlBlockMappingKey", { fg = theme.property })
end

-- Function to toggle between themes
function M.toggle_theme()
    M.use_colors = not M.use_colors
    M.syntax()
    print("Switched to " .. (M.use_colors and "colored" or "monochrome") .. " theme")
end

-- Function to set specific theme
function M.set_theme(colored)
    M.use_colors = colored
    M.syntax()
end

return M
