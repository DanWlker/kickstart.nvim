return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = {
      right = { 'fold' },
    },
    picker = { enabled = true },
  },
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    {
      '\\',
      function()
        Snacks.explorer()
      end,
      desc = 'Explorer Snacks (cwd)',
    },
    {
      '<leader>fn',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>fh',
      function()
        Snacks.picker.help()
      end,
      mode = 'n',
      desc = 'Find Help',
    },
    {
      '<leader>fk',
      function()
        Snacks.picker.keymaps()
      end,
      mode = 'n',
      desc = 'Find Keymaps',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      mode = 'n',
      desc = 'Find Files',
    },
    -- {
    --   '<leader>fm',
    --   function()
    --     require('telescope.builtin').builtin()
    --   end,
    --   mode = 'n',
    --   desc = 'Find More Telescope Uses',
    -- },
    {
      '<leader>fw',
      function()
        Snacks.picker.grep_word()
      end,
      mode = { 'n', 'x' },
      desc = 'Find Word',
    },
    {
      '<leader>fc',
      function()
        Snacks.picker.commands()
      end,
      mode = 'n',
      desc = 'Find Commands',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.grep()
      end,
      mode = 'n',
      desc = 'Find with Grep',
    },
    {
      '<leader>fd',
      function()
        Snacks.picker.diagnostics()
      end,
      mode = 'n',
      desc = 'Find Diagnostics',
    },
    {
      '<leader>fa',
      function()
        Snacks.picker.resume()
      end,
      mode = 'n',
      desc = 'Find Again',
    },
    {
      '<leader>f.',
      function()
        Snacks.picker.recent()
      end,
      mode = 'n',
      desc = 'Find Recent Files ("." for repeat)',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers()
      end,
      mode = 'n',
      desc = '[ ] Find Existing Buffers',
    },
    {
      '<leader>f/',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Fuzzy Find in Current Buffer [/]',
    },
    {
      '<leader>fo',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Find in Open Files',
    },
    {
      '<leader>fN',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find Neovim Files',
    },
  },
}
