return {
  'folke/flash.nvim',
  opts = {
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      'j',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump {
          search = {
            multi_window = false,
          },
        }
      end,
      desc = 'Flash Jump (On the character)',
    },
    {
      'J',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump {
          search = {
            multi_window = false,
          },
          jump = {
            pos = 'end',
            inclusive = false,
          },
        }
      end,
      desc = 'Flash Jump (One character before)',
    },
  },
}
