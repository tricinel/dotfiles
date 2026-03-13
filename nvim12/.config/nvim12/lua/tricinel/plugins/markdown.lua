vim.pack.add({
	-- Viewing markdown files
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
})
