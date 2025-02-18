-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

-- Yanky keymaps
set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
set("n", "<c-n>", "<Plug>(YankyNextEntry)")

set("n", "Y", "y$") -- Make Y behave like C or D

set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear highlights on search when pressing <Esc>

set("i", "jj", "<Esc>", { noremap = false }) -- Quickly go into normal mode from insert

set("n", "E", "$") -- Move to the end of the line
set("n", "B", "^") -- Move to the beginning of the line

set("n", "U", "<c-r>") -- Redo
set("n", "==", "gg<S-v>G") -- Select all
set({ "n", "v" }, "D", [["_d]]) -- Delete without remembering

-- Working with files
set("n", "QQ", ":qa<enter>", { noremap = false }) -- Quit all
set("n", "WW", ":w!<enter>", { noremap = false }) -- Quick save

-- Keep window centered when going up/down
set("n", "<C-d>", "<C-d>zz", { noremap = false })
set("n", "<C-u>", "<C-u>zz", { noremap = false })
set("n", "n", "nzzzv", { noremap = false })
set("n", "N", "Nzzzv", { noremap = false })

-- Window management --
set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
set("n", "<leader>se", "<C-w>=", { desc = "Make windows equal size" })
set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Working with buffers
set("n", "tk", ":blast<enter>", { noremap = false })
set("n", "tj", ":bfirst<enter>", { noremap = false })
set("n", "th", ":bprev<enter>", { noremap = false })
set("n", "tl", ":bnext<enter>", { noremap = false })
set("n", "td", ":bdelete<enter>", { noremap = false })
set(
  "n",
  "<leader>r",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word cursor is on in current buffer" }
)

-- Stay in indent mode
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Move block
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Oil
set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
