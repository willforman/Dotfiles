require('github-theme').setup { }

require('lualine').setup {
  options = {
    theme = 'auto'
  }
}

require('gitsigns').setup {}

require('alpha').setup( require'alpha.themes.startify'.config)
