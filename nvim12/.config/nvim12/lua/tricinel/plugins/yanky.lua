vim.pack.add({
  -- Maintains a history of yanked text and allows cycling through it
  "https://github.com/gbprod/yanky.nvim",
})

require("yanky").setup({
  highlight = {
    on_put = true,  -- Highlight when putting text
    on_yank = true, -- Highlight when yanking text
    timer = 300,    -- Duration in milliseconds (300ms = 0.3 seconds)
  },

  ring = {
    history_length = 100,
    storage = "shada", -- Store history in Neovim's shada file (persists between sessions)
  },

  preserve_cursor_position = {
    enabled = true,
  },

  system_clipboard = {
    sync_with_ring = true, -- Add system clipboard yanks to history
  },

  picker = {
    -- Default picker window style
    window = {
      layout = "floating",
      width = 0.8,
      height = 0.6,
      border = "rounded",
    },
  },
})

vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "Put yanked text after cursor" })
vim.keymap.set({ "n", "x", }, "P", "<Plug>(YankyPutBefore)", { desc = "Put yanked text before cursor" })
vim.keymap.set({ "n", "x" }, "<leader>sy", "<cmd>YankyRingHistory<cr>", { desc = "Open Yank History" })

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})
