vim.pack.add({
	-- Provides accurate, AST-based syntax highlighting and code understanding
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").setup({
	-- Auto-install parsers for these languages when opening files
	ensure_installed = {
		"typescript",
		"tsx",
		"javascript",
		"html",
		"css",
		"go",
		"lua",
		"dockerfile",
		"json5",
	},

	-- Install parsers synchronously (block until installed)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- Enable Treesitter-based syntax highlighting
	highlight = {
		enable = true,
		-- Set this to true if you depend on 'syntax' being enabled
		-- Using this option may slow down your editor, and you may see some duplicate highlights
		additional_vim_regex_highlighting = false,
	},

	-- Enable Treesitter-based indentation
	indent = {
		enable = true,
	},
})
