require("config.options")
require("config.keymaps")
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("neo-tree.command").execute({ toggle = false, reveal = true, dir = vim.loop.cwd() })
	end,
})
