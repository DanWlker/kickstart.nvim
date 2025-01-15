return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim', --Ensure mason is run first before setting up
    { 'j-hui/fidget.nvim', config = true },
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
          Snacks.picker.lsp_references()
        end, 'Goto References')
        map('gri', function()
          Snacks.picker.lsp_implementations()
        end, 'Goto Implementation')
        map('gO', function()
          Snacks.picker.lsp_symbols { layout = { preset = 'vscode', preview = 'main' } }
        end, 'Show Document Symbols')
        map('<C-S>', vim.lsp.buf.signature_help, 'Signature help in insert mode', { 'i' }) --Note this is insert mode
        -- map('grc', function()
        --   require('telescope.builtin').lsp_incoming_calls()
        -- end, 'Goto incoming calls')
        -- map('gro', function()
        --   require('telescope.builtin').lsp_outgoing_calls()
        -- end, 'Goto outgoing calls')

        map('gd', function()
          Snacks.picker.lsp_definitions()
        end, 'Goto Definition')
        map('<leader>D', function()
          Snacks.picker.lsp_type_definitions()
        end, 'Show Type Definition')
        map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
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

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('grh', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, 'Toggle Inlay Hint')
        end
      end,
    })

    local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('blink.cmp').get_lsp_capabilities(),
      require('lsp-file-operations').default_capabilities()
    )

    local border_handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    }

    local servers = require('shared.lsp').getServers()
    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = false,
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
