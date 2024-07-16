return {
  'Wansmer/treesj',
  dependencies = 'nvim-treesitter',
  keys = {
    { 'jT', '<cmd>TSJToggle<cr>', desc = 'Join/Split using treesitter' },
    { 'jS', '<cmd>TSJSplit<cr>', desc = 'Split using treesitter' },
    { 'jJ', '<cmd>TSJJoin<cr>', desc = 'Join using treesitter' },
  },
  opts = { use_default_keymaps = false },
}
