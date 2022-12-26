local string_utils = require('utils.string')

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
  local cmd = 'lazygit'
  -- local in_config = vim.loop.cwd == vim.call('expand', '~/.config')
  local in_config_dir = string_utils.starts_with(vim.loop.cwd(), vim.call('expand', '~/.config'))
  if in_config_dir then
    cmd = cmd ..
      ' --use-config-file ~/.config/yadm/lazygit.yml' ..
      ' --git-dir ~/.local/share/yadm/repo.git' ..
      ' --work-tree ~'
  end
  local lazygit = Terminal:new({
    cmd = cmd,
    hidden = true,
    dir = "git_dir",
    direction = "float"
  })

  local function lazygit_toggle()
    lazygit:toggle()
  end

  vim.keymap.set('n', '<leader>g', lazygit_toggle)
end


return M
