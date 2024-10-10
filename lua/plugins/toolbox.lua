return {
  'DanWlker/toolbox.nvim',
  config = function()
    require('toolbox').setup {
      commands = {
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

    vim.keymap.set({ 'n', 'v' }, '<leader>st', require('toolbox').show_picker, { desc = '[S]earch [T]oolbox' })
  end,
}
