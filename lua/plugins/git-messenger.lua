return {
  'rhysd/git-messenger.vim',
  keys = {
    {
      '<leader>gb',
      desc = '[G]it [B]lame',
    },
  },
  cmd = { 'GitMessenger' },
  config = function()
    vim.g.git_messenger_no_default_mappings = true
    vim.g.git_messenger_floating_win_opts = { border = 'rounded' }
    vim.keymap.set('n', '<leader>gb', '<Plug>(git-messenger)', { noremap = true, silent = true })
  end,
}
