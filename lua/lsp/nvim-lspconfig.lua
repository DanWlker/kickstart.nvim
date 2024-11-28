return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim', --Ensure mason is run first before setting up
    { 'j-hui/fidget.nvim', opts = {} },
    'hrsh7th/cmp-nvim-lsp',
    {
      'antosha417/nvim-lsp-file-operations',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-tree.lua',
      },
      config = true,
    },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- nvim 0.11 defaults apparently https://neovim.io/doc/user/lsp.html
        map('grn', vim.lsp.buf.rename, 'Rename References')
        map('gra', vim.lsp.buf.code_action, 'Code Actions', { 'n', 'x' })
        map('grr', function()
          require('telescope.builtin').lsp_references { reuse_win = true }
        end, 'Goto References')
        map('gri', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
        map('gO', require('telescope.builtin').lsp_document_symbols, 'Show Document Symbols')
        map('<C-S>', vim.lsp.buf.signature_help, 'Signature help in insert mode', { 'i' }) --Note this is insert mode

        map('gd', function()
          require('telescope.builtin').lsp_definitions { reuse_win = true }
        end, 'Goto Definition')
        map('<leader>D', function()
          require('telescope.builtin').lsp_type_definitions { reuse_win = true }
        end, 'Show Type Definition')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Show Workspace Symbols')
        map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

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

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('grh', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, 'Toggle Inlay Hint')
        end
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

    local servers = require('shared.lsp').getServers()
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
