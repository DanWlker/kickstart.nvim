return {
  'mcauley-penney/visual-whitespace.nvim',
  event = 'VimEnter',
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
