vim.pack.add({
	{ src = "https://github.com/folke/twilight.nvim" },
})

vim.keymap.set("n", "<leader>uf", function()
	local twilight = require("twilight")
	twilight.toggle()

	local is_active = require("twilight.view").enabled
	local msg = is_active and "Twilight enabled" or "Twilight disabled"
	vim.notify(msg, vim.log.levels.INFO, { title = "Twilight" })
end, { desc = "Toggle Twilight" })
