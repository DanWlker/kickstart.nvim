return {
  'Wansmer/treesj',
  dependencies = {
    'nvim-treesitter',
    'nvim-mini/mini.splitjoin',
  },
  keys = {
    { 'jt', desc = 'Toggle Join/Split with treesitter' },
    { 'js', desc = 'Split with treesitter' },
    { 'jj', desc = 'Join with treesitter' },
  },
  opts = { use_default_keymaps = false },
  config = function()
    local function get_pos_lang()
      local c = vim.api.nvim_win_get_cursor(0)
      local range = { c[1] - 1, c[2], c[1] - 1, c[2] }
      local buf = vim.api.nvim_get_current_buf()
      local ok, parser = pcall(vim.treesitter.get_parser, buf, vim.treesitter.language.get_lang(vim.bo[buf].ft))
      if not ok then
        return ''
      end
      local current_tree = parser:language_for_range(range)
      return current_tree:lang()
    end

    vim.keymap.set('n', 'jt', function()
      local tsj_langs = require('treesj.langs')['presets']
      local lang = get_pos_lang()
      if lang ~= '' and tsj_langs[lang] then
        require('treesj').toggle()
      else
        require('mini.splitjoin').toggle()
      end
    end)

    vim.keymap.set('n', 'js', function()
      local tsj_langs = require('treesj.langs')['presets']
      local lang = get_pos_lang()
      if lang ~= '' and tsj_langs[lang] then
        require('treesj').split()
      else
        require('mini.splitjoin').split()
      end
    end)

    vim.keymap.set('n', 'jj', function()
      local tsj_langs = require('treesj.langs')['presets']
      local lang = get_pos_lang()
      if lang ~= '' and tsj_langs[lang] then
        require('treesj').join()
      else
        require('mini.splitjoin').join()
      end
    end)
  end,
}
