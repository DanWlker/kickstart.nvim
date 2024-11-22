return {
  'echasnovski/mini.surround',
  keys = function(_, keys)
    -- Populate the keys based on the user's options
    local plugin = require('lazy.core.config').spec.plugins['mini.surround']
    local opts = require('lazy.core.plugin').values(plugin, 'opts', false)
    local mappings = {
      { opts.mappings.add, desc = 'Add Matching', mode = { 'n', 'v' } },
      { opts.mappings.delete, desc = 'Delete Matching' },
      { opts.mappings.find, desc = 'Find Right Matching' },
      { opts.mappings.find_left, desc = 'Find Left Matching' },
      { opts.mappings.highlight, desc = 'Highlight Matching' },
      { opts.mappings.replace, desc = 'Replace Matching' },
      { opts.mappings.update_n_lines, desc = 'Update `MiniSurround.config.n_lines`' },
    }
    mappings = vim.tbl_filter(function(m)
      return m[1] and #m[1] > 0
    end, mappings)
    return vim.list_extend(mappings, keys)
  end,
  opts = {
    mappings = {
      add = 'sa', -- Add surrounding in Normal and Visual modes
      delete = 'sd', -- Delete surrounding
      find = 'sf', -- Find surrounding (to the right)
      find_left = 'sF', -- Find surrounding (to the left)
      highlight = 'sh', -- Highlight surrounding
      replace = 'sr', -- Replace surrounding
      update_n_lines = 'sn', -- Update `n_lines`
    },
  },
}
