return {
  'nvim-mini/mini.splitjoin',
  -- keys = {
  --   { 'jt', desc = 'Toggle Join/Split' },
  --   { 'js', desc = 'Split' },
  --   { 'jj', desc = 'Join' },
  -- },
  lazy = true, -- will be triggered by treesj
  config = function(_, _)
    require('mini.splitjoin').setup {
      mappings = {
        toggle = '',
        split = '',
        join = '',
      },
    }

    local gen_hook = MiniSplitjoin.gen_hook
    local add_comma_curly = gen_hook.add_trailing_separator()
    local del_comma_curly = gen_hook.del_trailing_separator()
    vim.b.minisplitjoin_config = {
      split = { hooks_post = { add_comma_curly } },
      join = { hooks_post = { del_comma_curly } },
    }
  end,
}
