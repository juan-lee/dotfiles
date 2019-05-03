set nocompatible

if has('nvim')
  if empty(glob("$XDG_DATA_HOME/nvim/site/autoload/plug.vim"))
    silent !curl -fLo "$XDG_DATA_HOME/nvim/site/autoload/plug.vim" --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | UpdateRemotePlugins
  endif
  call plug#begin("$XDG_DATA_HOME/nvim/plugged")
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.vim/plugged')
endif

Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'honza/vim-snippets'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zchee/deoplete-go', { 'do': 'make'}

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" base16
if filereadable(expand("~/.vimrc_background"))
  set t_Co=256
  let base16colorspace=256
  source ~/.vimrc_background
endif

set noshowmode
set ignorecase
set smartcase
set number

" search
set inccommand=nosplit

" tabs
set tabstop=4
set shiftwidth=4
set expandtab

" vim-gitgutter
set updatetime=100

" undo
set undofile

" Don't show quickfix in buffer lists
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

" space leader
let mapleader = " "

" leader mappings
map <Leader>n :bn<CR>
map <Leader>p :bp<CR>
map <Leader>q :bd!<CR>
map <Leader>a :A<CR>
map <Leader>w <C-W>w
map <Leader>6 <C-^>

" deoplete/deoplete-go
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
set completeopt+=noinsert,noselect
set completeopt-=preview

" vim-airline
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
" let g:airline#extensions#tabline#buffer_nr_show = 1

" vim-go
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
" let g:go_auto_type_info = 0
let g:go_def_mode = "guru"
let g:go_info_mode = "guru"
let g:go_def_reuse_buffer = 1
let g:go_echo_command_info = 1
let g:go_gocode_autobuild = 1
let g:go_gocode_propose_builtins = 1
let g:go_gocode_propose_source = 1
let g:go_gocode_unimported_packages = 1
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 0
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'deadcode']
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_modifytags_transform = 'camelcase'

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  autocmd FileType go nmap <C-g> :GoDecls<cr>
  autocmd FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>

  " autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  " autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)

  " autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  " autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <Leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-test)
  autocmd FileType go nmap <silent> <Leader>r <Plug>(go-run)
  autocmd FileType go nmap <silent> <Leader>e <Plug>(go-install)
  autocmd FileType go nmap <silent> <Leader>d :GoDeclsDir<CR>

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" fzf
let g:fzf_layout = { 'down': '~50%' }
let g:fzf_buffers_jump = 1

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('right:50%')
      \                         : fzf#vim#with_preview('right:50%'),
      \                 <bang>0)

let g:fzf_commits_log_options = '--graph --color=always --format="%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(bold blue)<%an>%C(reset)" --abbrev-commit'

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

map <Leader>t :Files<CR>
map <Leader>T :GFiles<CR>
map <Leader>m :GFiles?<CR>
map <Leader>g :Rg!<Space>
map <Leader>G :Rg!<Space><C-r><C-w><CR>
map <Leader>u :Buffers<CR>

" vim-fugitive
map <Leader>s :Gstatus<CR>
" map <Leader>d :Gdiff<CR>

" vim-commentary
autocmd FileType terraform setlocal commentstring=#\ %s

" vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sh', 'go']
let g:markdown_syntax_conceal = 0

" vim-terraform
let g:terraform_fmt_on_save = 1
let g:terraform_align = 1

" wildmenu visibility
hi! link WildMenu airline_tabsel

" vim: ts=2 sw=2 et
