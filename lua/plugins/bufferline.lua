return {
  'akinsho/bufferline.nvim',
  event = 'VimEnter',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local mocha = require('catppuccin.palettes').get_palette 'mocha'
    require('bufferline').setup {
      options = {
        mode = 'tabs',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require 'shared.icons'
          local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,
      },
      highlights = require('catppuccin.groups.integrations.bufferline').get {
        styles = { 'italic', 'bold' },
        custom = {
          all = {
            fill = { bg = mocha.base },
          },
          mocha = {
            background = { fg = mocha.text },
          },
          latte = {
            background = { fg = '#000000' },
          },
        },
      },
    }
  end,
}
