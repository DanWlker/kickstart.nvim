vim.hl = vim.highlight --https://github.com/neovim/neovim/issues/31675

require 'options'

require 'keymaps'

require 'autocmds'

require 'install-lazy'

require('lazy').setup({
  -- [[ Themes ]]
  { import = 'themes' },

  -- [[ LSP ]]
  require 'lsp.lazydev',
  require 'lsp.mason',
  require 'lsp.nvim-lspconfig',
  require 'lsp.clangd-extensions',
  require 'lsp.schemastore',

  -- [[ Plugins ]]
  require 'plugins.vim-sleuth',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.conform',
  require 'plugins.nvim-autopairs',
  require 'plugins.blink-cmp',
  require 'plugins.todo-comments',
  require 'plugins.nvim-treesitter',
  require 'plugins.nvim-lint',
  require 'plugins.git-messenger',
  require 'plugins.nvim-tree',
  require 'plugins.nvim-ufo',
  require 'plugins.nvim-treesitter-context',
  require 'plugins.trouble',
  require 'plugins.mini-statusline',
  require 'plugins.nvim-dap',
  require 'plugins.blame',
  require 'plugins.flash',
  require 'plugins.diffview',
  require 'plugins.nvim-scrollbar',
  require 'plugins.harpoon',
  require 'plugins.rainbow-csv',
  require 'plugins.visual-whitespace',
  require 'plugins.mini-hipatterns',
  require 'plugins.lsp-lines',
  require 'plugins.mini-ai',
  require 'plugins.mini-surround',
  require 'plugins.mini-splitjoin',
  require 'plugins.mini-move',
  require 'plugins.undotree',
  require 'plugins.vim-dadbod-ui',
  require 'plugins.hlchunk',
  require 'plugins.nvim-coverage',
  require 'plugins.toolbox',
  require 'plugins.quicker',
  require 'plugins.nvim-bqf',
  require 'plugins.ts-comments',
  require 'plugins.mini-diff',
  require 'plugins.snacks',
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
  --           weight = 0,
  --         },
  --         {
  --           -- name = 'format leader',
  --           name = 'c',
  --           execute = 's/leader/thing',
  --           weight = -1,
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
  --           tags = { 'second' },
  --         },
  --         {
  --           -- name = 'Print My NAME<Left><Left><Left>',
  --           name = 'this2',
  --           execute = function(item, item2, item3)
  --             print('The name is ' .. item .. '-agen')
  --           end,
  --           tags = { 'first', 'second' },
  --         },
  --       },
  --     }
  --
  --     vim.keymap.set({ 'n', 'v' }, '<leader>s', function()
  --       require('toolbox').show_picker()
  --     end, { desc = '' })
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
