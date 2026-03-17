vim.pack.add({
  "https://github.com/MagicDuck/grug-far.nvim",
})

require("grug-far").setup()

vim.keymap.set({ "n", "x" }, "<leader>sr", "<cmd>GrugFar<cr>", { desc = "Search & Replace (Project)" })
