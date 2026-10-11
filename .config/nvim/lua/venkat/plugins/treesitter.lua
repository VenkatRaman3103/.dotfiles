return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  event = { "BufReadPost", "BufNewFile" },

  config = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")

    if not ok then
      -- vim.notify("Treesitter not installed!", vim.log.levels.ERROR)
      return
    end

    ts.setup {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "c",
        "cpp",
        "python",
        "c_sharp",
        "rust",
      },
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = { "lua" },
      },
    }
  end
}
