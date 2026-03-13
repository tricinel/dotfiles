local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    local line = mark[1]
    local ft = vim.bo.filetype
    if
        line > 0
        and line <= lcount
        and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
        and not vim.o.diff
    then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    vim.keymap.set("n", "<Esc>", function()
      -- Close all floating windows in the current tab
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= "" then
          vim.api.nvim_win_close(win, false)
        end
      end
      vim.cmd("nohlsearch") -- Clear search highlights
    end, opts)
  end,
})

-- Show LSP diagnostics in a hover window
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = augroup,
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      border = "rounded",
      close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinScrolled" },
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "markdown",
  callback = function()
    vim.treesitter.start()
  end,
})
