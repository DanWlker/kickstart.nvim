return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = {
      right = { 'fold' },
    },
    -- Not as good as hlchunk
    -- indent = {
    --   indent = {
    --     enabled = false,
    --   },
    --   animate = {
    --     enabled = false,
    --   },
    --   chunk = {
    --     enabled = true,
    --     char = {
    --       horizontal = '─',
    --       vertical = '│',
    --       corner_top = '╭',
    --       corner_bottom = '╰',
    --       arrow = '─',
    --     },
    --   },
    -- },
    picker = {
      sources = {
        files = { hidden = true, ignored = true },
        grep = { hidden = true, ignored = true },
      },
      kinds = require('shared.icons').symbol_kinds,
      formatters = {
        file = {
          filename_first = true,
        },
      },
    },
    image = {},
  },
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    -- {
    --   '\\',
    --   function()
    --     Snacks.explorer()
    --   end,
    --   desc = 'Explorer Snacks (cwd)',
    -- },
    {
      '<leader>fn',
      function()
        Snacks.picker.notifications {
          layout = {
            preset = 'vertical',
          },
        }
      end,
      desc = 'Find Notification History',
    },
    {
      '<leader>fh',
      function()
        Snacks.picker.help()
      end,
      mode = 'n',
      desc = 'Find Help',
    },
    {
      '<leader>fk',
      function()
        Snacks.picker.keymaps()
      end,
      mode = 'n',
      desc = 'Find Keymaps',
    },
    {
      '<leader>ff',
      function()
        local truncate_width = vim.api.nvim_win_get_width(0) * 0.8
        Snacks.picker.files {
          formatters = {
            file = {
              truncate = truncate_width,
            },
          },
          layout = {
            hidden = { 'preview' },
          },
        }
      end,
      mode = 'n',
      desc = 'Find Files',
    },
    {
      '<leader>fm',
      function()
        Snacks.picker.pickers()
      end,
      mode = 'n',
      desc = 'Find More Picker Uses',
    },
    {
      '<leader>fw',
      function()
        Snacks.picker.grep_word()
      end,
      mode = { 'n', 'x' },
      desc = 'Find Word',
    },
    {
      '<leader>fc',
      function()
        Snacks.picker.commands {
          layout = {
            preset = 'vscode',
          },
        }
      end,
      mode = 'n',
      desc = 'Find Commands',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.grep()
      end,
      mode = 'n',
      desc = 'Find with Grep',
    },
    {
      '<leader>fd',
      function()
        Snacks.picker.diagnostics {
          layout = {
            preset = 'ivy_split',
          },
        }
      end,
      mode = 'n',
      desc = 'Find Diagnostics',
    },
    {
      '<leader>fa',
      function()
        Snacks.picker.resume()
      end,
      mode = 'n',
      desc = 'Find Again',
    },
    {
      '<leader>f.',
      function()
        Snacks.picker.recent {
          layout = {
            hidden = { 'preview' },
          },
        }
      end,
      mode = 'n',
      desc = 'Find Recent Files ("." for repeat)',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers {
          layout = {
            hidden = { 'preview' },
          },
        }
      end,
      mode = 'n',
      desc = '[ ] Find Existing Buffers',
    },
    {
      '<leader>f/',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Fuzzy Find in Current Buffer [/]',
    },
    {
      '<leader>fo',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Find in Open Files',
    },
    {
      '<leader>fN',
      function()
        Snacks.picker.files {
          cwd = vim.fn.stdpath 'config',
          layout = {
            hidden = { 'preview' },
          },
        }
      end,
      desc = 'Find Neovim Files',
    },
    {
      '<leader>f:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Find Command History',
    },
    {
      '<leader>fj',
      function()
        Snacks.picker.jumps()
      end,
      desc = 'Find Jumps',
    },
    {
      '<leader>fu',
      function()
        Snacks.picker.undo()
      end,
      desc = 'Find Undo History',
    },
    {
      '<leader>fC',
      function()
        Snacks.picker.colorschemes {
          layout = {
            preset = 'vertical',
          },
        }
      end,
      desc = 'Find Colorschemes',
    },
  },
}
