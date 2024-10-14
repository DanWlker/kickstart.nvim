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
  config = function()
    require('toolbox').setup {
      commands = {
        -- {
        --   name = 'Toggle minimap for buffer',
        --   execute = 'Neominimap bufToggle',
        -- },
        -- {
        --   name = 'Toggle minimap globally',
        --   execute = 'Neominimap toggle',
        -- },
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
          name = 'Inspect Vim Table',
          execute = function(v)
            print(vim.inspect(v))
          end,
        },
        {
          name = 'Copy Vim Table To Clipboard',
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
      },
    }
  end,
}
