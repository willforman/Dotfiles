local M = {
  'folke/trouble.nvim',
  cmd = { 'TroubleToggle', 'Trouble' }
}

function M.config()
  local trouble = require('trouble')
  trouble.setup({

  })
end

function M.init()
  vim.keymap.set('n', '<leader>e', '<cmd>TroubleToggle<cr>', { desc = 'Toggle Errors' })
end

return M
