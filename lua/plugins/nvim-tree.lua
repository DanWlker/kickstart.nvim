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

    local tree_api = require 'nvim-tree.api'

    require('nvim-tree').setup {
      on_attach = function(bufnr)
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set('n', 'K', tree_api.node.show_info_popup, opts 'Info')
        vim.keymap.set('n', '<C-t>', tree_api.node.open.tab, opts 'Open: New Tab')
        vim.keymap.set('n', '<C-v>', tree_api.node.open.vertical, opts 'Open: Vertical Split')
        vim.keymap.set('n', '<C-s>', tree_api.node.open.horizontal, opts 'Open: Horizontal Split')
        vim.keymap.set('n', '<BS>', tree_api.node.navigate.parent_close, opts 'Close Directory')
        vim.keymap.set('n', '<CR>', tree_api.node.open.edit, opts 'Open')
        vim.keymap.set('n', '.', tree_api.node.run.cmd, opts 'Run Command')
        vim.keymap.set('n', 'a', tree_api.fs.create, opts 'Create File Or Directory')
        vim.keymap.set('n', 'bd', tree_api.marks.bulk.delete, opts 'Delete Bookmarked')
        vim.keymap.set('n', 'bD', tree_api.marks.bulk.trash, opts 'Trash Bookmarked')
        vim.keymap.set('n', 'bmv', tree_api.marks.bulk.move, opts 'Move Bookmarked')
        vim.keymap.set('n', 'B', tree_api.tree.toggle_no_buffer_filter, opts 'Toggle Filter: No Buffer')
        vim.keymap.set('n', 'y', tree_api.fs.copy.node, opts 'Copy')
        vim.keymap.set('n', 'd', tree_api.fs.remove, opts 'Delete')
        vim.keymap.set('n', 'D', tree_api.fs.trash, opts 'Trash')
        vim.keymap.set('n', 'E', tree_api.tree.expand_all, opts 'Expand All')
        vim.keymap.set('n', 'F', tree_api.live_filter.clear, opts 'Live Filter: Clear')
        vim.keymap.set('n', 'f', tree_api.live_filter.start, opts 'Live Filter: Start')
        vim.keymap.set('n', 'g?', tree_api.tree.toggle_help, opts 'Help')
        vim.keymap.set('n', 'H', tree_api.tree.toggle_hidden_filter, opts 'Toggle Filter: Dotfiles')
        vim.keymap.set('n', 'I', tree_api.tree.toggle_gitignore_filter, opts 'Toggle Filter: Git Ignore')
        vim.keymap.set('n', 'M', tree_api.tree.toggle_no_bookmark_filter, opts 'Toggle Filter: No Bookmark')
        vim.keymap.set('n', 'm', tree_api.marks.toggle, opts 'Toggle Bookmark')
        vim.keymap.set('n', 'p', tree_api.fs.paste, opts 'Paste')
        vim.keymap.set('n', 'P', tree_api.node.navigate.parent, opts 'Parent Directory')
        vim.keymap.set('n', 'q', tree_api.tree.close, opts 'Close')
        vim.keymap.set('n', 'r', tree_api.fs.rename_full, opts 'Rename')
        vim.keymap.set('n', 'R', tree_api.tree.reload, opts 'Refresh')
        vim.keymap.set('n', 'W', tree_api.tree.collapse_all, opts 'Collapse')
        vim.keymap.set('n', 'x', tree_api.fs.cut, opts 'Cut')
        vim.keymap.set('n', 'gc', tree_api.fs.copy.filename, opts 'Copy Name')
        vim.keymap.set('n', 'c', tree_api.fs.copy.relative_path, opts 'Copy Relative Path')
        vim.keymap.set('n', 'C', tree_api.fs.copy.absolute_path, opts 'Copy Absolute Path')
      end,
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
