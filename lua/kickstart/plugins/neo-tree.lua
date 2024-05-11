-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  config = function()
    require('neo-tree').setup {
      default_component_configs = {
        icon = {
          folder_closed = '>',
          folder_open = 'v',
          folder_empty = '-',
          -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
          -- then these will never be used.
          default = ' ',
          highlight = 'NeoTreeFileIcon',
        },
        git_status = {
          symbols = {
            -- Change type
            added = '+', -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = '~', -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = 'x', -- this can only be used in the git_status source
            renamed = 'r', -- this can only be used in the git_status source
            -- Status type
            untracked = '?',
            ignored = '/',
            unstaged = 'U',
            staged = '*',
            conflict = '!',
          },
        },
      },
      filesystem = {
        window = {
          position = 'right',
          mappings = {
            ['\\'] = 'close_window',
          },
        },
        follow_current_file = {
          enabled = true,
        },
        hide_dotfiles = false,
        hide_gitignored = false,
        hijack_netrw_behavior = 'open_current',
      },
    }
  end,
}
