require 'options'

require 'keymaps'

require 'autocmds'

require 'install-lazy'

require 'statusline'

require 'winbar'

require('lazy').setup({
  -- [[ Themes ]]
  { import = 'themes' },

  -- [[ LSP ]]
  { import = 'lsp' },

  -- [[ GIT ]]
  { import = 'git' },

  -- [[ Plugins ]]
  { import = 'plugins' },
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

local cwd = vim.fn.getcwd()
local pipepath = cwd .. '/server.pipe'
local project_godot_path = cwd .. '/project.godot'
if vim.uv.fs_stat(project_godot_path) then
  vim.fn.serverstart(pipepath)
end
