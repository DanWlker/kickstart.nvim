return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  -- [[ Configure Treesitter ]]
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {
        lsp_interop = {
          enable = true,
        },
      },
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

        -- dockerfile
        'dockerfile',

        -- sql
        'sql',

        -- json
        'json',
      },
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
        disable = { 'csv' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    }

    -- Local treesitter temporary
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.go_tags = {
      install_info = {
        url = 'https://github.com/DanWlker/tree-sitter-go_tags',
        files = { 'src/parser.c' },
        branch = 'main',
      },
    }
  end,
}
