return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"typescript",
			"tsx",
			"javascript",
			"html",
			"css",
			"lua",
			"json",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
}
