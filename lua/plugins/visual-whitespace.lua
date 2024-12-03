return {
  'mcauley-penney/visual-whitespace.nvim',
  -- event = 'ModeChanged *:[vV]', -- This is handled internally but just in case
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
