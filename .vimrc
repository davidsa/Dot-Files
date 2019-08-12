" ---------- set ----------
set nocompatible              " be iMproved, required
set encoding=utf-8
set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set hidden
set number
set completeopt-=preview
set clipboard=unnamedplus,unnamed

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

" ---------- filetype ----------

filetype off                  " required
filetype plugin on
filetype plugin indent on    " required

" ---------- plugins ----------
 
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins

Plugin 'itchyny/lightline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'prettier/vim-prettier'
Plugin 'moll/vim-node'
Plugin 'sjbach/lusty'
Plugin 'junegunn/fzf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'leafgarland/typescript-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'joshdick/onedark.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'

call vundle#end()            " required

" ---------- Theme ----------

syntax on
colorscheme onedark

" ---------- let ----------

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:ycm_add_preview_to_completeopt = 0

" --------- Leader ---------

let mapleader = "\<Space>"

" ---------- Mapping ---------

map <C-o> :NERDTreeToggle<CR> 

nnoremap <CR> :nohlsearch<cr>
" window switching
nnoremap <leader>w <c-w>w
nnoremap <leader>b :bp<CR>

nnoremap <c-h> <c-w>h 
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
