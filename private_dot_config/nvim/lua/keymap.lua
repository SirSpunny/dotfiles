-- normal ode
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "[w]rite buffer" })
vim.keymap.set("n", "<leader>wq", ":w<CR>:q!<CR>", { desc = "[w]rite buffer" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {desc = "Unset highlighted search with ESC in normal mode"})
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "[g]o to diagnostic [e]rror messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "[g]o to diagnostic [q]uickfix list" })
-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })


