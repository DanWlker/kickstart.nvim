vim.lsp.enable(require('shared.lsp_configs').enabled_lsp)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(args)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
    end

    map('grr', function()
      Snacks.picker.lsp_references()
    end, 'Goto References')
    map('gri', function()
      Snacks.picker.lsp_implementations()
    end, 'Goto Implementation')
    map('gO', function()
      Snacks.picker.lsp_symbols { layout = { preset = 'vscode', preview = 'main' } }
    end, 'Show Document Symbols')
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

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, args.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = args.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = args.buf,
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

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, args.buf) then
      map('grh', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = args.buf })
      end, 'LSP: Inlay Hint')
    end
  end,
})

local cwd = vim.fn.getcwd()
local pipepath = cwd .. '/server.pipe'
local project_godot_path = cwd .. '/project.godot'
if vim.uv.fs_stat(project_godot_path) then
  vim.fn.serverstart(pipepath)
end
