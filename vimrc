" --------------------------------------------------
" Editor Settings
" --------------------------------------------------
set t_Co=256
set encoding=utf8
set nocompatible
syntax on
" set autoindent
set copyindent
set number
set ruler
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set backspace=indent,eol,start
set shiftround
set laststatus=2
set showcmd
set title
set wildmenu
set wildmode=list:full
set cmdheight=2
set scrolloff=2
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
set hidden
set showmode
set modelines=0
set noswapfile
set lazyredraw
set ttyfast
" set list
" set foldmethod=indent

set cursorline
hi CursorLine cterm=NONE ctermbg=black

"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

"画面最後の行をできる限り表示する。
set display+=lastline

set wildignore+=bin/*,vendors/*,vendor/*,log/*,tmp/*,spec/reports/*,reports/*,*.png,*.jpg,public/coverage/*,node_modules/*

" --------------------------------------------------------------------------------
" Search Settings
" --------------------------------------------------------------------------------
set ignorecase
set smartcase
set wrapscan
set gdefault
set incsearch
set hlsearch

set history=1000
set undolevels=1000

" --------------------------------------------------------------------------------
" Bell Settings
" --------------------------------------------------------------------------------
" set visualbell
set noerrorbells

set wrap
set textwidth=79
set formatoptions=qrn1
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM

nnoremap / /\v
vnoremap / /\v
nnoremap ; :
let mapleader=","
" nmap <silent> ,/ :let @/=""<CR>

vnoremap < <gv
vnoremap > >gv

" Re-select previously yanked section
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Replace word with yanked string
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" Esc x2 to remove highlight
nnoremap <ESC><ESC> :nohlsearch<CR>

" Change color of status line depending on mode
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Black ctermbg=LightGray cterm=None
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Black ctermbg=LightGray cterm=None
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" -----------------------------------------------------------------------------
" Vundle Settings
" -----------------------------------------------------------------------------
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'git://github.com/vim-scripts/linediff.vim.git'
Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" -----------------------------------------------------------------------------
" Command-T settings
" -----------------------------------------------------------------------------
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
nnoremap <silent> <Leader>r :CommandTFlush<CR>

let g:CommandTMatchWindowAtTop = 1
let g:CommandTMaxHeight = 30
let g:CommandTMaxFiles = 10000
let g:CommandTSuppressMaxFilesWarning=1
let g:CommandTMatchWindowReverse=0
let g:CommandTWildIgnore="*/bin/*,*/vendors/*,*/vendor/*,*/log/*,*/tmp/*,*/spec/reports/*,*/reports/*,*.png,*.jpg,*/public/coverage/*,*/node_modules/*"
