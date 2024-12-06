local map = vim.keymap.set
map('n', '<Esc>', function()
  if package.loaded['notify'] then
    require('notify').dismiss()
  end
  vim.cmd 'nohlsearch'
end)
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', 'Q', '<nop>')
map('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
map('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })
map('n', '<C-Left>', '<C-w>h', { desc = 'Switch Window Left' })
map('n', '<C-Right>', '<C-w>l', { desc = 'Switch Window Right' })
map('n', '<C-Down>', '<C-w>j', { desc = 'Switch Window Down' })
map('n', '<C-Up>', '<C-w>k', { desc = 'Switch Window Up' })
map('n', '<M-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<M-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<M-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<M-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Don't cancel me
map('n', 'h', '<nop>') -- this is now mapped to flash nvim, thinking of binding f to flash and freeing up t
map('n', 'j', '<nop>') -- this is now mapped for jj, js, jt, I don't know what to do with the default j
map('n', 'k', '<nop>')
map('n', 'l', '<nop>')
-- map('n', 'S', "m'a<CR><Esc>`'")
map('n', 'S', 'a<CR><Esc>')
map('n', 'yc', 'yy<cmd>normal gcc<cr>p')
