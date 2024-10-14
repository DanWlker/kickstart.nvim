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
o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
o.inccommand = 'split'
o.cursorline = true
o.scrolloff = 10
o.relativenumber = true
o.fillchars = { eob = ' ' }
o.cursorlineopt = 'number'
o.list = false
