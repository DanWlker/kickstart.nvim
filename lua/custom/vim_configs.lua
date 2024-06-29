-- This disables netrw, but unsure if will lead to issues
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.colorcolumn = '80'

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('v', '<S-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<S-Down>', ":m '>+1<CR>gv=gv")

-- Change cursor color based on vim mode
-- vim.cmd 'hi ModesNormal guibg=#f4dbd6'
-- vim.cmd 'hi ModesInsert guibg=#a6da95'
-- vim.cmd 'hi ModesVisual guibg=#c6a0f6'
-- vim.cmd 'hi ModesReplace guibg=#ed8796'
-- vim.opt.guicursor = 'n-o:block-ModesNormal,i:block-ModesInsert,v-ve:block-ModesVisual,r:block-ModesReplace,c-ci-cr-sm:block-lCursor'
