local lspconfig = require('lspconfig')
local keybindings = require('keybindings')
local completion = require('completion')

local ls_names = {'sumneko_lua', 'tsserver', 'eslint', 'pyright', 'gopls', 'rust_analyzer', 'svelte', 'html', 'cssls', 'elixirls'}

-- If we want to add settings to any lsps, add them like this
local ls_settings = {}
ls_settings['sumneko_lua'] = {
  Lua = {
    diagnostics = {
      globals = {'vim'},
    }
  }
}

-- If we want to add a custom cmd to any lsps, add them like this
local ls_cmd = {}
ls_cmd['elixirls'] = { vim.fn.expand("~/.local/share/nvim/elixir-ls/language_server.sh") }

-- Setup all lsps mentioned above
for _, name in ipairs(ls_names) do
  lspconfig[name].setup{
    capabilities = completion.capabilities,
    on_attach = keybindings.lsp_on_attach,
    cmd = ls_cmd[name],
    settings = ls_settings[name]
  }
end
