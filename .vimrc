set incsearch
set ignorecase
set smartcase
set laststatus=2
set hidden
set number
set completeopt-=preview
set clipboard=unnamedplus,unnamed
set splitright 
set splitbelow 
set autochdir
set autoindent

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

" ---------- filetype ----------

filetype plugin indent on 

" ---------- plugins ----------
 
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins

Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-syntastic/syntastic'
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
Plugin 'dracula/vim'
Plugin 'joshdick/onedark.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'cohama/lexima.vim'
Plugin 'zxqfl/tabnine-vim'
Plugin 'mattn/emmet-vim'

call vundle#end()            " required

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
map <leader>o :GFiles<CR>

nnoremap <CR> :nohlsearch<cr>
" window switching
nnoremap <leader>w <c-w>w
nnoremap <leader>N :bp<CR>
nnoremap <leader>p :Prettier<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>d :bd<CR>

nnoremap <c-h> <c-w>h 
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l


" ---------- Theme ----------

syntax on
colorscheme onedark

call lexima#add_rule({'char': "'", 'input_after': "'", 'filetype': 'javascript'})

