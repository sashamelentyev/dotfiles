call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
call plug#end()

set bg=dark
colorscheme gruvbox

set number
set relativenumber
