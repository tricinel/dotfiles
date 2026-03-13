vim.pack.add({
	-- Beautiful list for LSP diagnostics, quickfix, loclist, references
	"https://github.com/folke/trouble.nvim",
})

require("trouble").setup({
	position = "bottom",
	height = 10,
	width = 50,
	icons = true,

	-- Folding support for sections
	fold_open = "▾",
	fold_closed = "▸",

	-- Modes to enable
	modes = {
		-- Show LSP diagnostics
		diagnostics = {
			mode = "diagnostics",
		},

		-- Document symbols
		document_symbols = {
			mode = "document_symbols",
		},
	},

	-- Actions for Trouble window
	actions = {
		-- Open in new split
		open_split = { "<c-s>" },
		open_vsplit = { "<c-v>" },
		open_tab = { "<c-t>" },

		-- Jump to file
		jump = { "<cr>" },
		jump_close = { "<c-cr>" },

		-- Close Trouble window
		close = { "q" },
	},

	-- Filter diagnostics by severity
	filter = {
		-- Show all by default
		action_severity = "WARN",

		-- Custom filter function
		function(items)
			return vim.tbl_filter(function(item)
				return item.severity >= vim.diagnostic.severity.WARN
			end, items)
		end,
	},
})

vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { desc = "Symbols" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble lsp toggle<cr>", { desc = "LSP" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" })
