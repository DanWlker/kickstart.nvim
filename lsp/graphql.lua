-- TODO: Check https://github.com/neovim/nvim-lspconfig/pull/3659 when implemented
return {
  cmd = { 'graphql-lsp', 'server', '-m', 'stream' },
  filetypes = { 'graphql', 'typescriptreact', 'javascriptreact' },
  root_markers = {
    '.graphqlrc*',
    '.graphql.config.*',
    'graphql.config.*',
  },
}
