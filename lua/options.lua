vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- disable netrw (copied from nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function isNotEmpty(s)
  return s ~= nil and s ~= ''
end
if isNotEmpty(vim.env.WSL_INTEROP) or isNotEmpty(vim.env.WSL_DISTRO_NAME) then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

local icons = require 'shared.icons'
vim.diagnostic.config {
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = false,
  -- signs = vim.g.have_nerd_font and {
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = icons.ERROR,
  --     [vim.diagnostic.severity.WARN] = icons.WARN,
  --     [vim.diagnostic.severity.INFO] = icons.INFO,
  --     [vim.diagnostic.severity.HINT] = icons.HINT,
  --   },
  -- } or {},
  -- virtual_lines = {
  --   current_line = true,
  --   severity = {
  --     min = vim.diagnostic.severity.ERROR,
  --   },
  -- },

  virtual_text = {
    -- source = 'if_many',
    -- severity = {
    --   max = vim.diagnostic.severity.WARN,
    -- },
    -- prefix = '',
    spacing = 2,
    format = function(diagnostic)
      -- Use shorter, nicer names for some sources:
      local special_sources = {
        ['Lua Diagnostics.'] = 'lua',
        ['Lua Syntax Check.'] = 'lua',
      }

      local message = ''
      -- local message = icons.diagnostics[vim.diagnostic.severity[diagnostic.severity]]
      if diagnostic.code then
        message = string.format('%s %s', message, diagnostic.code)
      end
      if diagnostic.source then
        message = string.format('%s[%s]', message, special_sources[diagnostic.source] or diagnostic.source)
      end

      if message == '' then
        message = diagnostic.message
      end

      return message .. ' '
    end,
  },
  float = {
    -- source = 'if_many',
    border = 'rounded',
    -- Show severity icons as prefixes.
    prefix = function(diag)
      local level = vim.diagnostic.severity[diag.severity]
      local prefix = '▍' .. string.format(' %s ', icons.diagnostics[level])
      return prefix, 'Diagnostic' .. level:gsub('^%l', string.upper)
    end,
    suffix = '',
  },
}

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'
vim.o.showmode = false
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.timeoutlen = 500
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = false
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 4
vim.o.cursorlineopt = 'number'
vim.o.laststatus = 3 -- global statusline
vim.o.termguicolors = true -- True color support
vim.o.jumpoptions = 'stack' -- Make jumplist more intuitive
vim.o.grepformat = '%f:%l:%c:%m'
vim.o.grepprg = 'rg --vimgrep'
vim.o.shiftround = true
-- vim.o.smartindent = true
-- vim.o.wrap = false
vim.o.confirm = true
vim.o.foldexpr = "v:lua.require'shared.fold'.foldexpr()"
vim.o.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.o.foldmethod = 'expr'
vim.o.foldtext = ''
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.fillchars = {
  eob = ' ',
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
}

--https://www.reddit.com/r/neovim/comments/1d9gzud/comment/l7e6akp/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- https://www.reddit.com/r/neovim/comments/1d9gzud/comment/l7igfe0/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- Remove comment token, because it conflicts with TS comment query.
vim.api.nvim_set_hl(0, '@lsp.type.comment.go', {})
-- Does nothing except coloring of string literal, but conflicts with regexp parser. Remove it.
vim.api.nvim_set_hl(0, '@lsp.type.string.go', {})
