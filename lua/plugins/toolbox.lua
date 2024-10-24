return {
  'DanWlker/toolbox.nvim',
  keys = {
    {
      '<leader>st',
      function()
        require('toolbox').show_picker()
      end,
      desc = '[S]earch [T]oolbox',
      mode = { 'n', 'v' },
    },
  },
  dependencies = { 'nvim-telescope/telescope.nvim' },
  opts = {
    commands = {
      {
        name = 'Toggle minimap for buffer',
        execute = 'Neominimap bufToggle',
      },
      {
        name = 'Toggle minimap globally',
        execute = 'Neominimap toggle',
      },
      {
        name = 'Close current tab',
        execute = 'tabclose',
      },
      {
        name = 'Toggle Markview',
        execute = 'Markview toggleAll',
      },
      {
        name = 'Format Json',
        execute = "%!jq '.'",
      },
      {
        name = 'Inspect Vim table',
        execute = function(v)
          print(vim.inspect(v))
        end,
      },
      {
        name = 'Copy relative path to clipboard',
        execute = function()
          local path = vim.fn.expand '%'
          vim.fn.setreg('+', path)
        end,
      },
      {
        name = 'Copy absolute path to clipboard',
        execute = function()
          local path = vim.fn.expand '%:p'
          vim.fn.setreg('+', path)
        end,
      },
      {
        name = 'Copy Vim table to clipboard',
        execute = function(v)
          vim.fn.setreg('+', vim.inspect(v))
        end,
      },
      {
        name = 'Reload plugin',
        execute = function(name)
          package.loaded[name] = nil
          require(name).setup()
        end,
      },
      {
        name = 'Align csv file',
        execute = 'RainbowAlign',
      },
      {
        name = 'Shrink csv file (Remove spaces)',
        execute = 'RainbowShrink',
      },
    },
  },
  config = true,
}
