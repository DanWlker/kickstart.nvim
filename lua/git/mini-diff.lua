return {
  'echasnovski/mini.diff',
  event = 'VimEnter',
  keys = {
    {
      '<leader>gd',
      function()
        require('mini.diff').toggle_overlay(0)
      end,
      desc = '[G]it [D]iff',
    },
  },
  opts = {
    view = {
      style = 'sign',
      signs = {
        add = '▎',
        change = '▎',
        delete = '',
      },
    },
  },
}
