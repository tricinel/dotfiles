return {
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = "rafamadriz/friendly-snippets",

    version = "*",

    opts = {
      keymap = { preset = "enter" },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      completion = {
        list = {
          selection = {
            preselect = true,
          },
        },
        trigger = {
          show_in_snippet = false,
        },
      },

      snippets = {
        preset = "luasnip",
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer", "markdown" },
        providers = {
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { "lsp" },
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
