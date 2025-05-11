return {
  'mason-org/mason.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'mason-org/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()
    local ensure_installed = require('shared.lsp').getEnsureInstalled()
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
  end,
}
