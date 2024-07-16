-- This disables netrw, but unsure if will lead to issues, I commented out it cuz its set inside nvim tree now, disable_netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- vim.opt.colorcolumn = '80'

vim.opt.relativenumber = true
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('v', '<S-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<S-Down>', ":m '>+1<CR>gv=gv")
vim.opt.fillchars = { eob = ' ' }

vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>', { desc = 'if err != nil' })
vim.keymap.set('n', '<leader>ec', '^d$iif err := <Esc>pa; err != nil {<CR>}<Esc>Oreturn err<Esc>', { desc = 'if err := <line>; err != nil' })

if vim.g.neovide then
  vim.opt.cursorlineopt = 'number'
end
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#cdd6f4' })

vim.keymap.set('n', '<C-l>', '<C-^>')

-- Change cursor color based on vim mode
-- vim.cmd 'hi ModesNormal guibg=#f4dbd6'
-- vim.cmd 'hi ModesInsert guibg=#a6da95'
-- vim.cmd 'hi ModesVisual guibg=#c6a0f6'
-- vim.cmd 'hi ModesReplace guibg=#ed8796'
-- vim.opt.guicursor = 'n-o:block-ModesNormal,i:block-ModesInsert,v-ve:block-ModesVisual,r:block-ModesReplace,c-ci-cr-sm:block-lCursor'
