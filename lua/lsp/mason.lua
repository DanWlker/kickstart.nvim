return {
  'williamboman/mason.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup()
    local ensure_installed = require('shared.lsp').getEnsureInstalled()
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
  end,
}
