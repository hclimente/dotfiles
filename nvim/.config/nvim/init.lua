if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    require 'plugins'
    require 'colorscheme'
    require 'keymaps'
    require 'lsp'
    require 'options'

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    require("nvim-tree").setup()
end
