--Remap space as leader key
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
-- Telescope Mappings
vim.api.nvim_set_keymap('n', '<Leader>e', ':Telescope file_browser<cr>', {noremap = true, silent = true})
