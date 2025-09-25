return {
  'nvim-mini/mini.splitjoin',
  keys = {
    { 'jt', desc = 'Toggle Join/Split ' },
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
