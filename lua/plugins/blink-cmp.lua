return {
  'Saghen/blink.cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  build = 'rustup run nightly cargo build --release',
  dependencies = {
    'kristijanhusak/vim-dadbod-completion',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip').filetype_extend('dart', { 'flutter' })
          end,
        },
      },
    },
  },
  opts = {
    keymap = {
      preset = 'enter',

      cmdline = {
        preset = 'super-tab',
      },
    },
    appearance = {
      nerd_font_variant = 'mono',
      kind_icons = {
        Color = '██',
      },
    },
    snippets = {
      expand = function(snippet)
        require('luasnip').lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction)
        require('luasnip').jump(direction)
      end,
    },
    sources = {
      default = { 'lsp', 'path', 'luasnip', 'buffer', 'lazydev', 'dadbod' },
      providers = {
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
        -- luasnip = {
        --   name = 'luasnip',
        --   module = 'blink.compat.source',
        --
        --   score_offset = -3,
        --
        --   opts = {
        --     use_show_condition = false,
        --     show_autosnippets = true,
        --   },
        -- },
      },
    },
    completion = {
      accept = {
        auto_brackets = { enabled = true },
      },
      menu = {
        border = 'rounded',
      },
      documentation = {
        auto_show = true,
        window = {
          border = 'rounded',
        },
      },
      ghost_text = {
        enabled = true,
      },
    },
  },
}
