vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim"
})

require('gitsigns').setup({
  signcolumn = true,
  signs = {
    add          = { text = "+" },
    change       = { text = "~" },
    delete       = { text = "_" },
    topdelete    = { text = "‾" },
    changedelete = { text = "~" },
  },
})

vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame line" })
vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns blame<cr>", { desc = "Blame" })
vim.keymap.set("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle current line blame" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "Show diff" })
