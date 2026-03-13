vim.pack.add({
	-- Handles autocompletion menus with LSP integration (single plugin, no dependencies)
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})
require("blink.cmp").setup({
	-- Keymap preset: use tab/shift-tab for completion navigation
	keymap = { preset = "super-tab" },

	-- Appearance settings
	appearance = {
		-- Use mono-style nerd font icons
		nerd_font_variant = "mono",
	},

	-- Completion menu behavior
	completion = {
		-- Show documentation automatically when hovering over completion item
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
	},

	-- Configure completion sources (where suggestions come from)
	sources = {
		-- Use these sources in this priority order
		default = { "lsp", "path", "snippets", "buffer" },
	},

	-- Signature help (shows function parameters as you type)
	signature = { enabled = true },
})
