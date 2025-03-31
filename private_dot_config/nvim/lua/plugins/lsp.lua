return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local masonlspconfig = require("mason-lspconfig")

		mason.setup()
		masonlspconfig.setup({
			ensure_installed = {
				"biome",
				"bashls",
				"gopls",
				"nginx_language_server",
				"nil_ls",
				"lua_ls",
				"superhtml",
				"twiggy_language_server",
				"yamlls",
			},
			automatic_installation = true,
		})
	end,
}
