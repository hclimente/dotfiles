" from https://www.youtube.com/watch?v=n9k9scbTuvQ
syntax on

set smartindent
set nu
set incsearch
let mapleader = " "

"" black's 88 char column
set colorcolumn=88
highlight ColorColumn ctermbg=0 guibg=lightgrey

"" display relative line numbers
set relativenumber

"" file explorer options
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" source of many of the commands: https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" noexpandtab:      When this option is enabled, vi will not replace tabs by spaces
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set noexpandtab

" remap jj to esc
:imap jj <Esc>

" install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'Mxrcon/nextflow-vim'
Plug 'lervag/vimtex'
Plug 'farmergreg/vim-lastplace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

call plug#end()

let g:airline_powerline_fonts = 1
let g:tex_flavor = 'latex'

" fuzzy search
nmap <C-P> :FZF<CR>

" theme
colorscheme gruvbox
set background=dark

" mappings
map <leader>rn :set rnu!<cr>
nnoremap <leader>p oimport pdb; pdb.set_trace()<Esc>
