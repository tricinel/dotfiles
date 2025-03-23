return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function()
      local opts = {
        formatters_by_ft = {
          javascript = { "biome" },
          typescript = { "biome" },
          javascriptreact = { "biome" },
          typescriptreact = { "biome" },
          css = { "biome" },
          html = { "biome" },
          json = { "biome" },
          yaml = { "biome" },
          markdown = { "biome" },
          lua = { "stylua" },
          sh = { "shfmt" },
        },
        formatters = {
          injected = { options = { ignore_errors = true } },
          biome = {
            condition = function(ctx)
              return vim.fs.find({ " biome.json" }, { path = ctx.filename, upward = true })[1]
            end,
          },
        },
      }
      return opts
    end,
  },
}
