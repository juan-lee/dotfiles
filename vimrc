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

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mmarchini/bpftrace.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rafamadriz/friendly-snippets'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

set hidden
set noswapfile
set noshowmode
set ignorecase
set smartcase
set smartindent
set number
set showmatch

" search
set inccommand=nosplit
nnoremap n nzzzv
nnoremap N Nzzzv

" tabs
set tabstop=4
set shiftwidth=4
set expandtab

" vim-gitgutter
set updatetime=100

" undo
set undofile

" never fold
set nofoldenable

set maxmempattern=5000

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
map <Leader>w :bp \| bd #<CR>
map <Leader>a :A<CR>
map <Leader>6 <C-^>

" tabs
nmap <S-Tab> :tabprev<CR>
nmap <Tab> :tabnext<CR>
nmap te :tabe

" windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" fast quit
map <Leader>q :q!<CR>

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=750}

" netrw
let g:netrw_fastbrowse = 0

" vim-airline
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0

" vim-go
let g:go_fmt_fail_silently = 0
" let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_def_mode = "gopls"
let g:go_info_mode = "gopls"
let g:go_def_reuse_buffer = 1
let g:go_echo_command_info = 1
let g:go_term_enabled = 0
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
let g:go_metalinter_command = 'golangci-lint'
let g:go_test_timeout = '30s'

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
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <Leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-test)
  autocmd FileType go nmap <silent> <Leader>X <Plug>(go-test-func)
  " autocmd FileType go nmap <silent> <Leader>r <Plug>(go-run)
  autocmd FileType go nmap <silent> <Leader>e <Plug>(go-install)
  autocmd FileType go nmap <silent> <Leader>d :GoDeclsDir<CR>

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
  autocmd FileType go let b:go_fmt_options = {
    \ 'goimports': '-local ' .
      \ trim(system('{cd '. shellescape(expand('%:h')) .' && go list -m;}')),
    \ }
augroup END

" fzf
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_buffers_jump = 1

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:70%')
      \                         : fzf#vim#with_preview('up:70%:hidden', '?'),
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

" markdown-preview
let g:mkdp_browser = 'Google Chrome'

" filetype markdown
autocmd FileType markdown setlocal textwidth=100
autocmd FileType markdown setlocal spell spelllang=en_us

" vim-terraform
let g:terraform_fmt_on_save = 1
let g:terraform_align = 1

" wildmenu visibility
hi! link WildMenu airline_tabsel

" diff
set diffopt+=context:1000,vertical

" starting in diff
if &diff
  set diffopt+=context:1000,vertical
  set noswapfile
  au BufEnter,BufNew * if &diff | syntax off | endif
  map <Leader>q :qa<CR>
endif

" easymotion

" Move to line
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>lr <cmd>Telescope lsp_references<cr>
nnoremap <leader>li <cmd>Telescope lsp_implementations<cr>
nnoremap <leader>ld <cmd>Telescope lsp_definitions<cr>

" vim: ts=2 sw=2 et
