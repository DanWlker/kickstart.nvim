return {
  'leath-dub/snipe.nvim',
  keys = {
    {
      '<leader><leader>',
      function()
        require('snipe').open_buffer_menu()
      end,
      desc = 'Open Snipe buffer menu',
    },
  },
  opts = {
    hints = {
      dictionary = 'shwftamrenilu', -- Just gallium layout easy to reach keys
    },
    ui = {
      open_win_override = {
        border = 'rounded',
      },
    },
  },
}
