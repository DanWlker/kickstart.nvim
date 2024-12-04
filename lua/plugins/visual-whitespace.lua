return {
  'mcauley-penney/visual-whitespace.nvim',
  -- event = 'VimEnter', -- this is handled internally
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
