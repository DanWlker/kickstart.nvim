return {
  'folke/trouble.nvim',
  opts = {},
  cmd = 'Trouble',
  keys = {
    {
      '<leader>td',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>tD',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>tS',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>tl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>tL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>tQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
    {
      '<C-p>',
      function()
        if require('trouble').is_open() then
          require('trouble').prev { skip_groups = true, jump = true }
        end
      end,
      desc = 'Previous Trouble/Quickfix Item',
    },
    {
      '<C-n>',
      function()
        if require('trouble').is_open() then
          require('trouble').next { skip_groups = true, jump = true }
        end
      end,
      desc = 'Next Trouble/Quickfix Item',
    },
    {
      '<leader>tc',
      function()
        if require('trouble').is_open() then
          require('trouble').close()
        end
      end,
      desc = 'Trouble Close',
    },
    {
      '<leader>tt',
      function()
        require('trouble').toggle(require('trouble').last_mode)
      end,
      desc = 'Trouble Toggle Last Mode',
    },
  },
}
