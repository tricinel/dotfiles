local function confirm_and_delete_buffer()
  local confirm = vim.fn.confirm("Delete file and buffer?", "&Yes\n&No", 2)

  if confirm == 1 then
    os.remove(vim.fn.expand("%"))
    vim.api.nvim_buf_delete(0, { force = true })
  end
end

vim.keymap.set("n", "<leader>fD", function()
  confirm_and_delete_buffer()
end, { desc = "Delete current file" })
