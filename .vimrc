" from https://www.youtube.com/watch?v=n9k9scbTuvQ
syntax on

set smartindent
set nu
set incsearch
let mapleader = " "

"" 80 char column
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"" file explorer options
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" source of many of the commands: https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" remap jj to esc
:imap jj <Esc>

" plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'LukeGoodsell/nextflow-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'lervag/vimtex'
Plug 'farmergreg/vim-lastplace'
Plug 'vim-airline/vim-airline'

call plug#end()

let g:tex_flavor = 'latex'

" fuzzy search
nmap <C-P> :FZF<CR>

" theme
colorscheme gruvbox
set background=dark

" mappings
map <leader>rn :set rnu!<cr>
nnoremap <leader>p oimport pdb; pdb.set_trace()<Esc>
