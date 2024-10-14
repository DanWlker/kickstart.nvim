return {
  'Isrothy/neominimap.nvim',
  version = 'v3.*.*',
  enabled = true,
  lazy = false,
  init = function()
    -- The following options are recommended when layout == "float"
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36 -- Set a large value

    vim.g.neominimap = {
      auto_enable = true,
      git = { enabled = false },
      search = { enabled = true },
      buf_filter = function(bufnr)
        local line_count = vim.api.nvim_buf_line_count(bufnr)
        return line_count < 4096
      end,
      float = {
        z_index = 21, -- must be higher than treesitter context
        window_border = 'rounded',
      },
      click = {
        enabled = true,
      },
    }
  end,
}
