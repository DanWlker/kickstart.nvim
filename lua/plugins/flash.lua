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
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump {
          search = {
            multi_window = false,
          },
        }
      end,
      desc = 'Flash (On the character)',
    },
    {
      'S',
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
      desc = 'Flash (One character before)',
    },
  },
}
