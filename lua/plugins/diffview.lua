return {
  'sindrets/diffview.nvim',
  keys = {
    {
      '<leader>gh',
      '<cmd>DiffviewFileHistory<cr>',
      desc = '[G]it [H]istory',
    },
    {
      '<leader>gf',
      '<cmd>DiffviewFileHistory %<cr>',
      desc = '[G]it [F]ile Only History',
    },
  },
}
