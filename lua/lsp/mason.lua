return {
  'mason-org/mason.nvim',
  version = '^1.0.0', -- TODO: remove this when kickstart updates
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'mason-org/mason-lspconfig.nvim',
      version = '^1.0.0', -- TODO: remove this when kickstart updates
    },
  },
  config = function()
    require('mason').setup()
    local ensure_installed = require('shared.lsp').getEnsureInstalled()
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
  end,
}
