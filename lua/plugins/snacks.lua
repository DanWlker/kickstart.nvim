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
    -- Not as good as hlchunk
    -- indent = {
    --   indent = {
    --     enabled = false,
    --   },
    --   animate = {
    --     enabled = false,
    --   },
    --   chunk = {
    --     enabled = true,
    --     char = {
    --       horizontal = '─',
    --       vertical = '│',
    --       corner_top = '╭',
    --       corner_bottom = '╰',
    --       arrow = '─',
    --     },
    --   },
    -- },
  },
}
