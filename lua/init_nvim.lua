require 'personal.install-lazy'

require 'personal.options'

require 'personal.keymaps'

require 'personal.autocmds'

require 'personal.statusline'

require 'personal.winbar'

require('lazy').setup({
  -- [[ Themes ]]
  { import = 'themes' },

  -- [[ Language helpers ]]
  { import = 'lang' },

  -- [[ Git ]]
  { import = 'git' },

  -- [[ Plugins ]]
  { import = 'plugins' },

  -- [[ Editing ]]
  { import = 'editing' },
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
