
call plug#begin('~/.vim/plugged')

  Plug 'preservim/nerdtree'

call plug#end()

let mapleader = "<Space>"


""""""""""" Keybindings

" General
nnoremap <leader>% :source ~/.config/nvim/init.vim

" NERDTree
nnoremap <C-p> :NERDTreeToggle<CR> 
nnoremap <C-f> :NERDTreeFind<CR> 

