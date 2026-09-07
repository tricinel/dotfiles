vim.pack.add({
  -- Reposition the cmdline as a centered floating window
  "https://github.com/rachartier/tiny-cmdline.nvim",
})

require("tiny-cmdline").setup({
  width = {
    value = "60%",
    min = 40,
    max = 80,
  },
  title = {
    enabled = false,
  },
})
