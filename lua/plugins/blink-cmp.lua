return {
  'Saghen/blink.cmp',
  event = 'InsertEnter',
  build = 'rustup run nightly cargo build --release',
  dependencies = {
    'kristijanhusak/vim-dadbod-completion',
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
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
    'saadparwaiz1/cmp_luasnip',
    { 'saghen/blink.compat', opts = { impersonate_nvim_cmp = true } },
  },
  opts = {
    keymap = { preset = 'enter' },
    nerd_font_variant = 'mono',
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
      completion = {
        enabled_providers = { 'lsp', 'path', 'luasnip', 'buffer', 'lazydev', 'dadbod' },
      },
      providers = {
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
        lsp = { fallback_for = { 'lazydev' } },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
        luasnip = {
          name = 'luasnip',
          module = 'blink.compat.source',

          score_offset = -3,

          opts = {
            use_show_condition = false,
            show_autosnippets = true,
          },
        },
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
