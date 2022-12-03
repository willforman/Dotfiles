local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'g?', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
  buf_set_keymap('n', '<leader>zb', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
  buf_set_keymap('n', '<leader>zc', '<cmd>lua require"dap".continue()<CR>', opts)
  buf_set_keymap('n', '<leader>zo', '<cmd>lua require"dap".step_over()<CR>', opts)
  buf_set_keymap('n', '<leader>zi', '<cmd>lua require"dap".step_into()<CR>', opts)
  buf_set_keymap('n', '<leader>zt', '<cmd>lua require"dap".step_out()<CR>', opts)
end

-- CMP
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort()
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lsp_signature_help' }
  }),
})

-- AUTOPAIRS CMP
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

local capabilities = require('cmp_nvim_lsp').default_capabilities()



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

for _, name in ipairs(ls_names) do
  lspconfig[name].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = ls_cmd[name],
    settings = ls_settings[name]
  }
end
