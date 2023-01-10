vim.g.mapleader = " "

-- git shortcuts
vim.keymap.set('n', '<leader>gca', '<cmd>Git commit --all<cr>')
-- vim.keymap.set('n', '<leader>gca', '<cmd>Git commit') -- FIXME: take an input
-- vim.keymap.set('n', '<leader>gco', '<cmd>Git checkout') -- FIXME: take an input
vim.keymap.set('n', '<leader>gd', '<cmd>Git diff<cr>')
vim.keymap.set('n', '<leader>gl', '<cmd>Git pull<cr>')
vim.keymap.set('n', '<leader>gst', '<cmd>Git status<cr>')

-- python
vim.keymap.set('n', '<leader>p', 'oimport pdb; pdb.set_trace()<Esc>')

-- telescope
vim.keymap.set('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')

