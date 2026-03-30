vim.pack.add({
  -- Edit your filesystem like a buffer
  "https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
  default_file_explorer = true,
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  -- Show hidden files (dotfiles like .gitignore, .env)
  view_options = {
    show_hidden = true,
    natural_order = true,
    is_always_hidden = function(name, _)
      local hidden_files = { "..", ".git", ".DS_Store", ".Trashes", ".Trash" }
      for _, hidden in ipairs(hidden_files) do
        if name == hidden then
          return true
        end
      end
      return false
    end,
  },
  float = {
    padding = 2,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
  keymaps = {
    ["q"] = { "actions.close", mode = "n" },
    ["<C-s>"] = false,
  },
  use_default_keymaps = true,
})

vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open parent directory" })
