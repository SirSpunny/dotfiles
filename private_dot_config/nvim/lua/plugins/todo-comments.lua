return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function()
		local todocomments = require("todo-comments")
		vim.keymap.set("n", "]t", function()
			todocomments.jump_next()
		end, { desc = "Next todo comment" })

		vim.keymap.set("n", "[t", function()
			todocomments.jump_prev()
		end, { desc = "Previous todo comment" })
	end,
}
