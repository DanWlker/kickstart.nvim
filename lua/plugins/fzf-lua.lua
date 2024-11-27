-- Everything in here is from LazyVim
return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require('lazy').load { plugins = { 'fzf-lua' } }
      return vim.ui.select(...)
    end
  end,
  keys = {
    {
      '<leader>fh',
      function()
        require('fzf-lua').helptags()
      end,
      mode = 'n',
      desc = 'Find Help',
    },
    {
      '<leader>fk',
      function()
        require('fzf-lua').keymaps()
      end,
      mode = 'n',
      desc = 'Find Keymaps',
    },
    {
      '<leader>ff',
      function()
        require('fzf-lua').files()
      end,
      mode = 'n',
      desc = 'Find Files',
    },
    {
      '<leader>fm',
      function()
        require('fzf-lua').builtin()
      end,
      mode = 'n',
      desc = 'Find More Uses',
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').grep_visual()
      end,
      mode = 'x',
      desc = 'Find Word',
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').grep_cword()
      end,
      mode = 'n',
      desc = 'Find Word',
    },
    {
      '<leader>fc',
      function()
        require('fzf-lua').commands()
      end,
      mode = 'n',
      desc = 'Find Commands',
    },
    {
      '<leader>fg',
      function()
        require('fzf-lua').live_grep()
      end,
      mode = 'n',
      desc = 'Find with Grep',
    },
    {
      '<leader>fd',
      function()
        require('fzf-lua').diagnostics_workspace()
      end,
      mode = 'n',
      desc = 'Find Diagnostics',
    },
    {
      '<leader>fa',
      function()
        require('fzf-lua').resume()
      end,
      mode = 'n',
      desc = 'Find Again',
    },
    {
      '<leader>f.',
      function()
        require('fzf-lua').oldfiles { cwd_only = true, stat_file = true }
      end,
      mode = 'n',
      desc = 'Find Recent Files ("." for repeat)',
    },
    {
      '<leader><leader>',
      function()
        require('fzf-lua').buffers()
      end,
      mode = 'n',
      desc = '[ ] Find Existing Buffers',
    },
    {
      '<leader>f/',
      function()
        require('fzf-lua').blines()
      end,
      desc = 'Fuzzy Find in Current Buffer [/]',
    },
    {
      '<leader>fo',
      function()
        require('fzf-lua').lines()
      end,
      desc = 'Find in Open Files',
    },
    {
      '<leader>fn',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find Neovim Files',
    },
    {
      '<leader>ft',
      '<cmd>TodoFzfLua<cr>',
      desc = 'Find Todos',
    },
  },
  opts = function()
    local config = require 'fzf-lua.config'
    -- local actions = require 'fzf-lua.actions'

    config.defaults.keymap.fzf['ctrl-u'] = 'half-page-up'
    config.defaults.keymap.fzf['ctrl-d'] = 'half-page-down'
    config.defaults.keymap.fzf['ctrl-q'] = 'select-all+accept' -- send all to quickfix list

    -- Trouble
    config.defaults.actions.files['ctrl-t'] = require('trouble.sources.fzf').actions.open

    return {
      'default-title',
      fzf_colors = true,
      fzf_opts = {
        ['--no-scrollbar'] = true,
      },
      defaults = {
        formatter = 'path.dirname_first',
      },
      winopts = {
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        backdrop = false,
        preview = {
          delay = 10,
          scrollchars = { '┃', '' },
        },
      },
      file_ignore_patterns = { 'node_modules', '.git/', '.github/' },
      files = {
        cwd_prompt = false,
        git_icons = false,
      },
      lsp = {
        symbols = {
          symbol_hl = function(s)
            return 'TroubleIcon' .. s
          end,
          symbol_fmt = function(s)
            return s:lower() .. '\t'
          end,
          child_prefix = false,
        },
        code_actions = {
          previewer = vim.fn.executable 'delta' == 1 and 'codeaction_native' or nil,
        },
      },

      -- from https://www.reddit.com/r/neovim/comments/1hhiidm/a_few_nice_fzflua_configurations_now_that_lazyvim/
      oldfiles = {
        include_current_session = true,
      },
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100,
        },
      },
    }
  end,
  config = function(_, opts)
    if opts[1] == 'default-title' then
      -- use the same prompt for all pickers for profile `default-title` and
      -- profiles that use `default-title` as base profile
      local function fix(t)
        t.prompt = t.prompt ~= nil and '   ' or nil
        for _, v in pairs(t) do
          if type(v) == 'table' then
            fix(v)
          end
        end
        return t
      end
      opts = vim.tbl_deep_extend('force', fix(require 'fzf-lua.profiles.default-title'), opts)
      opts[1] = nil
    end
    require('fzf-lua').setup(opts)
    require('fzf-lua').register_ui_select(function(fzf_opts, items)
      return vim.tbl_deep_extend('force', fzf_opts, {
        prompt = '   ',
        winopts = {
          title = ' ' .. vim.trim((fzf_opts.prompt or 'Select'):gsub('%s*:%s*$', '')) .. ' ',
          title_pos = 'center',
        },
      }, fzf_opts.kind == 'codeaction' and {
        winopts = {
          layout = 'vertical',
          -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
          height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
          width = 0.5,
          preview = {
            layout = 'vertical',
            vertical = 'down:15,border-top',
          },
        },
      } or {
        winopts = {
          width = 0.5,
          -- height is number of items, with a max of 80% screen height
          height = math.floor(math.min(vim.o.lines * 0.8, #items + 2) + 0.5),
        },
      })
    end)
  end,
}
