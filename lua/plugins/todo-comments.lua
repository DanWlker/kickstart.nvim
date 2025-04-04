return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
  keys = {
    {
      '<leader>ft',
      function()
        Snacks.picker.todo_comments()
      end,
      desc = 'Find Todo',
    },

    {
      '<leader>fT',
      function()
        Snacks.picker.todo_comments { keywords = { 'TODO', 'FIX', 'FIXME' } }
      end,
      desc = 'Find Todo/Fix/Fixme',
    },
  },
}
