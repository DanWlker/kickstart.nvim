local HEIGHT_RATIO = 0.85 -- You can change this
local WIDTH_RATIO = 0.79 -- You can change this too

return {
  'nvim-tree/nvim-tree.lua',
  keys = { '\\' },
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('nvim-tree').setup {
      disable_netrw = true,
      hijack_netrw = true,
      sort = {
        sorter = 'case_sensitive',
      },
      -- view = {
      --   width = 40,
      --   side = 'right',
      -- },
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
      },
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
        custom = { '^\\.git$', '^\\.github$' },
      },
      git = {
        enable = false,
      },
      update_focused_file = {
        enable = true,
      },
    }

    -- local nvimTreeFocusOrToggle = function()
    --   local nvimTree = require 'nvim-tree.api'
    --   local currentBuf = vim.api.nvim_get_current_buf()
    --   local currentBufFt = vim.api.nvim_get_option_value('filetype', { buf = currentBuf })
    --   if currentBufFt == 'NvimTree' then
    --     nvimTree.tree.toggle()
    --   else
    --     nvimTree.tree.focus()
    --   end
    -- end
    --
    local tree_api = require 'nvim-tree.api'
    local tree_view = require 'nvim-tree.view'

    vim.api.nvim_create_augroup('NvimTreeResize', {
      clear = true,
    })

    vim.api.nvim_create_autocmd({ 'VimResized' }, {
      group = 'NvimTreeResize',
      callback = function()
        if tree_view.is_visible() then
          tree_api.tree.close()
          tree_api.tree.open()
        end
      end,
    })

    vim.keymap.set('n', '\\', tree_api.tree.toggle)
  end,
}
