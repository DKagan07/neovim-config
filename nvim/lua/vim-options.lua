-- Make it a 4 space indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.breakindent = true

vim.opt.signcolumn = "yes"

vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Easy moving around windows/buffers
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")


-- This is for making the vim background clear if you want
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.opt.colorcolumn = "80"

-- Make it such that 10 lines are always showing at bottom
vim.opt.scrolloff = 10

-- Fat cursor
vim.opt.guicursor = ""


-- Make line numbers default
vim.wo.number = true
vim.wo.rnu = true

-- Highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Other keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)


-- List diagnostics
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [L]ist [D]iagnostics" })

-- Terminal stuffs
-- local nvterm = require("nvterm.terminal")
-- vim.keymap.set("n", "<leader>v", function() nvterm.new "vertical" end)
-- vim.keymap.set("n", "<leader>h", function() nvterm.new "horizontal" end)
-- vim.keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N", true, true, true))
