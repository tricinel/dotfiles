vim.pack.add({
	-- Handles running formatters like Biome, Prettier, gofmt
	"https://github.com/stevearc/conform.nvim",
})

local formatters = { "biome", "prettierd", "prettier", stop_after_first = true }

require("conform").setup({
	formatters_by_ft = {
		javascript = formatters,
		typescript = formatters,
		javascriptreact = formatters,
		typescriptreact = formatters,
		html = formatters,
		css = formatters,
		go = { "goimports", "gofmt" },
		lua = { "stylua" },
	},

	formatters = {
		-- Biome: only run if biome.json exists in project root
		biome = {
			require_cwd = true,
		},

		-- Prettier: only run if prettier config exists in project root
		prettier = {
			require_cwd = true,
		},
	},

	format_on_save = function(bufnr)
		-- Disable if global or buffer-local flag is set
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end

		local bufname = vim.api.nvim_buf_get_name(bufnr)

		if bufname:match("/node_modules/") then
			return
		end

		return {
			timeout_ms = 500,
			lsp_format = "fallback", -- Use LSP formatting if no formatter configured
		}
	end,
})

-- Avoid conflicts with Prettier
vim.g.lazyvim_prettier_needs_config = true

-- Keymaps
vim.keymap.set("n", "<leader>cF", function()
	vim.b.disable_autoformat = not vim.b.disable_autoformat
	if vim.b.disable_autoformat then
		vim.notify("Autoformat disabled for this buffer", vim.log.levels.INFO, { title = "Conform" })
	else
		vim.notify("Autoformat enabled for this buffer", vim.log.levels.INFO, { title = "Conform" })
	end
end, { desc = "Toggle formatting" })

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, { desc = "Format" })
