vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	vim.api.nvim_create_autocmd("VimEnter", {
		pattern = "*",
		callback = function()
			if vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
				vim.cmd("Explore")
			end
		end,
	}),
}

require("vim-options")
require("lazy").setup("plugins")
