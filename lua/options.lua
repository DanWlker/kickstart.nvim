vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

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

vim.diagnostic.config { float = { border = 'rounded' } }
for type, icon in pairs(require 'shared.icons') do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = ' ' }
vim.opt.cursorlineopt = 'number'
vim.opt.laststatus = 3 -- global statusline
vim.opt.termguicolors = true -- True color support

local separator = '   '
vim.opt.statuscolumn = '%s%=%#LineNr4#%{(v:relnum >= 4)?v:relnum."'
  .. separator
  .. '":""}'
  .. '%#LineNr3#%{(v:relnum == 3)?v:relnum."'
  .. separator
  .. '":""}'
  .. '%#LineNr2#%{(v:relnum == 2)?v:relnum."'
  .. separator
  .. '":""}'
  .. '%#LineNr1#%{(v:relnum == 1)?v:relnum."'
  .. separator
  .. '":""}'
  .. '%#LineNr0#%{(v:relnum == 0)?v:lnum." '
  .. separator
  .. '":""}'
vim.api.nvim_set_hl(0, 'LineNr0', { fg = '#dedede' })
vim.api.nvim_set_hl(0, 'LineNr1', { fg = '#bdbdbd' })
vim.api.nvim_set_hl(0, 'LineNr2', { fg = '#9c9c9c' })
vim.api.nvim_set_hl(0, 'LineNr3', { fg = '#7b7b7b' })
vim.api.nvim_set_hl(0, 'LineNr4', { fg = '#5a5a5a' })
