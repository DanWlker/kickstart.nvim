return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim', --Ensure mason is run first before setting up
    -- { 'j-hui/fidget.nvim', config = true },
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

        map('grr', function()
          require('fzf-lua').lsp_references {
            sync = true,
            jump1 = true,
            jump1_action = require('fzf-lua.actions').file_switch_or_edit,
          }
        end, 'Goto References')
        map('gri', function()
          require('fzf-lua').lsp_implementations {
            sync = true,
            jump1 = true,
            jump1_action = require('fzf-lua.actions').file_switch_or_edit,
          }
        end, 'Goto Implementation')
        map('gO', require('fzf-lua').lsp_document_symbols, 'Show Document Symbols')
        map('grc', function()
          require('fzf-lua').lsp_incoming_calls()
        end, 'Goto incoming calls')
        map('gro', function()
          require('fzf-lua').lsp_outgoing_calls()
        end, 'Goto outgoing calls')
        map('K', function()
          vim.lsp.buf.hover { border = 'rounded' }
        end, '')
        map('gd', function()
          require('fzf-lua').lsp_definitions {
            sync = true,
            jump1 = true,
            jump1_action = require('fzf-lua.actions').file_switch_or_edit,
          }
        end, 'Goto Definition')
        map('grt', function()
          require('fzf-lua').lsp_typedefs {
            sync = true,
            jump1 = true,
            jump1_action = require('fzf-lua.actions').file_switch_or_edit,
          }
        end, 'Show Type Definition')
        map('gW', require('fzf-lua').lsp_live_workspace_symbols, 'Show Workspace Symbols')
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
      end,
    })

    local capabilities = vim.tbl_deep_extend('force', require('blink.cmp').get_lsp_capabilities(), require('lsp-file-operations').default_capabilities())

    local servers = require('shared.lsp').getServers()
    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    require('lspconfig').gdscript.setup {
      cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
      capabilities = capabilities,
    }

    require('lspconfig').dartls.setup {
      capabilities = capabilities,
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
