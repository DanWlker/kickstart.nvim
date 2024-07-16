local M = {}

M.masonInstalledServers = {
  graphql = {},
  marksman = {},
  -- yamlls from LazyVim
  yamlls = {
    -- Have to add this for yamlls to understand that we support line folding
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    -- lazy-load schemastore when needed
    on_new_config = function(new_config)
      new_config.settings.yaml.schemas = vim.tbl_deep_extend('force', new_config.settings.yaml.schemas or {}, require('schemastore').yaml.schemas())
    end,
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        keyOrdering = false,
        -- format = {
        --   enable = true,
        -- },
        validate = true,
        schemaStore = {
          -- Must disable built-in schemaStore support to use
          -- schemas from SchemaStore.nvim plugin
          enable = false,
          -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
          url = '',
        },
      },
    },
  },
  -- jsonls from LazyVim
  jsonls = {
    -- lazy-load schemastore when needed
    on_new_config = function(new_config)
      new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
    end,
    settings = {
      json = {
        format = {
          enable = true,
        },
        validate = { enable = true },
      },
    },
  },

  dockerls = {},
  docker_compose_language_service = {},

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

  --Html, Css, Js
  html = {},
  cssls = {},
  eslint = {}, -- May need to look into if this will conflict with prettier but, so far not sure

  -- Alternate to ts_ls
  vtsls = {
    root_dir = { 'tsconfig.json', 'package.json', 'jsconfig.json' },
    -- explicitly add default filetypes, so that we can extend
    -- them in related extras
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    settings = {
      complete_function_calls = true,
      vtsls = {
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          maxInlayHintLength = 30,
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = 'always' },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = 'literals' },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
      },
    },
  },

  -- Vue, but its messy, probably should refer to LazyVim config
  -- ts_ls = {
  --   -- init_options = {
  --   --   plugins = {
  --   --     {
  --   --       name = '@vue/typescript-plugin',
  --   --       location = require('mason-registry').get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server',
  --   --       languages = { 'javascript', 'typescript', 'vue' },
  --   --     },
  --   --   },
  --   -- },
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
  tailwindcss = {
    -- exclude a filetype from the default_config
    filetypes_exclude = { 'markdown' },
    -- add additional filetypes to the default_config
    filetypes_include = {},
    -- to fully override the default_config, change the below
    filetypes = {
      'astro',
      'css',
      'heex',
      'html',
      'html-eex',
      'javascript',
      'javascriptreact',
      'rust',
      'svelte',
      'typescript',
      'typescriptreact',
      'vue',
    },
    style = 'full',
  },
  bashls = {
    filetypes = { 'bash', 'sh' },
  },
}

M.manuallyInstalledServers = {
  gdscript = {
    cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
  },
  dartls = {
    settings = {
      dart = {
        analysisExcludedFolders = {
          vim.fn.expand '$HOME/.pub-cache/',
          vim.fn.expand '$HOME/fvm/',
          vim.fn.expand '$HOME/development/flutter/',
        },
      },
    },
  },
}

M.allServers = (function()
  return vim.tbl_extend('force', {}, M.masonInstalledServers, M.manuallyInstalledServers)
end)()

M.ensureInstalled = (function()
  local ensure_installed = vim.tbl_keys(M.masonInstalledServers)
  vim.list_extend(ensure_installed, {
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
    'delve',
    'shellcheck', --used by bashls
    'shfmt', --used by bashls
  })
  return ensure_installed
end)()

return M
