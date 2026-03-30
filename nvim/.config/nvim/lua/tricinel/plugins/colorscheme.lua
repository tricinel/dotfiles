vim.pack.add({
  "https://github.com/rose-pine/neovim",
})

require("rose-pine").setup({
  variant = "main",
  palette = {
    main = {
      pine = "#26abe0"
    }
  },
  highlight_groups = {
    -- Bufferline
    BufferLineFill = { bg = "base" },
    BufferLineBackground = { fg = "muted", bg = "base" },
    BufferLineBufferVisible = { fg = "muted", bg = "surface" },
    BufferLineBufferSelected = { fg = "pine", bg = "surface", bold = true },

    BufferLineIndicatorSelected = { fg = "foam" },
    BufferLineSeparator = { fg = "base", bg = "base" },
    BufferLineSeparatorVisible = { fg = "surface", bg = "surface" },
    BufferLineSeparatorSelected = { fg = "surface", bg = "surface" },

    -- Modified buffers
    BufferLineModified = { fg = "gold" },
    BufferLineModifiedVisible = { fg = "gold" },
    BufferLineModifiedSelected = { fg = "gold", bg = "surface" },

    -- Close/close inactive
    BufferLineCloseButton = { fg = "muted", bg = "base" },
    BufferLineCloseButtonVisible = { fg = "muted", bg = "surface" },
    BufferLineCloseButtonSelected = { fg = "love" },
  },
})

vim.cmd("colorscheme rose-pine")
