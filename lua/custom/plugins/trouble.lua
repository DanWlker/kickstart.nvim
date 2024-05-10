return {
  'folke/trouble.nvim',
  branch = 'dev', --IMPORTANT!
  config = function()
    local trouble = require 'trouble'

    trouble.setup {
      icons = false,
      fold_open = 'v', -- icon used for open folds
      fold_closed = '>', -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
        -- icons / text used for a diagnostic
        error = '[X]',
        warning = '<!>',
        hint = '{?}',
        information = '(i)',
      },
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    }

    -- Lua
    vim.keymap.set('n', '<leader>xx', function()
      trouble.toggle()
    end)
    vim.keymap.set('n', '<leader>xw', function()
      trouble.toggle 'workspace_diagnostics'
    end)
    vim.keymap.set('n', '<leader>xd', function()
      trouble.toggle 'document_diagnostics'
    end)
    vim.keymap.set('n', 'gR', function()
      trouble.toggle 'lsp_references'
    end)
  end,
}
