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
set shell=/bin/bash
set nowrap
set nohlsearch
set scrolloff=8

set rtp+=/usr/local/opt/fzf

" ---------- filetype ----------

filetype plugin indent on 

" ---------- plugins ----------
 
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
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
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'yggdroot/indentline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kshenoy/vim-signature'
Plug 'schickling/vim-bufonly'
Plug 'Shougo/unite.vim'
Plug 'devjoe/vim-codequery'
Plug 'stsewd/fzf-checkout.vim'
Plug 'ruanyl/vim-sort-imports'
Plug 'kristijanhusak/vim-js-file-import', { 'do': 'npm install' }
Plug 'easymotion/vim-easymotion'
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-endwise'
Plug 'pantharshit00/vim-prisma'

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
" ---------- NerdTree ----------
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 40 
" ---------- UltiSnips ----------
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/workspace/Dot-Files/UltiSnips"
"let g:UltiSnipsSnippetDirectories=["/Users/davidsttivend/.vim/UltiSnips", "UltiSnips"]
" ---------- Emmet ----------
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
" ---------- Prettier ----------
"let g:prettier#autoformat = 1

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.svg PrettierAsync
autocmd FileType javascript,javascriptreact,typescript,typescriptreact
  \ UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact
" ---------- Ale ----------
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_linters = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
let g:vim_json_syntax_conceal = 0
" ---------- Vim Indent ----------
let g:indentLine_char = 'c'
let g:indentLine_char_list = ['⎸']
" ---------- FZF ----------
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS = '--reverse'
" --------- Leader ---------

let mapleader = "\<Space>"

let g:coc_node_path = '/Users/david.sttivend/.nvm/versions/node/v17.8.0/bin/node'

"---------- NerdTree ---------

highlight NERDTreeCWD ctermfg=white


autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

"---------- Mapping ---------

nnoremap <C-p> :NERDTreeToggle<CR> 
nnoremap <C-f> :NERDTreeFind<CR>zz
vnoremap <leader>s :'<,'>sort<CR>
" search
nnoremap <leader>o :GFiles<CR>
nnoremap <leader>f :Ag 
nnoremap <silent> <Leader>* :Ag <C-R><C-W><CR>
" jumping
noremap <leader>gd :call CocActionAsync('jumpDefinition')<CR>
noremap <leader>gr :call CocActionAsync('jumpReferences')<CR>
" git
nnoremap <leader>G :GBranches<CR>
nnoremap <leader>gs :G<CR>
" buffer switching
nnoremap <leader>w <c-w>w
nnoremap <leader>N :bp<CR>
nnoremap <leader>p :Prettier<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>d :bun<CR>
nnoremap <leader>x :bd<CR>

cnoremap <expr> %% getcmdtype() ==# ':' ? fnameescape(expand('%:h')) . '/' : '%%'

nnoremap <leader>% :source ~/.vimrc<CR>


" ---------- Folds ----------

nnoremap <leader>c zfiB

" ---------- Theme ----------

syntax on
colorscheme onedark

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

