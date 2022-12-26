local M = {
  'folke/trouble.nvim',
  cmd = { 'TroubleToggle', 'Trouble' }
}

function M.config()
  local trouble = require('trouble')
  trouble.setup({

  })
end

return M
