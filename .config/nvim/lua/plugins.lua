-- autoinstall packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
        return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    use {'numToStr/Comment.nvim',
         config = function() require('Comment').setup() end
    }
    use {'github/copilot.vim', branch = 'release'}
    use {'ms-jpq/coq_nvim', branch = 'coq'}
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
    use {'ms-jpq/coq.thirdparty', branch = '3p'}
    use {'lewis6991/gitsigns.nvim',
         config = function() require('gitsigns').setup() end,
    }
    use 'morhetz/gruvbox'
    use {'nvim-treesitter/nvim-treesitter',
         run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'karb94/neoscroll.nvim'
    use 'Mxrcon/nextflow-vim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use {'nvim-neorg/neorg',
         config = function()
             require('neorg').setup {
                 load = {
                    ["core.defaults"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                work = "~/projects/notes",
                            }
                        }
                    }
                }
            }
         end,
         requires = "nvim-lua/plenary.nvim"
    }
	use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'tpope/vim-fugitive'
    use 'farmergreg/vim-lastplace'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

    vim.g.coq_settings = { auto_start = 'shut-up' }
    require 'coq'

    require 'nvim-treesitter.install'.compilers = {'gcc'}
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "norg", "python", "r" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
        },
    }

    require('neoscroll').setup()

end)

