-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

-- Yanky keymaps
set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
set("n", "<c-n>", "<Plug>(YankyNextEntry)")
set("n", "Y", "y$", { desc = "Yank to end of line" })

set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear highlights on search when pressing <Esc>

set("i", "jj", "<Esc>", { noremap = false }) -- Quickly go into normal mode from insert
set("i", "kk", "<Esc>", { noremap = false }) -- Quickly go into normal mode from insert

set("n", "E", "$") -- Move to the end of the line
set("n", "B", "^") -- Move to the beginning of the line

set("n", "U", "<c-r>") -- Redo

-- Working with files
set("n", "QQ", ":qa<enter>", { noremap = false }) -- Quit all
set({ "n", "i" }, "WW", "<esc>:w!<enter>", { noremap = false }) -- Quick save

-- Window management --
set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
set("n", "<leader>se", "<C-w>=", { desc = "Make windows equal size" })
set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Working with buffers
set("n", "<S-DOWN>", ":blast<enter>", { noremap = false })
set("n", "<S-UP>", ":bfirst<enter>", { noremap = false })
set("n", "<S-BACKSPACE>", ":bdelete<enter>", { noremap = false })
set("n", "<S-CR>", "<cmd>e #<cr>", { desc = "Alternate buffer" })
set(
  "n",
  "<leader>r",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word cursor is on in current buffer" }
)

-- Stay in indent mode
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Oil
set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Twilight
set("n", "<leader>ut", function()
  vim.cmd("Twilight")
end, { desc = "Toggle Twilight" })

-- Source file
set("n", "<leader>%", function()
  vim.cmd("so")
end, { desc = "Source current file" })
