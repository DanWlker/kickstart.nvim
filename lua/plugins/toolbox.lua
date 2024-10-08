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

    vim.keymap.set({ 'n', 'v' }, '<leader>ch', require('toolbox').show_picker, { desc = '[C]ode [H]elpers' })
  end,
}
