vim.pack.add({
	-- Auto-save/load sessions so you can pick up where you left off
	"https://github.com/folke/persistence.nvim",
})

require("persistence").setup({
	dir = vim.fn.stdpath("state") .. "/sessions/", -- ~/.local/state/nvim/sessions/
	need = 1,
	branch = true,
	options = {
		"buffers", -- Save open buffers
		"curdir", -- Save current directory
		"tabpages", -- Save tab pages
		"winsize", -- Save window sizes
		"help", -- Save help buffers
		"folds", -- Save folds
		"globals", -- Save global variables
	},
})
