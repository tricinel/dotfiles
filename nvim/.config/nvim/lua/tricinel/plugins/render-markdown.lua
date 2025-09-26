return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
  opts = {
    code = {
      enabled = true,
      sign = false,
      width = "block",
      right_pad = 1,
    },
    heading = {
      enabled = true,
      sign = false,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    checkbox = {
      enabled = true,
    },
  },
}
