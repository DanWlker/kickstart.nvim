return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  opts = { ensure_installed = require('shared.tools').ensureInstalled },
  dependencies = {
    { 'mason-org/mason-lspconfig.nvim', dependencies = { 'mason-org/mason.nvim' } },
    { 'jay-babu/mason-nvim-dap.nvim', dependencies = { 'mason-org/mason.nvim' } },
    'mason-org/mason.nvim',
  },
}
