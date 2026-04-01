vim.pack.add({
  -- Provides file type icons for bufferline, oil and other UI elements
  "https://github.com/echasnovski/mini.icons",

  -- Minimal, fast startup dashboard
  "https://github.com/echasnovski/mini.starter",

  -- Visualise indentation
  "https://github.com/nvim-mini/mini.indentscope",

  -- Status line
  "https://github.com/nvim-mini/mini.statusline",
})

require("mini.icons").setup()
require("mini.indentscope").setup()

local statusline = require("mini.statusline")
statusline.setup({
  content = {
    active = function()
      local mode, mode_hl  = statusline.section_mode({ trunc_width = 120 })
      local git            = statusline.section_git({ trunc_width = 75 })
      local diff           = statusline.section_diff({ trunc_width = 75 })
      local diagnostics    = statusline.section_diagnostics({ trunc_width = 75 })
      local fileinfo       = statusline.section_fileinfo({ trunc_width = 120 })
      local search         = statusline.section_searchcount({ trunc_width = 75 })

      local filename       = function()
        if vim.bo.buftype == 'terminal' then
          return '%t'
        else
          return '%t%m%r'
        end
      end

      local location_lines = function()
        return '%l:%L'
      end

      return statusline.combine_groups({
        { hl = mode_hl,                 strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { filename(), git, diff, diagnostics } },
        '%=', -- End left alignment, start right alignment
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl,                  strings = { search, location_lines() } },
      })
    end,
    inactive = nil,
  },
  use_icons = true,
  set_vim_settings = true,
})

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
