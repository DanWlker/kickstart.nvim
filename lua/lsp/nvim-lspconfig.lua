return {
  --https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', function()
          require('telescope.builtin').lsp_definitions { reuse_win = true }
        end, '[G]oto [D]efinition')
        map('gr', function()
          require('telescope.builtin').lsp_references { reuse_win = true }
        end, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', function()
          require('telescope.builtin').lsp_type_definitions { reuse_win = true }
        end, 'Type [D]efinition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
        --   map('<leader>th', function()
        --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
        --   end, '[T]oggle Inlay [H]ints')
        -- end
      end,
    })

    local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities(),
      require('lsp-file-operations').default_capabilities()
    )

    local border_handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    }

    local servers = {
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

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'markdownlint',
      'prettierd',
      'prettier',
      'golangci-lint',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          server.handlers = vim.tbl_deep_extend('force', {}, border_handlers, server.handlers or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    require('lspconfig').dartls.setup {
      capabilities = capabilities,
      handlers = border_handlers,
      settings = {
        dart = {
          analysisExcludedFolders = {
            vim.fn.expand '$HOME/.pub-cache/',
            vim.fn.expand '$HOME/fvm/',
            vim.fn.expand '$HOME/development/flutter/',
          },
        },
      },
    }
  end,
}
