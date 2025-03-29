return {
  'rhysd/git-messenger.vim',
  init = function()
    vim.g.git_messenger_no_default_mappings = true
  end,
  keys = {
    {
      '<leader>gb',
      '<Plug>(git-messenger)',
      desc = '[G]it [B]lame',
    },
  },
  cmd = { 'GitMessenger' },
}
