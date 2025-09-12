local M = {}

function M.syntax()
    -- Monochrome color palette
    -- local grey = "#a7a7a7"
    local grey = "#888888"
    local lightGrey = "#666666"
    -- local evenLightGrey = "#505050"
    local evenLightGrey = "#404040"
    -- local white = "#ffffff"
    local white = "#eeeeee"
    local black = "#191919"
    local oceanGray = "#70787f"
    local silver = "#bec2cb"
    local warnCoral = "#d2a374"  -- Warm coral for numbers and function names
    local mutedTeal = "#5f9ea0"  -- Muted teal for operators
    local softSalmon = "#e67e7e" -- Soft salmon for booleans
    local sageGreen = "#7ca68c"  -- Muted sage green

    -- local grey = "#999999"
    -- local lightGrey = "#666666"
    -- local evenLightGrey = "#404040"
    -- local white = "#eeeeee"
    -- local black = "#191919"
    -- local oceanGray = "#70787f"

    vim.api.nvim_set_hl(0, "Function", { fg = white, bg = "NONE" })

    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#d2a374", bold = true })
    vim.api.nvim_set_hl(0, "FlashBackdrop", { link = "Normal" })


    vim.api.nvim_set_hl(0, 'MsgArea', { fg = grey })  -- Command area text
    vim.api.nvim_set_hl(0, 'Question', { fg = grey }) -- Prompt/question text
    vim.api.nvim_set_hl(0, 'WildMenu', { fg = grey }) -- Command-line completion menu
    vim.api.nvim_set_hl(0, "Delimiter", { fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#ffffff" })

    vim.api.nvim_set_hl(0, "@attribute", { fg = grey })
    vim.api.nvim_set_hl(0, "@tag.attribute", { fg = grey })

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
    vim.api.nvim_set_hl(0, "@string", { fg = grey })         -- String literals
    vim.api.nvim_set_hl(0, "@string.regex", { fg = grey })   -- Regular expressions
    vim.api.nvim_set_hl(0, "@string.escape", { fg = grey })  -- Escape characters in strings
    vim.api.nvim_set_hl(0, "@string.special", { fg = grey }) -- Special strings like urls, file paths
    vim.api.nvim_set_hl(0, "@character", { fg = sageGreen }) -- Character literals
    vim.api.nvim_set_hl(0, "@number", { fg = warnCoral })    -- Numeric literals
    vim.api.nvim_set_hl(0, "@boolean", { fg = warnCoral })   -- Boolean literals
    vim.api.nvim_set_hl(0, "@float", { fg = warnCoral })     -- Floating point numbers


    -- Properties and parameters - key section for controlling .len appearance
    vim.api.nvim_set_hl(0, "@property", { fg = grey })   -- Object/class properties - for .len and similar
    vim.api.nvim_set_hl(0, "@field", { fg = grey })      -- Struct/Union fields - also affects properties in some languages
    vim.api.nvim_set_hl(0, "@parameter", { fg = white }) -- Function parameters
    -- vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = white }) -- Function parameters

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
    vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = white })    -- TS method calls
    vim.api.nvim_set_hl(0, "@variable.member", { fg = white })        -- TS method calls


    -- Python specific
    vim.api.nvim_set_hl(0, "@method.python", { fg = white })  -- Python methods
    vim.api.nvim_set_hl(0, "@property.python", { fg = grey }) -- Python properties

    -- Ensure consistent bracket and delimiter colors
    vim.api.nvim_set_hl(0, "Delimiter", { fg = white })
    vim.api.nvim_set_hl(0, "MatchParen", { fg = white, bold = true })

    -- UI-related highlights
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = grey })
    vim.api.nvim_set_hl(0, "Border", { fg = grey })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#2C2C2D" })
    vim.api.nvim_set_hl(0, "Search", { bg = "#2C2C2D", fg = warnCoral })

    -- Search highlight and UI integrations (FZF, Telescope, completion)
    vim.api.nvim_set_hl(0, "Search", { bg = "#2C2C2D" })
    vim.api.nvim_set_hl(0, "IncSearch", { bg = "#2C2C2D", fg = warnCoral })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })

    -- FZF specific highlights
    vim.api.nvim_set_hl(0, "fzf_match", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "FzfLuaMatch", { fg = warnCoral })

    -- Autocompletion menu highlights
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "CmpItemKind", { fg = grey })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = grey })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2C2C2D" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = black, fg = white })

    -- Native neovim completion highlights
    vim.api.nvim_set_hl(0, "PmenuMatch", { fg = warnCoral })
    vim.api.nvim_set_hl(0, "PmenuMatchSelected", { fg = warnCoral, bold = true })

    -- Neovim diagnostic highlights
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#d2788c" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#e6be8c" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = mutedTeal })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = evenLightGrey })

    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = white, underline = true }) -- Floating point numbers

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
    vim.api.nvim_set_hl(0, "@tag.builtin", { fg = grey })


    -- For LSP diagnostics
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#e67e7e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#d2a374", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#7ca68c", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#aaaaaa", bg = "NONE" })

    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "#e67e7e", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = "#d2a374", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = "#7ca68c", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#aaaaaa", bg = "NONE" })

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
    vim.api.nvim_set_hl(0, "mkdCodeEnd", { fg = grey })
    vim.api.nvim_set_hl(0, "@comment.documentation", { fg = evenLightGrey })

    -- Blockquotes
    vim.api.nvim_set_hl(0, "@markup.quote.markdown", { fg = silver, italic = true })
    vim.api.nvim_set_hl(0, "@markup.quote.delimiter.markdown", { fg = grey })

    -- Tables
    vim.api.nvim_set_hl(0, "@markup.table.markdown", { fg = grey })
    vim.api.nvim_set_hl(0, "@markup.table.delimiter.markdown", { fg = grey })

    vim.api.nvim_set_hl(0, "@markup.list.checked.markdown", { fg = "#7ca68c", bold = true })


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

    vim.api.nvim_set_hl(0, "@property.json", { fg = white })
    vim.api.nvim_set_hl(0, "restComment", { fg = evenLightGrey })

    vim.api.nvim_set_hl(0, "rustString", { fg = white })
    vim.api.nvim_set_hl(0, "rustStringDelimiter", { fg = grey })
    vim.api.nvim_set_hl(0, "rustString", { fg = grey })

    vim.api.nvim_set_hl(0, "rustCommentLine", { fg = evenLightGrey })



    vim.api.nvim_set_hl(0, "SnacksDim", { fg = evenLightGrey, bg = "none" }) -- Adjust as needed
    -- vim.api.nvim_set_hl(0, "GrugFarResultsPath", { fg = white, bg = evenLightGrey }) -- Adjust as needed
    -- vim.api.nvim_set_hl(0, "GrugFarResultsPath", { fg = white, bg = "none" }) -- Adjust as needed
    vim.api.nvim_set_hl(0, "GrugFarResultsPath", { fg = white, bg = "none", bold = true }) -- Adjust as needed
end

return M

-- // NeogitUnmergedchanges
