vim.pack.add({
  -- Shows useful info at the bottom (mode, file, position, LSP status)
  "https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
  options = {
    theme = "rose-pine",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    icons_enabled = true,
    always_divide_middle = true,
  },

  sections = {
    -- Left side
    lualine_a = { "mode" },                          -- Current mode (NORMAL, INSERT, etc.)
    lualine_b = { "branch", "diff", "diagnostics" }, -- Git branch, diff, LSP diagnostics
    lualine_c = { "filename" },                      -- File name

    -- Right side
    lualine_x = { "encoding", "fileformat", "filetype" }, -- File encoding, format, type
    lualine_y = { "progress" },                           -- Percentage through file
    lualine_z = { "location" },                           -- Line:column position
  },
})
