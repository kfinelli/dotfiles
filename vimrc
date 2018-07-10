" Vim5 and later versions support syntax highlighting. Uncommenting the
" " following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" " reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set textwidth=80
set formatoptions=cq
" highlight overlength lines
" set colorcolumn=+1
" highlight ColorColumn ctermbg=grey ctermfg=darkgrey

set showmatch
set incsearch
set hlsearch

" current line displays abs line number, others show relative
set number
" set relativenumber

set autoindent
set ignorecase
set background=dark

set ruler
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=4

set t_Co=256

set belloff=all

" tab completion 'bash-like'
set wildmode=longest,list
