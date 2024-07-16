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
      '<leader>fh',
      function()
        require('telescope.builtin').help_tags()
      end,
      mode = 'n',
      desc = 'Find Help',
    },
    {
      '<leader>fk',
      function()
        require('telescope.builtin').keymaps()
      end,
      mode = 'n',
      desc = 'Find Keymaps',
    },
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files()
      end,
      mode = 'n',
      desc = 'Find Files',
    },
    {
      '<leader>fm',
      function()
        require('telescope.builtin').builtin()
      end,
      mode = 'n',
      desc = 'Find More Telescope Uses',
    },
    {
      '<leader>fw',
      function()
        require('telescope.builtin').grep_string()
      end,
      mode = 'n',
      desc = 'Find Word',
    },
    {
      '<leader>fc',
      function()
        require('telescope.builtin').commands()
      end,
      mode = 'n',
      desc = 'Find Commands',
    },
    {
      '<leader>fg',
      function()
        require('telescope.builtin').live_grep()
      end,
      mode = 'n',
      desc = 'Find with Grep',
    },
    {
      '<leader>fd',
      function()
        require('telescope.builtin').diagnostics()
      end,
      mode = 'n',
      desc = 'Find Diagnostics',
    },
    {
      '<leader>fa',
      function()
        require('telescope.builtin').resume()
      end,
      mode = 'n',
      desc = 'Find Again',
    },
    {
      '<leader>f.',
      function()
        require('telescope.builtin').oldfiles()
      end,
      mode = 'n',
      desc = 'Find Recent Files ("." for repeat)',
    },
    {
      '<leader><leader>',
      function()
        require('telescope.builtin').buffers()
      end,
      mode = 'n',
      desc = '[ ] Find Existing Buffers',
    },
    {
      '<leader>f/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          previewer = false,
        })
      end,
      desc = 'Fuzzy Find in Current Buffer [/]',
    },
    {
      '<leader>fo',
      function()
        require('telescope.builtin').live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end,
      desc = 'Find in Open Files',
    },
    {
      '<leader>fn',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find Neovim Files',
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
        -- prompt_prefix = '  ',
        prompt_prefix = '   ',
        selection_caret = ' ',
        entry_prefix = ' ',
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
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
