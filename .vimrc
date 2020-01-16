set encoding=UTF-8
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
set autoindent
set shiftwidth=2
set conceallevel=0
set relativenumber
set guifont=DejaVuSansMono_Nerd_Font:h16
set backspace=indent,eol,start

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
Plugin 'mattn/emmet-vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'zivyangll/git-blame.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Ivo-Donchev/vim-react-goto-definition'
Plugin 'itchyny/vim-gitbranch'
Plugin 'tpope/vim-fugitive'
Plugin 'dense-analysis/ale'
Plugin 'ternjs/tern_for_vim'
Plugin 'ap/vim-css-color'
Plugin 'ryanoasis/vim-devicons'
 
call vundle#end()            " required

" ---------- let ----------
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 40 
let g:ycm_add_preview_to_completeopt = 0
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
let g:prettier#autoformat = 0

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" --------- Leader ---------

let mapleader = "\<Space>"

" ---------- Mapping ---------

nnoremap <C-o> :NERDTreeToggle<CR> 
nnoremap <C-f> :NERDTreeFind<CR> 
nnoremap <leader>o :GFiles<CR>
nnoremap <leader>f :Ag 
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
nnoremap <silent> <Leader>* :Ag <C-R><C-W><CR>
nnoremap <CR> :nohlsearch<cr>
noremap <leader>g :call ReactGotoDef()<CR>
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
cnoremap <expr> %% getcmdtype() ==# ':' ? fnameescape(expand('%:h')) . '/' : '%%'

" ---------- Theme ----------

syntax on
colorscheme onedark

call lexima#add_rule({'char': "'", 'input_after': "'", 'filetype': 'javascript'})
