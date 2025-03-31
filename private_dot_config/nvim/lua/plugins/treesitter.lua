return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"go",
				"html",
				"markdown",
				"markdown_inline",
				"javascript",
				"lua",
				"vim",
				"vimdoc",
				"yaml",
				"toml",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
