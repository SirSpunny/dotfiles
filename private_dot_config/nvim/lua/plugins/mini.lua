return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- text editing
		require("mini.ai").setup()
		require("mini.align").setup()
		require("mini.comment").setup()
		require("mini.move").setup()
		require("mini.operators").setup()
		require("mini.pairs").setup()
		require("mini.splitjoin").setup()
		require("mini.surround").setup()
		require("mini.trailspace").setup() -- trailing whitespace handling

		-- general workflow
		require("mini.diff").setup() -- git/buffer diff highlighting
		require("mini.git").setup() -- git integration
		require("mini.sessions").setup() -- enables sessions

		-- appearance
		require("mini.cursorword").setup() -- highlight word under cursor
		require("mini.icons").setup() -- icon provider
		require("mini.map").setup() -- map for the current buffer
		require("mini.statusline").setup() -- styled statusline
		require("mini.tabline").setup() -- open buffers as tabs
	end,
}
