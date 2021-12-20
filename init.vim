if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd!
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
  Plug 'dracula/vim'
  Plug 'fatih/vim-go'
call plug#end()

set background=dark
colorscheme dracula

syntax on
