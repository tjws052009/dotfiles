" --------------------------------------------------
" Editor Settings
" --------------------------------------------------
set t_Co=256
set encoding=utf8
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
set autoindent
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

autocmd FileType php,ctp set tabstop=4
autocmd FileType php,ctp set shiftwidth=4
autocmd FileType php,ctp set softtabstop=4

set cursorline
hi CursorLine cterm=NONE ctermbg=black

"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

"画面最後の行をできる限り表示する。
set display+=lastline

set wildignore+=bin/*,vendors/*,vendor/*,log/*,tmp/*,spec/reports/*,reports/*,*.png,*.jpg,public/coverage/*

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
set visualbell
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

" --------------------------------------------------
" Some useful autocmds
" --------------------------------------------------
" augroup grepopen
"   autocmd!
"   autocmd QuickfixCmdPost vimgrep cw
" augroup END

augroup templageload
  autocmd!
  autocmd BufNewFile *.html 0r ~/.vim/template/skeleton.html
  autocmd BufNewFile *.rb 0r ~/.vim/template/skeleton.rb
augroup END

" ------------------------------------------------
" Vundle
" ------------------------------------------------

filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle plugins
" Bundle 'project.tar.gz'
Bundle 'gmarik/vundle'
" Bundle 'git://github.com/vim-scripts/linediff.vim.git'
" Bundle 'bufexplorer.zip'
" Bundle 'sudo.vim'
" Bundle 'git://github.com/Shougo/vimfiler.git'
" Bundle 'git://github.com/Shougo/unite.vim.git'
" Bundle 'BlockDiff'
" Bundle 'DirDiff.vim'
" Bundle 'ShowMarks'
" Bundle 'DrawIt'
Bundle 'Command-T'
" Bundle 'The-NERD-tree'
" Bundle 'EasyMotion'
" Bundle 'Align'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'kien/ctrlp.vim'
" Bundle 'tpope/vim-fugitive'
" Bundle 'gitv'
" Bundle 'kchmck/vim-coffee-script'
" Bundle 'groenewege/vim-less'


filetype plugin indent on

" source ~/.vim/bundle/project.tar.gz/plugin/project.vim

" --------------------------------------------------
" Project.vim settings
" --------------------------------------------------
" Default with open directories
" autocmd BufAdd .vimprojects silent! %foldopen!

" " Close project when file is chosen
" let g:proj_flags = "imstc"
" 
" " <Leader>P will toggle project window
" nmap <silent> <Leader>p <Plug>ToggleProject
" 
" " <Leader>p opens default project
" nmap <silent> <Leader>P :Project<CR>
" 
" " git add
" let g:proj_run1='!git add %f'
" let g:proj_run_fold1='*!git add %f'
" 
" " git checkout
" let g:proj_run2='!git checkout -- %f'
" let g:proj_run_fold2='*!git checkout -- %f'
" 
" " git status
" let g:proj_run3='!git status'
" 
" " if getcwd() != $HOME
" "   if filereadable(getcwd(). '/.vimprojects')
" "     Project .vimprojects
" "   endif
" " endif

" -----------------------------------------------
" Other settings
" -----------------------------------------------
" nmap <silent> <Leader>f :VimFiler<CR>
" nmap <silent> <Leader>u :Unite buffer file_mru file<CR>

inoremap <Right> <Nop>
" inoremap <Left> <Nop> " 追記：日本語入力時に誤動作する
inoremap <Up> <Nop>
inoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

" Show marks 
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" ShowMarks color
highlight ShowMarksHLl gui=bold guibg=Black guifg=LightBlue cterm=bold ctermbg=Black ctermfg=LightBlue
highlight ShowMarksHLu gui=bold guibg=Black guifg=LightBlue cterm=bold ctermbg=Black ctermfg=LightBlue
highlight ShowMarksHLm gui=bold guibg=Black guifg=LightBlue cterm=bold ctermbg=Black ctermfg=LightBlue
highlight ShowMarksHLo gui=bold guibg=Black guifg=LightBlue cterm=bold ctermbg=Black ctermfg=LightBlue
highlight Visual cterm=bold,underline guibg=none ctermbg=0
highlight Search cterm=bold,underline guibg=none ctermbg=0

" ---------------------------------------------------------------------- 
" Unite.vim settings 
" ---------------------------------------------------------------------- 
"let g:unite_enable_start_insert = 1

" -----------------------------------------------------------------------------
" Command-T settings
" -----------------------------------------------------------------------------
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
nnoremap <silent> <Leader>r :CommandTFlush<CR>
nmap <silent> <Leader>n :NERDTreeToggle<CR>

let g:CommandTMatchWindowAtTop = 1
let g:CommandTMaxHeight = 30
let g:CommandTMaxFiles = 10000

" let g:Powerline_symbols = 'fancy'

" -----------------------------------------------------------------------------
" Ctrl-P settings
" -----------------------------------------------------------------------------
" let g:ctrlp_use_migemo          = 1
" let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
" let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
" let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

" http://blog.remora.cx/2011/08/display-invisible-characters-on-vim.html
" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
  " PODバグ対策
  syn sync fromstart

  function! ActivateInvisibleIndicator()
    " 下の行の"　"は全角スペース
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
    syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
    highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
    syntax match InvisibleTab "\t" display containedin=ALL
    highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
  endfunction

  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif
