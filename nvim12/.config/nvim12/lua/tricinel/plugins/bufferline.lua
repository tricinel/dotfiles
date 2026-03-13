vim.pack.add({
	-- Shows open buffers as tabs at the top of the screen
	"https://github.com/akinsho/bufferline.nvim",
})

require("bufferline").setup({
	options = {
		style_preset = require("bufferline").style_preset.default,

		-- Don't show close buttons on tabs (keep it minimal)
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		show_close_icon = false,
		show_buffer_close_icons = false,

		-- Separator style between buffers
		separator_style = "thin",

		-- Show buffer numbers
		numbers = "none",

		-- Don't show tab indicators
		show_tab_indicators = false,

		-- Enforce regular tabs (not grouped)
		enforce_regular_tabs = false,

		-- Always show bufferline (even with single buffer)
		always_show_bufferline = true,
	},
})

vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
