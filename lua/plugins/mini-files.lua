return {
  'echasnovski/mini.files',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    {
      '\\',
      function()
        MiniFiles.open()
      end,
    },
  },
  opts = {
    mappings = {
      go_in = '',
      go_in_plus = '<Enter>',
      go_out = '',
      go_out_plus = '<Esc>',
    },
  },
}
