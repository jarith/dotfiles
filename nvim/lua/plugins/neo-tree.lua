local function with_default_opts(opts)
	local defaultOpts = {
		noremap = true,
		silent = true,
		nowait = true,
	}

	return vim.tbl_extend("force", opts, defaultOpts)
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false, -- neo-tree will lazily load itself
	opts = {
		close_if_last_window = true,
		add_blank_line_at_top = true,
		use_default_mappings = false,
		sources = {
			"filesystem",
			"buffers",
		},
		window = {
			width = 50,
			mappings = {
				["o"] = with_default_opts({ "open" }),
				["P"] = with_default_opts({
					"toggle_preview",
					config = {
						title = "File Preview",
						use_float = true,
						use_image_nvim = false,
					},
				}),
				["R"] = with_default_opts({ "refresh" }),
				["a"] = with_default_opts({
					"add",
					config = {
						show_path = "relative", -- "none", "relative", "absolute"
					},
				}),
				["A"] = with_default_opts({ "add_directory" }),
				["d"] = with_default_opts({ "delete" }),
				["r"] = with_default_opts({ "rename" }),
				["y"] = with_default_opts({ "copy_to_clipboard" }),
				["p"] = with_default_opts({ "paste_from_clipboard" }),
				["<"] = with_default_opts({ "prev_source" }),
				[">"] = with_default_opts({ "next_source" }),
			},
		},
		filesystem = {
			filtered_items = {
				visible = false, -- toggle to true to always show dotfiles etc
				hide_dotfiles = true,
				hide_gitignored = true,
			},
			window = {
				mappings = {
					["/"] = with_default_opts({
						"fuzzy_finder",
						config = {
							title = "Find file",
						},
					}),
					["D"] = with_default_opts({
						"fuzzy_finder_directory",
						config = {
							title = "Find directory",
						},
					}),
				},
			},
		},
		buffers = {
			window = {
				mappings = {
					["gt"] = "navigate_up",
					["gT"] = "navigate_down",
				},
			},
		},
	},
}
