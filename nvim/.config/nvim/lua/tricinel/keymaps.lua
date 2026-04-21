local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlights on search when pressing <Esc>" })

map("n", "<leader>vr", "<cmd>restart<cr>", { desc = "Restart" })

map("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't save current session" })
map("n", "<leader>qq", ":qa<enter>", { noremap = false, desc = "Quit all" })
map({ "i", "x", "n", "s" }, "<C-s>", "<esc>:w!<enter>", { noremap = false, desc = "Quick save" })

-- Center screen when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Navigate buffers
map("n", "<S-DOWN>", ":blast<enter>", { noremap = false })
map("n", "<S-UP>", ":bfirst<enter>", { noremap = false })
map("n", "<S-CR>", "<cmd>e #<cr>", { desc = "Alternate buffer" })
map("n", "<S-x>", "<cmd>bdelete!<cr>", { desc = "Close buffer" })
map(
  "n",
  "<leader>br",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word cursor is on in current buffer" }
)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<leader>uv", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })

  if #bufs <= 1 then
    vim.cmd("vsplit")
  else
    local cur = vim.api.nvim_get_current_buf()

    vim.cmd("vsplit")
    vim.api.nvim_set_current_buf(cur)

    vim.cmd("wincmd h")
    vim.cmd("buffer #")
    vim.cmd("wincmd l")
  end
end, { desc = "Open current buffer in vertical split" })
map("n", "<leader>ux", function()
  local wins = vim.api.nvim_list_wins()
  if #wins < 2 then return end

  local right_win = wins[#wins]

  vim.api.nvim_set_current_win(right_win)
  vim.cmd("close")
end, { desc = "Close the rightmost window" })
map("n", "<C-Left>", ":vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines up/down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

map("n", "<leader>bs", function()
  vim.cmd("so")
end, { desc = "Source current file" })

map("n", "<leader>bc", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end, { desc = "Copy full file-path" })

-- Copy the current line and all diagnostics on that line to system clipboard
map("n", "yd", function()
  local pos = vim.api.nvim_win_get_cursor(0)
  local line_num = pos[1] - 1 -- 0-indexed
  local line_text = vim.api.nvim_buf_get_lines(0, line_num, line_num + 1, false)[1]
  local diagnostics = vim.diagnostic.get(0, { lnum = line_num })
  if #diagnostics == 0 then
    vim.notify("No diagnostic found on this line", vim.log.levels.WARN)
    return
  end
  local message_lines = {}
  for _, d in ipairs(diagnostics) do
    for msg_line in d.message:gmatch("[^\n]+") do
      table.insert(message_lines, msg_line)
    end
  end
  local formatted = {}
  table.insert(formatted, "Line:\n" .. line_text .. "\n")
  table.insert(formatted, "Diagnostic on that line:\n" .. table.concat(message_lines, "\n"))
  vim.fn.setreg("+", table.concat(formatted, "\n\n"))
  vim.notify("Line and diagnostic copied to clipboard", vim.log.levels.INFO)
end, { desc = "[P]Yank line and diagnostic to system clipboard" })

-- Toggle LSP diagnostics floating window
map("n", "<leader>xw", function()
  -- Set the buffer-local suppression flag
  vim.b.diagnostics_suppressed = true

  -- Immediately close any existing floating windows
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, true)
    end
  end

  -- Create a one-time autocmd to re-enable when the cursor moves
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    buffer = 0,
    once = true, -- Delete this autocmd after it runs once
    callback = function()
      vim.b.diagnostics_suppressed = false
    end,
  })
end, { desc = "Hide diagnostic float until cursor moves" })

-- These may be opinionated, but I don't want to always cut
-- Smarter dd
vim.keymap.set("n", "dd", function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end, { expr = true, desc = "Don't yank empty lines" })

-- Change without yanking
vim.keymap.set({ "n", "v" }, "c", '"_c', { desc = "Change without yanking" })
vim.keymap.set({ "n", "v" }, "C", '"_C', { desc = "Change line without yanking" })
vim.keymap.set("n", "cc", '"_cc', { desc = "Change line without yanking" })
vim.keymap.set({ "n", "v" }, "s", '"_s', { desc = "Substitute without yanking" })

-- Searching
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Vim pack
map("n", "<leader>vu", "<cmd>lua vim.pack.update()<CR>", { desc = "Update plugins" })

local function pack_clean()
  local all_installed = vim.pack.get()
  local inactive = {}

  for _, plugin in ipairs(all_installed) do
    if not plugin.active then
      table.insert(inactive, plugin.spec.name)
    end
  end

  if #inactive == 0 then
    print("Everything is tidy! No unused plugins found.")
    return
  end

  local msg = "Delete these unused plugins from disk?\n• " .. table.concat(inactive, "\n• ")
  local choice = vim.fn.confirm(msg, "&Yes\n&No", 2)
  if choice == 1 then
    vim.pack.del(inactive)
    print("Cleanup complete.")
  end
end

map("n", "<leader>vc", pack_clean, { desc = "Pack Clean: Delete unused plugins" })

-- Floating terminal
local function open_floating_terminal()
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)

  local opts = {
    relative = 'editor',
    row = row,
    col = col,
    width = width,
    height = height,
    style = 'minimal',
    border = 'rounded'
  }

  vim.api.nvim_open_win(buf, true, opts)
  vim.cmd('terminal')
  vim.cmd('startinsert')
end

map("n", "<leader>vt", open_floating_terminal, { desc = "Floating terminal" })
map("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
