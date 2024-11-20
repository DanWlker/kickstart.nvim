local mode_map = {
  n = '(˵•̀ ᴗ -)',
  nt = '(˵•̀ ᴗ -)',
  i = '(•̀ - •́ )',
  R = '( •̯́ ₃ •̯̀)',
  v = '( -_・)σ',
  V = '( -_・)σ',
  no = 'Σ(°△°ꪱꪱ)',
  ['\22'] = '( -_・)σ',
  t = ' (⌐■_■) ',
  ['!'] = 'Σ(°△°ꪱꪱ)',
  c = 'Σ(°△°ꪱꪱ)',
  s = '(´ ▽｀) ',
}
local icons = require 'shared.icons'

return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  opts = {
    options = {
      -- component_separators = '|',
      -- section_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
      component_separators = '/',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        {
          'mode',
          -- separator = { right = '' },
          -- separator = { right = '' },
          separator = { right = '' },
          fmt = function()
            return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode
          end,
        },
      },
      lualine_b = {
        'branch',
        {
          'diagnostics',
          symbols = {
            error = icons.ERROR,
            warn = icons.WARN,
            info = icons.INFO,
            hint = icons.HINT,
          },
        },
      },
      lualine_c = {
        { 'filename', path = 1 },
      },
    },
  },
  config = true,
}
