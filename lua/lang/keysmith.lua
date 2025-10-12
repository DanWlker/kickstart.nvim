vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = { '*.yaml', '*.yml', '*.json', '*.toml' },
  group = vim.api.nvim_create_augroup('danwlker/keysmith', { clear = true }),
  callback = function() vim.keymap.set('n', '<leader>f/', require('keysmith').select_all_keys) end,
})

return {
  -- dir = '~/projects/keysmith.nvim',
  'Danwlker/keysmith.nvim',
  keys = {
    {
      'yk',
      function() vim.fn.setreg('+', require('keysmith').get_key()) end,
      desc = 'Copy key under cursor',
    },
    {
      'yv',
      function() vim.fn.setreg('+', require('keysmith').get_value()) end,
      desc = 'Copy key under cursor',
    },
  },
  config = true,
}
