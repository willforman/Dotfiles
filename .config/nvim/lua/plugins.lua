local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
  'kyazdani42/nvim-web-devicons',

  { 'nvim-treesitter/nvim-treesitter', build=':TSUpdate' },

  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim', } },
  { 'nvim-telescope/telescope-file-browser.nvim', dependencies = { 'nvim-telescope/telescope.nvim', } },

  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' } },

  'neovim/nvim-lspconfig',

  'projekt0n/github-nvim-theme',

  'jose-elias-alvarez/null-ls.nvim',

  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  'tpope/vim-fugitive',

  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',

  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',

  'numToStr/Comment.nvim',

  { 'ellisonleao/glow.nvim', cmd = { 'Glow' } },

  { 'goolord/alpha-nvim', dependencies = { 'kyazdani42/nvim-web-devicons' } },

  { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } },
})
