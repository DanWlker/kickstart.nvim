local M = {}

M.getServers = function()
  return {
    -- clangd = {},
    gopls = {
      settings = {
        gopls = {
          gofumpt = true,
        },
      },
    },
    gofumpt = {},
    -- pyright = {},
    -- rust_analyzer = {},
    ts_ls = {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = require('mason-registry').get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server',
            languages = { 'javascript', 'typescript', 'vue' },
          },
        },
      },
      filetypes = {
        'javascript',
        'typescript',
        'vue',
      },
    },
    eslint = {},
    html = {},
    cssls = {},
    volar = {},
    lua_ls = {
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            disable = { 'missing-fields' },
          },
        },
      },
    },
  }
end

M.getEnsureInstalled = function()
  local ensure_installed = vim.tbl_keys(M.getServers() or {})
  vim.list_extend(ensure_installed, {
    'stylua',
    'markdownlint',
    'prettierd',
    'prettier',
    'golangci-lint',
  })
  return ensure_installed
end

return M
