return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		spec = {
			{ "<leader>s", group = "search" },
			{ "<leader>g", group = "git" },
			{ "<leader>t", group = "terminal" },
		},
		icons = {
			separator = " ",
		},
	},
}
