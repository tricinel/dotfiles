-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local vkm = vim.keymap

-- Yanky keymaps
vkm.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vkm.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vkm.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vkm.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vkm.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vkm.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

vkm.set("n", "Y", "y$") -- Make Y behave like C or D

-- Clear highlights on search when pressing <Esc> in normal mode
vkm.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Disable arrow keys in normal mode``
vkm.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vkm.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vkm.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vkm.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vkm.set("i", "jj", "<Esc>", { noremap = false })

vkm.set("n", "E", "$") -- Move to the end of the line
vkm.set("n", "B", "^") -- Move to the beginning of the line

vkm.set("n", "U", "<c-r>") -- Redo
vkm.set("n", "==", "gg<S-v>G") -- Select all

-- Working with files
vkm.set("n", "QQ", ":qa<enter>", { noremap = false })
vkm.set("n", "WW", ":w!<enter>", { noremap = false })

-- Keep window centered when going up/down
vkm.set("n", "<C-d>", "<C-d>zz", { noremap = false })
vkm.set("n", "<C-u>", "<C-u>zz", { noremap = false })
vkm.set("n", "n", "nzzzv", { noremap = false })
vkm.set("n", "N", "Nzzzv", { noremap = false })

-- Window management --
vkm.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vkm.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vkm.set("n", "<leader>se", "<C-w>=", { desc = "Make windows equal size" })
vkm.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Working with buffers
vkm.set("n", "tk", ":blast<enter>", { noremap = false })
vkm.set("n", "tj", ":bfirst<enter>", { noremap = false })
vkm.set("n", "th", ":bprev<enter>", { noremap = false })
vkm.set("n", "tl", ":bnext<enter>", { noremap = false })
vkm.set("n", "td", ":bdelete<enter>", { noremap = false })

-- Visual mode

-- Stay in indent mode
vkm.set("v", "<", "<gv")
vkm.set("v", ">", ">gv")

-- Move block
vkm.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
vkm.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Oil
vkm.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
