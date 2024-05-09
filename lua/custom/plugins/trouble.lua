return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('trouble').setup {
      icons = false,
      fold_open = 'v', -- icon used for open folds
      fold_closed = '>', -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
        -- icons / text used for a diagnostic
        error = 'error',
        warning = 'warn',
        hint = 'hint',
        information = 'info',
      },
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    }
    -- Lua
    vim.keymap.set('n', '<leader>xx', function()
      require('trouble').toggle()
    end)
    vim.keymap.set('n', '<leader>xw', function()
      require('trouble').toggle 'workspace_diagnostics'
    end)
    vim.keymap.set('n', '<leader>xd', function()
      require('trouble').toggle 'document_diagnostics'
    end)
    vim.keymap.set('n', 'gR', function()
      require('trouble').toggle 'lsp_references'
    end)
  end,
}
