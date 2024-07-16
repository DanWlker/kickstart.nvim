return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    {
      '\\',
      function()
        local nvimTree = require 'nvim-tree.api'
        local currentBuf = vim.api.nvim_get_current_buf()
        local currentBufFt = vim.api.nvim_get_option_value('filetype', { buf = currentBuf })
        if currentBufFt == 'NvimTree' then
          nvimTree.tree.toggle()
        else
          nvimTree.tree.focus()
        end
      end,
    },
  },
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local HEIGHT_RATIO = 0.85 -- You can change this
    local WIDTH_RATIO = 0.79 -- You can change this too
    local floating = false

    local view = {
      -- relativenumber = false,
      -- width = 45,
      adaptive_size = true,
      side = 'right',
    }
    if floating then
      view = {
        relativenumber = true,
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = 'rounded',
              relative = 'editor',
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
      }
    end

    require('nvim-tree').setup {
      disable_netrw = true,
      hijack_netrw = true,
      sort = {
        sorter = 'case_sensitive',
      },
      view = view,
      renderer = {
        group_empty = true,
        indent_markers = { enable = true },
        highlight_git = true,
        root_folder_label = ':t',
      },
      actions = {
        change_dir = {
          enable = false,
          restrict_above_cwd = true,
        },
      },
      filters = {
        custom = { 'node_modules', '^\\.git$', '^\\.github$' },
      },
      git = {
        enable = false,
      },
      update_focused_file = {
        enable = true,
      },
    }

    local tree_api = require 'nvim-tree.api'
    if floating then
      vim.api.nvim_create_augroup('NvimTreeResize', {
        clear = true,
      })
      vim.api.nvim_create_autocmd({ 'VimResized' }, {
        group = 'NvimTreeResize',
        callback = function()
          if require('nvim-tree.view').is_visible() then
            tree_api.tree.close()
            tree_api.tree.open()
          end
        end,
      })
    end
  end,
}
