local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate' }

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

  if packer_bootstrap then
    require('packer').sync()
  end

end)
