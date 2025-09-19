vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  group = vim.api.nvim_create_augroup('danwlker/nvim-treesitter-parser', { clear = true }),
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

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    if vim.fn.executable 'tree-sitter' == 0 then
      vim.notify('**treesitter-main** requires the `tree-sitter` executable to be installed', vim.log.levels.ERROR)
      return
    end

    local dontUseTreesitterIndent = { 'bash', 'zsh', 'markdown' }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '*' },
      group = vim.api.nvim_create_augroup('danwlker/nvim-treesitter-start-and-indentexpr', { clear = true }),
      callback = function(ctx)
        -- highlights
        local started = pcall(vim.treesitter.start) -- errors for filetypes with no parser, note this starts the parser as well

        -- indent
        if started and not vim.list_contains(dontUseTreesitterIndent, ctx.match) then
          vim.bo[ctx.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    require('nvim-treesitter').setup()
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
      'go_tags',

      'dart',
      'dockerfile',
      'sql',
      'json',
      'helm',
      'tsx',
      'just',
      'typescript',
      'javascript',
      'yaml',
      'css',
      'scss',
      'make',
      'graphql',
      'regex',
    }

    vim.treesitter.language.register('bash', 'zsh')
  end,
}
