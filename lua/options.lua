local o = vim.opt
o.number = true
o.mouse = 'a'
o.showmode = false

local function isEmpty(s)
  return s == nil and s == ''
end

if not isEmpty(vim.env.WSL_INTEROP) or not isEmpty(vim.env.WSL_DISTRO_NAME) then
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

vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)
o.breakindent = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = 'yes'
o.updatetime = 250
o.timeoutlen = 500
o.splitright = true
o.splitbelow = true
o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
o.inccommand = 'split'
o.cursorline = true
o.scrolloff = 10
o.relativenumber = true
o.fillchars = { eob = ' ' }
if vim.g.neovide then
  o.cursorlineopt = 'number'
end
o.list = false
