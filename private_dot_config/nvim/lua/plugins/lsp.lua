return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
	},

	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")

		mason.setup()

		lspconfig.biome.setup({})
		lspconfig.bashls.setup({})
		lspconfig.gopls.setup({})
		lspconfig.nginx_language_server.setup({})
		lspconfig.nil_ls.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.superhtml.setup({})
		lspconfig.twiggy_language_server.setup({})
		lspconfig.yamlls.setup({})
	end,
}
