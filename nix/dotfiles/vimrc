set nocompatible

set bg=dark
set hidden
set undofile
set noswapfile
set noshowmode
set number
set showmatch
set nofoldenable

" completion
set completeopt=menu,menuone,noselect
set shortmess+=c

" search
set hlsearch
set ignorecase
set incsearch
set smartcase
nnoremap n nzzzv
nnoremap N Nzzzv

" indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" space leader
let mapleader = " "

" leader mappings
map <Leader>n :bn<CR>
map <Leader>p :bp<CR>
map <Leader>w :bp \| bd #<CR>
map <Leader>a :A<CR>
map <Leader>6 <C-^>

" window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" fast quit
map <Leader>q :q!<CR>

" netrw
let g:netrw_fastbrowse = 0

" filetype markdown
autocmd FileType markdown setlocal textwidth=100
autocmd FileType markdown setlocal spell spelllang=en_us

" diff
set diffopt+=context:1000,vertical

" starting in diff
if &diff
  set diffopt+=context:1000,vertical
  set noswapfile
  au BufEnter,BufNew * if &diff | syntax off | endif
  map <Leader>q :qa<CR>
endif

" Don't show quickfix in buffer lists
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

" vim: ts=2 sw=2 et
