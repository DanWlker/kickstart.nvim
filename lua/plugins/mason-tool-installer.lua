return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  opts = { ensure_installed = require('shared.lsp').ensureInstalled },
  dependencies = {
    'mason-org/mason-lspconfig.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'mason-org/mason.nvim',
  },
}
