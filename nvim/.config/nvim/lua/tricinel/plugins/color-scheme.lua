return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      local bg = "#09110b"
      local bg_dark = "#1b2631"
      local fg = "#ced9e4"
      local accent = "#35e3c1"
      local cursor = "#292e42"
      local green = "#35e3c1"
      local blue = "#36a2d0"
      local magenta = "#bb9af7"

      require("tokyonight").setup({
        style = "night",
        transparent = false,
        styles = {
          sidebars = "dark",
          floats = "dark",
        },
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = bg_dark
          colors.fg = fg
          colors.bg_float = bg
          colors.bg_search = accent
          colors.bg_statusline = bg
          colors.bg_popup = bg
          colors.bg_visual = bg_dark
          colors.green = green
          colors.blue = blue
        end,
        on_highlights = function(highlights)
          highlights.CursorLine.bg = cursor
          highlights.IncSearch = {
            bg = accent,
            fg = bg,
          }
          highlights.Search = {
            bg = accent,
            fg = bg,
          }
          highlights.FlashLabel = {
            bg = magenta,
            bold = true,
            fg = bg,
          }
        end,
      })

      vim.cmd("colorscheme tokyonight")
    end,
  },
}
