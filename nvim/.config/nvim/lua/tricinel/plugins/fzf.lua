vim.pack.add({
  -- Fast file, text and buffer searching
  "https://github.com/ibhagwan/fzf-lua",
})

require("fzf-lua").setup({
  "default",
})

-- vim.ui.select
require('fzf-lua').register_ui_select()

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua git_files<cr>", { desc = "Git files" })
vim.keymap.set("n", "<leader>ss", "<cmd>FzfLua live_grep<cr>", { desc = "Text" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", { desc = "Open buffers" })
vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua history<cr>", { desc = "Recent/open files" })
vim.keymap.set("n", "<leader>sh", "<cmd>FzfLua search_history<cr>", { desc = "Search history" })
vim.keymap.set("n", "<leader>fm", "<cmd>FzfLua marks<cr>", { desc = "Marks" })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua live_grep resume=true<cr>", { desc = "Resume previous search" })
vim.keymap.set("n", "<leader>sk", "<cmd>FzfLua keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Document symbols" })
vim.keymap.set("n", "<leader>lc", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "Code actions" })
vim.keymap.set("n", "<leader>lx", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>lX", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Workspace diagnostics" })

-- Search all lines that contain TODO or FIX or FIXME followed by the search query
local function search_todos()
  require('fzf-lua').fzf_exec([[rg --column --line-number --no-heading --color=always --smart-case "TODO|FIXME|FIX"]], {
    prompt = 'TODO|FIXME|FIX> ',
    fn_transform = function(x) return x end,
    previewer = "builtin",
  })
end

vim.keymap.set('n', '<leader>ft', search_todos, { desc = "TODO/FIXME/FIX" })

-- Search through the recent notifications
local function search_messages()
  -- Capture the output of the :messages command
  local messages = vim.api.nvim_exec2("messages", { output = true }).output
  -- Convert the string into a list of lines
  local lines = {}
  for line in messages:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end

  -- Reverse the list so the most recent messages appear first in fzf
  local reversed = {}
  for i = #lines, 1, -1 do
    table.insert(reversed, lines[i])
  end

  -- Send to fzf-lua
  require('fzf-lua').fzf_exec(reversed, {
    prompt = 'Notifications> ',
    winopts = { title = ' Message History ' },
    actions = {
      ['default'] = function(selected)
        vim.fn.setreg('+', selected[1])
        print("Copied to clipboard: " .. selected[1])
      end
    }
  })
end

vim.keymap.set("n", "<leader>sn", search_messages, { desc = "Message history" })
