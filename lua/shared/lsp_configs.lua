local mason_installable_lsps = {
  'clangd',
  'cssls',
  'docker_compose_language_service',
  'dockerls',
  'eslint',
  'gopls',
  'graphql',
  'html',
  'jsonls',
  'lua_ls',
  'marksman',
  'yamlls',
}

local mason_installable = vim.list_extend(vim.tbl_values(mason_installable_lsps), {
  'stylua',
  'markdownlint-cli2',
  'markdown-toc',
  'prettierd',
  'prettier',
  'golangci-lint',
  'clang-format',
  'yamllint',
  'gofumpt',
  'hadolint',
  'sqlfluff',
})

local enabled_lsp = vim.list_extend(vim.tbl_values(mason_installable_lsps), {
  'dartls',
})

return {
  ensure_installed = mason_installable,
  enabled_lsp = enabled_lsp,
}
