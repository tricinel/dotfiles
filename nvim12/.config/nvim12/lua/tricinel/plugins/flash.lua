vim.pack.add({
	-- Better than f/F/t/T motions, jump anywhere instantly
	"https://github.com/folke/flash.nvim",
})

require("flash").setup({
	search = {
		mode = "exact", -- Integrate with / and ? search
		multi_window = true, -- Search across all visible windows
	},
	labels = "abcdefghijklmnopqrstuvwxyz", -- Which characters to use for labels
	char = {
		enabled = true, -- Enable enhanced f/F/t/T
		jump_labels = true, -- Show labels on all matches
	},
	treesitter = {
		enabled = true, -- Enable treesitter jump mode
		jump = { -- Treesitter jump config
			pos = "start", -- Jump to start of node
		},
	},

	remote = {
		enabled = true,
	},
})

vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end)
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end)
