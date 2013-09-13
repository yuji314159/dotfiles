" users generic .zshrc file for zsh(1)

" for Vim
set nocompatible

" view
set number
set ruler
set wrap
set textwidth=0
set colorcolumn=80
autocmd WinEnter * set cursorline cursorcolumn
autocmd WinLeave * set nocursorline nocursorcolumn
set showmatch
set matchpairs+=<:>
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set ambiwidth=double
set scrolloff=4

" edit
"set paste
set backspace=indent,eol,start
set whichwrap=b,s
set clipboard+=unnamed,unnamedplus

" file
set hidden
set confirm
set autoread
set nobackup
set nowritebackup
set noswapfile

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
autocmd FileType ruby setlocal sw=2 sts=2
autocmd FileType yaml setlocal sw=2 sts=2
"autocmd FileType make setlocal noexpandtab

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
nnoremap <C-h> :<C-u>help<Space><C-r><C-w><Enter>
vnoremap <C-p> "0p<CR>

" zenkaku-space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue gui=underline guifg=lightblue
match ZenkakuSpace /　/

" plugins
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" general
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/lightline.vim'

" for Web Development
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'

" color scheme
NeoBundle 'tomasr/molokai'

filetype plugin indent on
NeoBundleCheck

" lightline.vim
let g:lightline = {
            \'colorscheme': 'wombat',
            \ }

