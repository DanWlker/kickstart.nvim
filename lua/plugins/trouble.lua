return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  specs = {
    'folke/snacks.nvim',
    opts = function(_, opts)
      return vim.tbl_deep_extend('force', opts or {}, {
        picker = {
          actions = require('trouble.sources.snacks').actions,
          win = {
            input = {
              keys = {
                ['<c-t>'] = {
                  'trouble_open',
                  mode = { 'n', 'i' },
                },
              },
            },
          },
        },
      })
    end,
  },
  keys = {
    {
      '<leader>xd',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xD',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>xs',
      '<cmd>Trouble symbols toggle focus=false win.size=0.4<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>xl',
      '<cmd>Trouble lsp toggle focus=false win.position=right win.size=0.4<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xQ',
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
      '<leader>xc',
      function()
        if require('trouble').is_open() then
          require('trouble').close()
        end
      end,
      desc = 'Trouble Close',
    },
    {
      '<leader>xt',
      '<cmd>TodoTrouble<cr>',
      desc = 'Todo List (Trouble)',
    },
  },
  config = true,
}
