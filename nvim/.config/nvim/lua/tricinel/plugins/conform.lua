return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function()
    local formatters = { "biome", "prettierd", "prettier", stop_after_first = true }
    local opts = {
      formatters_by_ft = {
        javascript = formatters,
        typescript = formatters,
        javascriptreact = formatters,
        typescriptreact = formatters,
        css = formatters,
        html = formatters,
        json = formatters,
        yaml = formatters,
        markdown = formatters,
        lua = { "stylua" },
        sh = { "shfmt" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        biome = {
          require_cwd = true,
        },
      },
    }
    return opts
  end,
}
