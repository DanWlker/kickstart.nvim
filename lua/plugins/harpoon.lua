return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>ha',
      function()
        require('harpoon'):list():add()
      end,
      mode = 'n',
      desc = '[H]arpoon [A]dd',
    },
    {
      '<leader>hh',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      mode = 'n',
      desc = '[H]arpoon [E]dit',
    },
    {
      '<C-h>',
      function()
        require('harpoon'):list():select(1)
      end,
      mode = 'n',
    },
    {
      '<C-a>',
      function()
        require('harpoon'):list():select(2)
      end,
      mode = 'n',
    },
    {
      '<C-e>',
      function()
        require('harpoon'):list():select(3)
      end,
      mode = 'n',
    },
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()
  end,
}
