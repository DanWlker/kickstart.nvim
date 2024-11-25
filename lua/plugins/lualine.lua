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

local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == '' then
    return ''
  else
    return '  ' .. recording_register
    -- return '󰑊  ' .. recording_register
    -- return '󰑋  ' .. recording_register
  end
end

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
      component_separators = { ' ', ' ' },
      -- component_separators = '/',
      section_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        {
          'mode',
          -- separator = { right = '' },
          separator = { right = '' },
          -- separator = { right = '' },
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
        function()
          return '%='
        end,
        {
          'filename',
          file_status = true,
          path = 0,
          shorting_target = 40,
          symbols = {
            modified = '󰐖', -- Text to show when the file is modified.
            readonly = '', -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]', -- Text to show for new created file before first writting
          },
        },
        {
          show_macro_recording,
          color = { fg = '#1e1e2e', bg = '#f38ba8' },
          separator = { left = '', right = '' },
        },
      },
    },
  },
  config = true,
}
