return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
    },
    filesystem = {
      filtered_items = {
        visible = true,
        never_show = { ".git" },
      },
    },
  },
}
