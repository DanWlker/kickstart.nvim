vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').go_tags = {
      install_info = {
        url = 'https://github.com/DanWlker/tree-sitter-go_tags',
        branch = 'tree-sitter-1.25.5',
        -- files = { 'src/parser.c' },
      },
    }
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function()
    -- TODO: remove error = false when nvim 0.12+ is default
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
      vim.treesitter.start()
    end
  end,
})

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup()
    -- ts.setup {
    --   textobjects = {
    --     lsp_interop = {
    --       enable = true,
    --     },
    --   },
    --
    --   highlight = {
    --     enable = true,
    --     -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    --     --  If you are experiencing weird indenting issues, add the language to
    --     --  the list of additional_vim_regex_highlighting and disabled languages for indent.
    --     additional_vim_regex_highlighting = { 'ruby' },
    --     disable = { 'csv' },
    --   },
    --
    --   indent = { enable = true, disable = { 'ruby' } },
    -- }
    require('nvim-treesitter').install {
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
    }
  end,
}
