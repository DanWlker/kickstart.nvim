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
  -- virtual_lines = {
  --   current_line = true,
  --   severity = {
  --     min = vim.diagnostic.severity.ERROR,
  --   },
  -- },

  virtual_text = {
    source = 'if_many',
    -- severity = {
    --   max = vim.diagnostic.severity.WARN,
    -- },
    prefix = '',
    spacing = 2,
    format = function(diagnostic)
      -- Use shorter, nicer names for some sources:
      local special_sources = {
        ['Lua Diagnostics.'] = 'lua',
        ['Lua Syntax Check.'] = 'lua',
      }

      local message = icons.diagnostics[vim.diagnostic.severity[diagnostic.severity]]
      if diagnostic.source then
        message = string.format('%s %s', message, special_sources[diagnostic.source] or diagnostic.source)
      end
      if diagnostic.code then
        message = string.format('%s[%s]', message, diagnostic.code)
      end

      return message .. ' '
    end,
  },
  float = {
    source = 'if_many',
    border = 'rounded',
    -- Show severity icons as prefixes.
    prefix = function(diag)
      local level = vim.diagnostic.severity[diag.severity]
      local prefix = string.format(' %s ', icons.diagnostics[level])
      return prefix, 'Diagnostic' .. level:gsub('^%l', string.upper)
    end,
  },
}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.fillchars = { eob = ' ' }
vim.opt.cursorlineopt = 'number'
vim.opt.laststatus = 3 -- global statusline
vim.opt.termguicolors = true -- True color support
vim.opt.jumpoptions = 'stack' -- Make jumplist more intuitive
-- vim.opt.wrap = false
vim.opt.confirm = true

--https://www.reddit.com/r/neovim/comments/1d9gzud/comment/l7e6akp/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- https://www.reddit.com/r/neovim/comments/1d9gzud/comment/l7igfe0/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- Remove comment token, because it conflicts with TS comment query.
vim.api.nvim_set_hl(0, '@lsp.type.comment.go', {})
-- Does nothing except coloring of string literal, but conflicts with regexp parser. Remove it.
vim.api.nvim_set_hl(0, '@lsp.type.string.go', {})
