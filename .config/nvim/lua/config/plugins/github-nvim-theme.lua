local M = {
  'projekt0n/github-nvim-theme',
  lazy = false,
}

function M.config()
  require('github-theme').setup({})
end

return M
