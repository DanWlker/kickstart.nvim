-- Taken from Maria's dotfiles
return {
  'akinsho/bufferline.nvim',
  event = 'VimEnter',
  opts = {
    options = {
      mode = 'tabs',
      always_show_bufferline = false,
      show_close_icon = false,
      show_buffer_close_icons = false,
      truncate_names = false,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(_, _, diag)
        local icons = require('shared.icons').diagnostics
        local indicator = (diag.error and icons.ERROR .. ' ' or '') .. (diag.warning and icons.WARN or '')
        return vim.trim(indicator)
      end,
    },
  },
}
