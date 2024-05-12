-- This disables netrw, but unsure if will lead to issues
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.colorcolumn = '80'

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('v', '<S-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<S-Down>', ":m '>+1<CR>gv=gv")
