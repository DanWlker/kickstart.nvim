local M = {}

M.getServers = function()
  return {
    -- clangd = {},
    gopls = {
      settings = {
        gopls = {
          gofumpt = true,
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules' },
          semanticTokens = true,
        },
      },
    },
    gofumpt = {},

    -- Vue, but its messy, probably should refer to LazyVim config
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

    -- Lua
    lua_ls = {
      settings = {
        Lua = {
          codeLens = {
            enable = true,
          },
          doc = {
            privateName = { '^_' },
          },
          hint = {
            enable = true,
            setType = false,
            paramType = true,
            paramName = 'Disable',
            semicolon = 'Disable',
            arrayIndex = 'Disable',
          },
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
