return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    {
      '<leader>sh',
      function()
        require('telescope.builtin').help_tags()
      end,
      mode = 'n',
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sk',
      function()
        require('telescope.builtin').keymaps()
      end,
      mode = 'n',
      desc = '[S]earch [K]eymaps',
    },
    {
      '<leader>sf',
      function()
        require('telescope.builtin').find_files()
      end,
      mode = 'n',
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>ss',
      function()
        require('telescope.builtin').builtin()
      end,
      mode = 'n',
      desc = '[S]earch [S]elect Telescope',
    },
    {
      '<leader>sw',
      function()
        require('telescope.builtin').grep_string()
      end,
      mode = 'n',
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sg',
      function()
        require('telescope.builtin').live_grep()
      end,
      mode = 'n',
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sd',
      function()
        require('telescope.builtin').diagnostics()
      end,
      mode = 'n',
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sc',
      function()
        require('telescope.builtin').resume()
      end,
      mode = 'n',
      desc = '[S]earch [C]ontinue',
    },
    {
      '<leader>s.',
      function()
        require('telescope.builtin').oldfiles()
      end,
      mode = 'n',
      desc = '[S]earch Recent Files ("." for repeat)',
    },
    {
      '<leader><leader>',
      function()
        require('telescope.builtin').buffers()
      end,
      mode = 'n',
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>s/',
      function()
        require('telescope.builtin').live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end,
      desc = '[S]earch [/] in Open Files',
    },
    {
      '<leader>sn',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch [N]eovim files',
    },
  },
  config = function()
    local open_with_trouble = require('trouble.sources.telescope').open

    require('telescope').setup {
      defaults = {
        mappings = {
          i = { ['<c-t>'] = open_with_trouble },
          n = { ['<c-t>'] = open_with_trouble },
        },
        prompt_prefix = '  ',
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
      pickers = {
        live_grep = {
          file_ignore_patterns = { 'node_modules', '.git/', '.github/' },
          additional_args = function()
            return { '--hidden', '--no-ignore' }
          end,
        },
        find_files = {
          file_ignore_patterns = { 'node_modules', '.git/', '.github/' },
          hidden = true,
          no_ignore = true,
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
