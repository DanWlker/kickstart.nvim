return {
  'nvim-mini/mini.clue',
  config = function()
    local miniclue = require('mini.clue')
    miniclue.setup({
      window = {
        delay = 500,
        config = {
          border = 'rounded',
          width = 'auto',
        },
        scroll_down = '',
        scroll_up = '',
      },
      clues = {
        {
          { keys = '<leader>x', desc = 'Trouble' },
          { keys = '<leader>f', desc = '[F]ind' },
          { keys = '<leader>w', desc = '[W]orkspace' },
          { keys = '<leader>g', desc = '[G]it' },
          { keys = '<leader>t', desc = '[T]oggle' },
          { keys = 'gr', desc = 'LSP Actions', mode = { 'n' } },
        },
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows({ submode_resize = true }),
        miniclue.gen_clues.z(),
      },
      -- Explicitly opt-in for set of common keys to trigger clue window
      triggers = {
        { mode = 'n', keys = '<Leader>' }, -- Leader triggers
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = '[' }, -- mini.bracketed
        { mode = 'n', keys = ']' },
        { mode = 'x', keys = '[' },
        { mode = 'x', keys = ']' },
        { mode = 'n', keys = 'g' }, -- `g` key
        { mode = 'x', keys = 'g' },
        { mode = 'n', keys = "'" }, -- Marks
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },
        { mode = 'n', keys = '"' }, -- Registers
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },
        { mode = 'n', keys = '<C-w>' }, -- Window commands
        { mode = 'n', keys = 'z' }, -- `z` key
        { mode = 'x', keys = 'z' },
        { mode = 'n', keys = 'j' }, -- `g` key
        { mode = 'x', keys = 'j' },
      },
    })
  end,
}
