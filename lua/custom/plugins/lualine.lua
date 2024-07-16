return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
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
    require('lualine').setup {
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
      },
    }
  end,
}
