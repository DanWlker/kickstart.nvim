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
  --           name = 'variadic',
  --           execute = function(...)
  --             local args = { ... }
  --             print(vim.inspect(args))
  --           end,
  --           require_input = true,
  --         },
  --         {
  --           name = 'normal',
  --           execute = function()
  --             print 'this is normal'
  --           end,
  --           require_input = true,
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
  --     vim.keymap.set({ 'n', 'v' }, '<leader>w', function()
  --       vim.list_extend(require('toolbox').opts.commands, {
  --         {
  --           -- name = 'Print My NAME<Left><Left><Left>',
  --           name = 'this4',
  --           execute = function(item, item2, item3)
  --             print('The name is ' .. item .. '-agen')
  --           end,
  --           tags = { 'first', 'second' },
  --         },
  --       })
  --     end, { desc = '' })
  --
  --     vim.keymap.set({ 'n', 'v' }, '<leader>s', function()
  --       require('toolbox').show_picker(nil, {
  --         layout = {
  --           preset = 'telescope',
  --         },
  --       })
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

local cwd = vim.fn.getcwd()
local pipepath = cwd .. '/server.pipe'
local project_godot_path = cwd .. '/project.godot'
if vim.uv.fs_stat(project_godot_path) then
  vim.fn.serverstart(pipepath)
end
