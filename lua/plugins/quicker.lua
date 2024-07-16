return {
  'stevearc/quicker.nvim',
  ft = 'qf',
  keys = {
    {
      '<leader>l',
      function()
        require('quicker').toggle { loclist = true }
      end,
      desc = 'Loclist Toggle',
    },
    {
      '<leader>q',
      function()
        require('quicker').toggle()
      end,
      desc = 'Quickfix Toggle',
    },
  },
  config = true,
}
