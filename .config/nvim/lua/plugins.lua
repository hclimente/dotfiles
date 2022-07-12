-- autoinstall packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

packer = require('packer')
packer.startup(function()

    use {'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end,
    }
    use 'morhetz/gruvbox'
    use {'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'nvim-neorg/neorg'
    use 'Mxrcon/nextflow-vim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'wbthomason/packer.nvim'
	use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'tpope/vim-fugitive'
    use 'farmergreg/vim-lastplace'

end)

-- Plug 'neoclide/coc.nvim', {'branch': 'release'}
-- Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
-- Plug 'lervag/vimtex'
-- Plug 'vim-airline/vim-airline'
-- Plug 'vim-airline/vim-airline-themes'
-- Plug 'airblade/vim-gitgutter'

require 'nvim-treesitter.install'.compilers = {'gcc'}
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "r" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
