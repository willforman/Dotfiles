vim.g.mapleader = " "

vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.autoindent = true

require('init')
require('plugins_init')
require('plugins_config')
require('lsp')
require('theme')
require('treesitter')
require('formatter')
require('autopairs')
require('comments')
require('files')
require('disable_builtins')
