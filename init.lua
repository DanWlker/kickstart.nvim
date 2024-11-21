require 'options'

require 'statuscol'

require 'keymaps'

require 'autocmds'

require 'install-lazy'

require('lazy').setup({
  -- [[ Themes ]]
  { import = 'themes' },

  -- [[ LSP ]]
  require 'lsp.luvit-meta',
  require 'lsp.lazydev',
  require 'lsp.mason',
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
  require 'plugins.harpoon',
  require 'plugins.rainbow-csv',
  require 'plugins.visual-whitespace',
  require 'plugins.nvim-highlight-colors',
  require 'plugins.lsp-lines',
  require 'plugins.mini-ai',
  require 'plugins.mini-surround',

  -- require 'plugins.indent-blankline',
  require 'plugins.hlchunk',

  require 'plugins.toolbox',
  -- {
  --   dir = '~/projects/toolbox.nvim',
  --   name = 'toolbox',
  --   config = function()
  --     require('toolbox').setup {
  --       commands = {
  --         {
  --           -- name = 'Format Json Req Input',
  --           name = 'A',
  --           execute = "%!jq '.'<Esc>",
  --           require_input = true,
  --         },
  --         {
  --           -- name = 'format leader',
  --           name = 'c',
  --           execute = 's/leader/thing',
  --         },
  --         {
  --           -- name = 'format leader req input',
  --           name = 'b',
  --           execute = 's/leader/thing',
  --           require_input = true,
  --         },
  --         {
  --           -- name = 'Format Json',
  --           name = 'F',
  --           execute = "%!jq '.'",
  --         },
  --         {
  --           -- name = 'Print My NAME',
  --           name = 'this1',
  --           execute = function(item)
  --             print('The name is ' .. item .. '-agen')
  --           end,
  --         },
  --         {
  --           -- name = 'Print My NAME<Left><Left><Left>',
  --           name = 'this2',
  --           execute = function(item, item2, item3)
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
  change_detection = { notify = false },
})

vim.cmd.colorscheme 'catppuccin'
