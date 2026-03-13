vim.pack.add({
  -- Displays a popup with available keybindings as you type
  "https://github.com/folke/which-key.nvim",
})

local whichKey = require("which-key")

whichKey.setup({
  preset = "helix",

  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,

  triggers = {
    { "<auto>", mode = "nxso" }, -- Enable for normal, visual, select, operator-pending
  },

  icons = {
    breadcrumb = "»", -- Symbol used in the command line area
    separator = "➜", -- Symbol used between a key and its description
    group = "+", -- Symbol prepended to a group
  },

  win = {
    border = "rounded",
    padding = { 1, 2 },
  },
})

vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Keymaps (which-key)" })

-- Some groups for easy visual reference
whichKey.add({
  { "<leader>b", group = "Buffer" },
  { "<leader>c", group = "Code" },
  { "<leader>s", group = "Search" },
  { "<leader>g", group = "git" },
  { "<leader>v", group = "vim", icon = "󰙨" },
  { "<leader>u", group = "UI" },
  { "<leader>x", group = "Trouble", icon = "󰂭" },
  { "<leader>f", group = "Files" }
})
