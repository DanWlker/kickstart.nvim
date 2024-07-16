return {
  'FabijanZulj/blame.nvim',
  keys = {
    {
      '<leader>gl',
      '<cmd>BlameToggle window<cr>',
      desc = '[G]it Blame [L]ist',
    },
  },
  opts = {
    blame_options = { '-w' },
  },
}
