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
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set relativenumber
set guifont=DejaVuSansMono_Nerd_Font:h16
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest,full

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

" ---------- filetype ----------

filetype plugin indent on 

" ---------- plugins ----------
 
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier'
Plug 'moll/vim-node'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'joshdick/onedark.vim'
Plug 'NovaDev94/lightline-onedark'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'zivyangll/git-blame.vim'
Plug 'SirVer/ultisnips'
Plug 'Ivo-Donchev/vim-react-goto-definition'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'yggdroot/indentline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cohama/lexima.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kshenoy/vim-signature'

call plug#end()

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
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["/Users/davidsttivend/.vim/UltiSnips", "UltiSnips"]
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
let g:prettier#autoformat = 1
let g:ale_fixers = {'javascript': ['eslint', 'prettier']}
let g:ale_fix_on_save = 1
let g:vim_json_syntax_conceal = 0

let g:indentLine_char = 'c'
let g:indentLine_char_list = ['⎸']
let g:lexima_enable_newline_rules = 1

"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" --------- Leader ---------

let mapleader = "\<Space>"

"---------- NerdTree ---------

highlight NERDTreeCWD ctermfg=white

"---------- Mapping ---------

nnoremap <C-o> :NERDTreeToggle<CR> 
nnoremap <C-f> :NERDTreeFind<CR> 
nnoremap <leader>o :GFiles<CR>
nnoremap <leader>f :Ag 
nnoremap <leader>s :<C-u>call gitblame#echo()<CR>
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

"nnoremap <c-h> <c-w>h 
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
"nnoremap <c-l> <c-w>l
cnoremap <expr> %% getcmdtype() ==# ':' ? fnameescape(expand('%:h')) . '/' : '%%'

" ---------- Folds ----------

nnoremap <leader>c zfiB

" ---------- Theme ----------

syntax on
colorscheme onedark

" ---------- Calls ----------

call lexima#add_rule({'char': "'", 'input_after': "'", 'filetype': 'javascript'})

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

