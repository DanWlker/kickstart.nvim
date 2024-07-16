return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    {
      '<leader>n',
      function()
        require('snacks').notifier.show_history()
      end,
      desc = 'Notification History',
    },
  },
  ---@type snacks.Config
  opts = {
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = {
      right = { 'fold' },
    },
  },
}
