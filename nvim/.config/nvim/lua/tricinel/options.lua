-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.winbar = "%=%m %f"
opt.scrolloff = 999 -- Lines of context
opt.guicursor = ""

-- Don't put new windows below current
opt.splitbelow = false

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false

-- Avoid conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = true
