require 'options'

require 'keymaps'

require 'autocmds'

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
  require 'plugins.diffview',
  require 'plugins.neominimap',
  require 'plugins.grug-far',
  require 'plugins.bufferline',

  -- require 'plugins.indent-blankline',
  require 'plugins.hlchunk',

  -- require 'plugins.bigfile',
  require 'plugins.faster',

  require 'plugins.toolbox',
  -- {
  --   dir = '~/projects/toolbox.nvim',
  --   name = 'toolbox',
  --   config = function()
  --     require('toolbox').setup {
  --       commands = {
  --         {
  --           name = 'Format Json Req Input',
  --           execute = "%!jq '.'<Esc>",
  --           require_input = true,
  --         },
  --         {
  --           name = 'format leader',
  --           execute = 's/leader/thing',
  --         },
  --         {
  --           name = 'format leader req input',
  --           execute = 's/leader/thing',
  --           require_input = true,
  --         },
  --         {
  --           name = 'Format Json',
  --           execute = "%!jq '.'",
  --         },
  --         {
  --           name = 'Print My NAME',
  --           execute = function(item)
  --             print('The name is ' .. item .. '-agen')
  --           end,
  --         },
  --         {
  --           name = 'Print My NAME<Left><Left><Left>',
  --           execute = function(item)
  --             print('The name is ' .. item .. '-agen')
  --           end,
  --         },
  --       },
  --     }
  --
  --     vim.keymap.set({ 'n', 'v' }, '<leader>st', require('toolbox').show_picker, { desc = '' })
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
