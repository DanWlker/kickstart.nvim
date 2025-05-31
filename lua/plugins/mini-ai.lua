-- Everything in here is from LazyVim
local function ai_whichkey(opts)
  local objects = {
    { ' ', desc = 'whitespace' },
    { '"', desc = '" string' },
    { "'", desc = "' string" },
    { '(', desc = '() block' },
    { ')', desc = '() block with ws' },
    { '<', desc = '<> block' },
    { '>', desc = '<> block with ws' },
    { '?', desc = 'user prompt' },
    { 'U', desc = 'use/call without dot' },
    { '[', desc = '[] block' },
    { ']', desc = '[] block with ws' },
    { '_', desc = 'underscore' },
    { '`', desc = '` string' },
    { 'a', desc = 'argument' },
    { 'b', desc = ')]} block' },
    { 'c', desc = 'class' },
    { 'd', desc = 'digit(s)' },
    { 'e', desc = 'CamelCase / snake_case' },
    { 'f', desc = 'function' },
    { 'g', desc = 'entire file' },
    { 'o', desc = 'block, conditional, loop' },
    { 'q', desc = 'quote `"\'' },
    { 't', desc = 'tag' },
    { 'l', desc = 'line' },
    { 'u', desc = 'use/call' },
    { '{', desc = '{} block' },
    { '}', desc = '{} with ws' },
  }

  local ret = { mode = { 'o', 'x' } }
  ---@type table<string, string>
  local mappings = vim.tbl_extend('force', {}, {
    around = 'a',
    inside = 'i',
    -- around_next = 'an',
    -- inside_next = 'in',
    -- around_last = 'al',
    -- inside_last = 'il',
  }, opts.mappings or {})
  mappings.goto_left = nil
  mappings.goto_right = nil

  for name, prefix in pairs(mappings) do
    name = name:gsub('^around_', ''):gsub('^inside_', '')
    ret[#ret + 1] = { prefix, group = name }
    for _, obj in ipairs(objects) do
      local desc = obj.desc
      if prefix:sub(1, 1) == 'i' then
        desc = desc:gsub(' with ws', '')
      end
      ret[#ret + 1] = { prefix .. obj[1], desc = obj.desc }
    end
  end
  require('which-key').add(ret, { notify = false })
end

local function ai_buffer(ai_type)
  local start_line, end_line = 1, vim.fn.line '$'
  if ai_type == 'i' then
    -- Skip first and last blank lines for `i` textobject
    local first_nonblank, last_nonblank = vim.fn.nextnonblank(start_line), vim.fn.prevnonblank(end_line)
    -- Do nothing for buffer with all blanks
    if first_nonblank == 0 or last_nonblank == 0 then
      return { from = { line = start_line, col = 1 } }
    end
    start_line, end_line = first_nonblank, last_nonblank
  end

  local to_col = math.max(vim.fn.getline(end_line):len(), 1)
  return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
end

local function ai_line(ai_type, _, opts)
  local n_lines = opts.n_lines or -1
  local initial = 1
  local limit = vim.api.nvim_buf_line_count(0)
  if n_lines ~= -1 then
    local line_num = vim.fn.line '.'
    initial = math.max(line_num - n_lines, initial)
    limit = math.min(line_num + n_lines, limit)
  end

  local res = {}
  for i = initial, limit, 1 do
    local line = vim.fn.getline(i)
    if ai_type == 'a' then
      table.insert(res, { from = { line = i, col = 1 }, to = { line = i, col = #line } })
      goto continue
    end

    table.insert(res, { from = { line = i, col = line:find '%S' or 1 }, to = { line = i, col = line:find '%S%s*$' or 0 } })
    ::continue::
  end
  return res
end

return {
  'echasnovski/mini.ai',
  event = 'VimEnter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
  },
  opts = function()
    local ai = require 'mini.ai'
    return {
      n_lines = 500,
      custom_textobjects = {
        o = ai.gen_spec.treesitter { -- code block
          a = { '@block.outer', '@conditional.outer', '@loop.outer' },
          i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        },
        f = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' }, -- function
        c = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' }, -- class
        t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' }, -- tags
        d = { '%f[%d]%d+' }, -- digits
        e = { -- Word with case
          { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
          '^().*()$',
        },
        g = ai_buffer, -- buffer
        u = ai.gen_spec.function_call(), -- u for "Usage"
        U = ai.gen_spec.function_call { name_pattern = '[%w_]' }, -- without dot in function name
        -- l = { '^%s*().-()%s*\n' },
        -- l = function(ai_type)
        --   local line = vim.api.nvim_get_current_line()
        --   local line_num = vim.fn.line '.'
        --   if ai_type == 'a' then
        --     return { from = { line = line_num, col = 1 }, to = { line = line_num, col = #line } }
        --   end
        --
        --   local start_col = line:find '%S' or 1
        --   local end_col = line:find '%S%s*$' or #line
        --   return { from = { line = line_num, col = start_col }, to = { line = line_num, col = end_col } }
        -- end,
        l = ai_line,
      },
      mappings = {
        around_next = '',
        inside_next = '',
        around_last = '',
        inside_last = '',
      },
    }
  end,
  config = function(_, opts)
    require('mini.ai').setup(opts)
    ai_whichkey(opts)
  end,
}
