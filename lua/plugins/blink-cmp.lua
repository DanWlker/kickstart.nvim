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
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    snippets = {
      preset = 'luasnip',
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'dadbod' },
      providers = {
        dadbod = {
          name = 'Dadbod',
          module = 'vim_dadbod_completion.blink',
        },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
        path = {
          opts = {
            show_hidden_files_by_default = true,
          },
        },
      },
    },
    signature = {
      enabled = true,
    },
    completion = {
      keyword = {
        range = 'full',
      },
      accept = {
        auto_brackets = { enabled = true },
      },
      menu = {
        draw = {
          -- treesitter = { 'lsp' },
          align_to = 'cursor',
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      documentation = {
        auto_show = true,
      },
      ghost_text = {
        enabled = true,
      },
    },
  },
  opts_extend = { 'sources.default' },
}
