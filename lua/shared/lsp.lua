local M = {}

M.getServers = function()
  return {
    -- Clangd from LazyVim
    clangd = {
      keys = {
        { '<leader>ch', '<cmd>ClangdSwitchSourceHeader<cr>', desc = 'Switch Source/Header (C/C++)' },
      },
      root_dir = function(fname)
        return require('lspconfig.util').root_pattern(
          'Makefile',
          'configure.ac',
          'configure.in',
          'config.h.in',
          'meson.build',
          'meson_options.txt',
          'build.ninja'
        )(fname) or require('lspconfig.util').root_pattern('compile_commands.json', 'compile_flags.txt')(fname) or require('lspconfig.util').find_git_ancestor(
          fname
        )
      end,
      capabilities = {
        offsetEncoding = { 'utf-16' },
      },
      cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--header-insertion=iwyu',
        '--completion-style=detailed',
        '--function-arg-placeholders',
        '--fallback-style=llvm',
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
    },

    -- Go, from LazyVim
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

    --Html, Css, Js
    html = {},
    cssls = {},
    eslint = {}, -- May need to look into if this will conflict with prettier but, so far not sure

    -- Vue, but its messy, probably should refer to LazyVim config
    -- ts_ls = {
    --   init_options = {
    --     plugins = {
    --       {
    --         name = '@vue/typescript-plugin',
    --         location = require('mason-registry').get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server',
    --         languages = { 'javascript', 'typescript', 'vue' },
    --       },
    --     },
    --   },
    --   filetypes = {
    --     'javascript',
    --     'typescript',
    --     'vue',
    --   },
    -- },
    -- volar = {},

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
    'clang-format',
    'yamllint',
  })
  return ensure_installed
end

return M
