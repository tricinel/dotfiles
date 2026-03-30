vim.pack.add({
  -- Provides file type icons for bufferline, oil and other UI elements
  "https://github.com/echasnovski/mini.icons",

  -- Minimal, fast startup dashboard
  "https://github.com/echasnovski/mini.starter",

  -- Visualise indentation
  "https://github.com/nvim-mini/mini.indentscope",
})

require("mini.icons").setup()
require("mini.indentscope").setup()

require("mini.starter").setup({
  header = "Let's make some cool shit",
  footer = "",
  items = {
    -- Open Oil file explorer
    {
      action = "Oil --float",
      name = "-  Explore",
      section = "Actions",
    },
    -- Load last session action (press 's')
    {
      action = "lua require('persistence').load()",
      name = "s  Load session",
      section = "Actions",
    },

    -- Find file action (press 'f')
    {
      action = "FzfLua files",
      name = "f  Find file",
      section = "Actions",
    },

    -- Recent files action (press 'r')
    {
      action = "FzfLua oldfiles",
      name = "r  Recent files",
      section = "Actions",
    },

    -- Find text action (press 't')
    {
      action = "FzfLua live_grep",
      name = "t  Find text",
      section = "Actions",
    },

    -- Config file action (press 'c')
    {
      action = "edit $MYVIMRC",
      name = "c  Config",
      section = "Actions",
    },

    -- Quit action (press 'q')
    {
      action = "quitall",
      name = "q  Quit",
      section = "Actions",
    },
  },
})
