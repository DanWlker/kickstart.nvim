return {
  'nvim-mini/mini.splitjoin',
  keys = {
    { 'jt', desc = 'Join/Split Toggle' },
    { 'js', desc = 'Split' },
    { 'jj', desc = 'Join' },
  },
  opts = {
    mappings = {
      toggle = 'jt',
      split = 'js',
      join = 'jj',
    },
  },
}
