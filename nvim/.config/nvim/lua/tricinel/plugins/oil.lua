function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require("oil").get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

function _G.contains(list, value)
  for _, v in ipairs(list) do
    if v == value then
      return true
    end
  end
  return false
end

return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          local hidden_files = { "..", ".git", ".DS_Store", ".Trashes", ".Trash" }
          return contains(hidden_files, name)
        end,
      },
      win_options = {
        winbar = "%!v:lua.get_oil_winbar()",
        wrap = true,
        signcolumn = "no",
      },
      float = {
        padding = 2,
        max_width = 0.4,
        max_height = 0.6,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
      },
    })
  end,
}
