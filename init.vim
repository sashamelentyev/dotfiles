call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

set bg=dark
colorscheme gruvbox

set number
set relativenumber
