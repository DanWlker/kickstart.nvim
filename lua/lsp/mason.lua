return {
  'mason-org/mason.nvim',
  dependencies = {
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', opts = { ensure_installed = require('shared.lsp').ensureInstalled } },
    { 'mason-org/mason-lspconfig.nvim', config = true },
    { 'jay-babu/mason-nvim-dap.nvim', config = true },
  },
  config = true,
}
