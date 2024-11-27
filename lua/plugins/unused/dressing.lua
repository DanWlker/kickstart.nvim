return {
  'stevearc/dressing.nvim',
  lazy = true,
  opts = {
    select = {
      enabled = false,
    },
  },
  init = function()
    -- This is now done in fzf-lua
    -- ---@diagnostic disable-next-line: duplicate-set-field
    -- vim.ui.select = function(...)
    --   require('lazy').load { plugins = { 'dressing.nvim' } }
    --   return vim.ui.select(...)
    -- end
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.input = function(...)
      require('lazy').load { plugins = { 'dressing.nvim' } }
      return vim.ui.input(...)
    end
  end,
}
