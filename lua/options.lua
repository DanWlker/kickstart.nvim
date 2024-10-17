local o = vim.opt
o.number = true
o.mouse = 'a'
o.showmode = false
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
o.list = false
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
o.inccommand = 'split'
o.cursorline = true
o.scrolloff = 10
o.relativenumber = true
o.fillchars = { eob = ' ' }
o.cursorlineopt = 'number'

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
vim.cmd 'highlight LineNr0 guifg=#dedede'
vim.cmd 'highlight LineNr1 guifg=#bdbdbd'
vim.cmd 'highlight LineNr2 guifg=#9c9c9c'
vim.cmd 'highlight LineNr3 guifg=#7b7b7b'
vim.cmd 'highlight LineNr4 guifg=#5a5a5a'
