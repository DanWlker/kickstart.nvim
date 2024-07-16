return {
  'FabijanZulj/blame.nvim',
  keys = {
    {
      '<leader>gl',
      '<cmd>BlameToggle window<cr>',
      desc = '[G]it Blame [L]ist',
    },
  },
  config = function()
    require('blame').setup {
      blame_options = { '-w' },
    }
  end,
}
