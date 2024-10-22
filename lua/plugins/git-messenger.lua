vim.g.git_messenger_no_default_mappings = true
vim.g.git_messenger_floating_win_opts = { border = 'rounded' }
return {
  'rhysd/git-messenger.vim',
  keys = {
    {
      '<leader>gb',
      '<Plug>(git-messenger)',
      desc = '[G]it [B]lame',
    },
  },
  cmd = { 'GitMessenger' },
}
