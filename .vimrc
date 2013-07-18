" for Vim
set nocompatible

" editor
set number
set ruler
set wrap
set textwidth=0
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set showmatch
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set ambiwidth=double
set backspace=indent,eol,start
set whichwrap=b,s
set scrolloff=4

" file
set hidden
set confirm
set autoread
set backup
set writebackup
set swapfile

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault

" commandline
set showcmd
set showmode
set cmdheight=2
set laststatus=2
set wildmenu
set wildmode=list:longest,full
set history=10000

" tab/indent
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set paste
au FileType ruby setlocal sw=2 sts=2
au FileType yaml setlocal sw=2 sts=2

" misc
set clipboard+=unnamed,unnamedplus

" zenkaku-space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue gui=underline guifg=lightblue
match ZenkakuSpace /　/

" keymap
inoremap <C-c> <ESC>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>
vnoremap <C-p> "0p<CR>

" for NeoBundle
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Lokaltog/powerline'
NeoBundle 'surround.vim'

" for Web Development
NeoBundle 'ZenCoding.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'

NeoBundle 'tomasr/molokai'

filetype plugin indent on

