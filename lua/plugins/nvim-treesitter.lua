return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  -- [[ Configure Treesitter ]]
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',

      -- install GO parsers
      'go',
      'gomod',
      'gowork',
      'gosum',

      -- install Dart parser
      'dart',
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
