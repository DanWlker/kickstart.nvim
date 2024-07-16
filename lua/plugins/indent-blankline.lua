return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  main = 'ibl',
  opts = {},
  config = function()
    -- local highlight = {
    --   'Whitespace',
    --   'CursorColumn',
    -- }
    require('ibl').setup {
      indent = {
        char = '▏', -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
      },
      scope = {
        show_start = false,
        show_end = false,
      },
      -- indent = { highlight = highlight, char = '' },
      -- whitespace = {
      --   highlight = highlight,
      --   remove_blankline_trail = false,
      -- },
      -- scope = { enabled = false },
    }
  end,
}
