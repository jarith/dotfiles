return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "jose-elias-alvarez/typescript.nvim" },
	},
	opts = {
		servers = {
			ts_ls = {},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, server_opts in pairs(opts.servers) do
			lspconfig[server].setup(server_opts)
		end
	end,
}
