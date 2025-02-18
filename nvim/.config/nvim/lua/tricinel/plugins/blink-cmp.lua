return {
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = "rafamadriz/friendly-snippets",

    version = "*",

    opts = {
      keymap = {
        preset = "default",
        ["<S-CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },

        ["<S-k>"] = { "scroll_documentation_up", "fallback" },
        ["<S-j>"] = { "scroll_documentation_down", "fallback" },

        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      completion = {
        list = {
          selection = {
            preselect = false,
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
