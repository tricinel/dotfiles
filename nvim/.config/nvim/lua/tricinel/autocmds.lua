-- -- Remove unused imports on save
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   group = vim.api.nvim_create_augroup("ts_imports", { clear = true }),
--   pattern = { "*.tsx,*.ts" },
--   callback = function()
--     vim.lsp.buf.code_action({
--       apply = true,
--       context = {
--         only = { "source.organizeImports" },
--         diagnostics = {},
--       },
--     })
--   end,
-- })

-- Spellcheck in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("spellcheck", { clear = true }),
  pattern = { "text", "plaintex", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Close filetypes with <esc>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_esc", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "grug-far",
    "help",
    "lspinfo",
    "notify",
    "spectre_panel",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "Lazy",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "<esc>", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- Show LSP diagnostics in a hover window
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      border = "rounded",
      close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinScrolled" },
    })
  end,
})
