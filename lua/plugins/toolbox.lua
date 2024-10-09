return {
  'DanWlker/toolbox.nvim',
  config = function()
    require('toolbox').setup {
      commands = {
        {
          name = 'Format Json',
          execute = "%!jq '.'",
        },
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>st', require('toolbox').show_picker, { desc = '[S]earch [T]oolbox' })
  end,
}
