return {
  'gbprod/substitute.nvim',
  opts = {
    yank_substituted_text = true,
    highlight_substituted_text = {
      timer = 150,
    },
  },
  keys = {
    {
      's',
      function()
        require('substitute').operator()
      end,
      desc = 'Substitute',
    },
    {
      's',
      function()
        require('substitute').visual()
      end,
      mode = 'x',
    },
    {
      'S',
      function()
        require('substitute').eol()
      end,
      mode = { 'n', 'x' },
    },
    {
      'ss',
      function()
        require('substitute').line()
      end,
    },
  },
}
