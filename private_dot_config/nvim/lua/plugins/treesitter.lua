return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"go",
			"html",
			"markdown",
			"markdown_inline",
			"javascript",
			"typescript",
			"json",
			"lua",
			"vim",
			"vimdoc",
			"vue",
			"yaml",
			"toml",
		},
		autotag = { enable = true },
		context = { enable = true },
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldenable = false
	end,
}
