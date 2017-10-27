"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim')
  call dein#begin('~/.config/nvim')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/nvim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  " nvim only
  if has('nvim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('zchee/deoplete-go', {'build': 'make'})
  endif
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('fatih/vim-go')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('joshdick/onedark.vim')
  call dein#add('mhartington/nvim-typescript')
  call dein#add('mileszs/ack.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('SirVer/ultisnips')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('vim-syntastic/syntastic')

  " You can specify revision/branch/tag.
  "call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
syntax enable
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" onedark.vim
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

let g:onedark_terminal_italics=1

colorscheme onedark
set background=dark

set nowrap
set ic
set smartcase
set et
set ts=4
set sw=4
set dir=$HOME/.vim/temp
set bdir=$HOME/.vim/backup
set hlsearch
set incsearch

map <leader>f :bn<CR>
map <leader>d :bp<CR>

" autochdir
"autocmd BufEnter * silent! lcd %:p:h
autocmd BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif

" dein
"nnoremap <leader>du :call dein#update()<cr>

" python
let g:python_host_prog = $HOME . '/.pyenv/versions/pyneovim/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/py3neovim/bin/python'

" deoplete
let g:deoplete#enable_at_startup = 1
"set completeopt-=preview " hide preview window
autocmd CompleteDone * silent! pclose! " close preview window after complete
set splitbelow " preview window on the bottom

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" deopoete-go
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" vim-go
let g:go_list_type = "quickfix""
"let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
"let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1

set autowrite
set updatetime=100

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <Leader>a <Plug>(go-alternate-edit)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

