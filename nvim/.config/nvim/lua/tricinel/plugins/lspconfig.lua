return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      biome = {
        settings = {
          biome = {
            formatting = {
              enabled = true,
            },
          },
        },
      },
      cssls = {
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      },
    },
  },
}
