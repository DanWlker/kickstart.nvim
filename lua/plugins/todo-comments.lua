return {
  'DanWlker/todo-comments.nvim',
  -- event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'TodoTrouble', 'TodoFzfLua' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
