vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = { '*.yaml', '*.yml' },
  group = vim.api.nvim_create_augroup('danwlker/yaml', { clear = true }),
  callback = function()
    vim.keymap.set('n', '<leader>f/', require('yaml_nvim').snacks, {
      desc = 'Find Yaml Keys Fuzzily in Current Buffer',
      buffer = 0,
      noremap = true,
      silent = true,
      nowait = true,
    })

    vim.keymap.set('n', 'yk', function() require('yaml_nvim').yank_key '+' end, {
      desc = 'Yank Yaml Key',
      buffer = 0,
      noremap = true,
      silent = true,
      nowait = true,
    })

    vim.keymap.set('n', 'yv', function() require('yaml_nvim').yank_value '+' end, {
      desc = 'Yank Yaml Key',
      buffer = 0,
      noremap = true,
      silent = true,
      nowait = true,
    })
  end,
})

return {
  'cuducos/yaml.nvim',
  ft = { 'yaml' }, -- optional
  dependencies = {
    'folke/snacks.nvim', -- optional
    -- 'nvim-telescope/telescope.nvim', -- optional
    -- 'ibhagwan/fzf-lua', -- optional
  },
}
