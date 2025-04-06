return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    -- { 'j-hui/fidget.nvim', config = true },
    {
      'antosha417/nvim-lsp-file-operations',
      dependencies = {
        'nvim-lua/plenary.nvim',
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

        map('grr', function()
          require('telescope.builtin').lsp_references { reuse_win = true }
        end, 'Goto References')
        map('gri', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
        map('gO', require('telescope.builtin').lsp_document_symbols, 'Show Document Symbols')
        map('grc', function()
          require('telescope.builtin').lsp_incoming_calls()
        end, 'Goto incoming calls')
        map('gro', function()
          require('telescope.builtin').lsp_outgoing_calls()
        end, 'Goto outgoing calls')
        map('K', function()
          vim.lsp.buf.hover { border = 'rounded' }
        end, '')
        map('gd', function()
          require('telescope.builtin').lsp_definitions { reuse_win = true }
        end, 'Goto Definition')
        map('grt', function()
          require('telescope.builtin').lsp_type_definitions { reuse_win = true }
        end, 'Show Type Definition')
        map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Show Workspace Symbols')
        map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
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

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('grh', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, 'LSP: Inlay Hint')
        end

        -- if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentColor, event.buf) then
        --   vim.lsp.document_color.enable(true, event.buf)
        -- end
      end,
    })

    for server_name, server in pairs(require('shared.tools').allServers) do
      server.capabilities = vim.tbl_deep_extend(
        'force',
        {},
        require('blink.cmp').get_lsp_capabilities(),
        require('lsp-file-operations').default_capabilities(),
        server.capabilities or {}
      )
      require('lspconfig')[server_name].setup(server)
    end
  end,
}
