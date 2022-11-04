local packer = require('packer')

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-treesitter/nvim-treesitter'

  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim', requires = 'nvim-telescope/telescope.nvim' }

  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

  use 'neovim/nvim-lspconfig'

  use 'projekt0n/github-nvim-theme'

  use 'jose-elias-alvarez/null-ls.nvim'

  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'numToStr/Comment.nvim'

  use 'tpope/vim-fugitive'

  use { 'ellisonleao/glow.nvim', cmd = { 'Glow' } }

  use { 'goolord/alpha-nvim', requires = 'kyazdani42/nvim-web-devicons' }

  use { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } }

end)
