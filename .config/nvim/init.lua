vim.g.mapleader = " "

vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.autoindent = true

require('plugins')
require('lsp')
require('treesitter')
require('setup_other_plugins')
require('formatter')
require('telescope_')
require('disable_builtins')
