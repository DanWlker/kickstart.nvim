return {
  'mcauley-penney/visual-whitespace.nvim',
  event = 'VimEnter',
  keys = {
    {
      '<leader>tv',
      function()
        require('visual-whitespace').toggle()
      end,
      desc = 'Toggle visual-whitespace',
    },
  },
  opts = {
    --   nl_char = '󰌑',
    excluded = {
      buftypes = {
        'nofile',
        'help',
        'quickfix',
      },
    },
  },
}
