local g = vim.g
g.mapleader = ' '
g.maplocalleader = ' '
g.have_nerd_font = true
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#cdd6f4' })
vim.diagnostic.config {
  float = { border = 'rounded' },
}

require 'options'

require 'keymaps'

require 'autocmds'

require 'helpers'

require 'install_lazy'

require('lazy').setup({
  -- [[ Themes ]]
  { import = 'themes' },

  -- [[ LSP ]]
  require 'lsp.luvit-meta',
  require 'lsp.lazydev',
  require 'lsp.nvim-lsp-file-operations',
  require 'lsp.nvim-lspconfig',

  -- [[ Plugins ]]
  require 'plugins.vim-sleuth',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.conform',
  require 'plugins.nvim-cmp',
  require 'plugins.todo-comments',
  require 'plugins.nvim-treesitter',
  -- require 'plugins.indent-blankline',
  require 'plugins.nvim-lint',
  require 'plugins.git-messenger',
  require 'plugins.markview',
  require 'plugins.nvim-tree',
  require 'plugins.nvim-ufo',
  require 'plugins.nvim-treesitter-context',
  require 'plugins.trouble',
  require 'plugins.lualine',
  require 'plugins.nvim-dap',
  require 'plugins.blame',
  require 'plugins.flash',
  require 'plugins.nvim-autopairs',
  require 'plugins.hlchunk',
  require 'plugins.toolbox',
  -- {
  --   dir = '~/projects/toolbox.nvim',
  --   name = 'toolbox',
  --   config = function()
  --     require('toolbox').setup {
  --       commands = {
  --         {
  --           name = 'Format Json',
  --           execute = "%!jq '.'",
  --         },
  --         {
  --           name = 'Format Json (Function)',
  --           execute = function()
  --             vim.cmd "%!jq '.'"
  --           end,
  --         },
  --         {
  --           name = 'thing',
  --           execute = function()
  --             vim.cmd 'thing'
  --           end,
  --         },
  --         {
  --           name = 'Testing',
  --           execute = 's/leader/thing',
  --         },
  --       },
  --     }
  --
  --     vim.keymap.set({ 'n', 'v' }, '<leader>h', require('toolbox').show_picker, { desc = '' })
  --   end,
  -- },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

vim.cmd.colorscheme 'catppuccin'
