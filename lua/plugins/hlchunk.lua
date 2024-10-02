return {
  'shellRaining/hlchunk.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('hlchunk').setup {
      chunk = {
        chars = {
          horizontal_line = '─',
          vertical_line = '│',
          left_top = '┌',
          left_bottom = '└',
          right_arrow = '─',
        },
        style = {
          '#9399b2',
          '#eba0ac',
        },
        enable = true,
        duration = 0,
        delay = 0,
      },
      indent = {
        enable = false,
      },
      line_num = {
        enable = false,
      },
      blank = {
        enable = false,
      },
    }
  end,
}
