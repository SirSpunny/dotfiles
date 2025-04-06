return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local masonlsp = require("mason-lspconfig")

		mason.setup({})
		masonlsp.setup({
			ensure_installed = {
				"biome",
				"lua_ls",
				"gopls",
				"nil_ls",
				"bashls",
			},
		})

		lspconfig.biome.setup({})
		lspconfig.gopls.setup({})
		lspconfig.nil_ls.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.bashls.setup({})
	end,
}
