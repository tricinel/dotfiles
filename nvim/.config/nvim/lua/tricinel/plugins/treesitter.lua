return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "css",
      "gitignore",
      "http",
      "regex",
      "dockerfile",
    })
  end,
}
