-- [[ Setting globals ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

require("keymap") -- keymaps are sourced in ./lua/keymap.lua

-- [[ Setting options ]]
vim.opt.number = true -- Make line numbers default
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.mouse = "a" -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
vim.opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.signcolumn = "yes" -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time (Displays which-key popup soone)r
vim.opt.splitright = true -- Configure how new splits should be opened
vim.opt.splitbelow = true
vim.opt.list = true -- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.hlsearch = true -- Set highlight on search
vim.opt.title = true
vim.opt.titlestring = "nvim [ " .. vim.fn.getcwd() .. " ]"

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
--
vim.api.nvim_create_autocmd("DirChanged", {
	desc = "Update titlestring on buffer change",
	callback = function()
		vim.opt.titlestring = "nvim [ " .. vim.fn.getcwd() .. " ]"
	end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup("plugins")

-- apply colorscheme
vim.cmd.colorscheme("catppuccin")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
