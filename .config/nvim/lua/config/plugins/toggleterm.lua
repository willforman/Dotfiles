local M = {
  'akinsho/nvim-toggleterm.lua',
}

function M.config()
  require('toggleterm').setup({
    open_mapping = [[<leader>t]],
    insert_mappings = false,
    direction = 'horizontal',
  })
end

function M.init()
  local Terminal  = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    dir = "git_dir",
    direction = "float"
  })

  local function lazygit_toggle()
    lazygit:toggle()
  end

  vim.keymap.set('n', 'g', lazygit_toggle)
end


return M
