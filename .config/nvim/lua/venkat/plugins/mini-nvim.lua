return {
    {

        "echasnovski/mini.nvim",
        version = "*",
        config = function()
            -- require("mini.ai").setup() -- Enhanced text objects
            -- require("mini.align").setup() -- Alignment of text blocks
            -- require("mini.animate").setup() -- Smooth animations
            -- require("mini.bracketed").setup() -- Jump between brackets
            -- require("mini.bufremove").setup() -- Buffer deletion without messing layout
            -- require("mini.clue").setup() -- Keybinding hints
            -- require("mini.comment").setup() -- Commenting
            -- require("mini.completion").setup() -- Lightweight completion
            -- require("mini.cursorword").setup() -- Highlight word under cursor
            -- require("mini.diff").setup() -- Enhanced diffing
            -- require("mini.files").setup() -- File explorer
            -- require("mini.fuzzy").setup() -- Fuzzy matching
            -- require("mini.hipatterns").setup() -- Highlight patterns
            -- require("mini.indentscope").setup() -- Indentation guide
            -- require("mini.jump").setup() -- Quick jumps
            -- require("mini.jump2d").setup() -- Jump around visible text
            -- require("mini.map").setup() -- Scrollbar minimap
            -- require("mini.move").setup() -- Move text
            -- require("mini.operators").setup() -- Custom operators
            -- require("mini.pairs").setup() -- Auto pairs
            -- require("mini.pick").setup() -- Fuzzy picker
            -- require("mini.sessions").setup() -- Session management
            -- require("mini.splitjoin").setup() -- Toggle single/multiline statements
            -- require("mini.starter").setup() -- Startup screen
            -- require("mini.statusline").setup() -- Minimalist statusline
            -- require("mini.surround").setup() -- Surround text objects
            -- require("mini.tabline").setup() -- Minimalist tabline
            -- require("mini.test").setup() -- Test framework
            -- require("mini.trailspace").setup() -- Remove trailing spaces

            vim.keymap.set("n", "<leader>mo", function()
                require("mini.files").open()
            end, { desc = "Open Mini Files" })
        end,
    },
}
