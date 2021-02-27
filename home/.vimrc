" vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

Plug 'junegunn/vim-easy-align'

" so you can get help
Plug 'junegunn/vim-plug'

" other plugs
" syntax
Plug 'scrooloose/syntastic'
Plug 'fatih/vim-go'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'hdima/python-syntax'
Plug 'vim-scripts/bash-support.vim'
Plug 'pprovost/vim-ps1'
Plug 'elzr/vim-json'
Plug 'vhdirk/vim-cmake'
Plug 'catalinciurea/perl-nextmethod'
Plug 'chiel92/vim-autoformat'
Plug 'othree/xml.vim'
Plug 'moll/vim-node'

" code completion
"Plug 'valloric/youcompleteme'
Plug 'ervandew/supertab'

" use
Plug 'junegunn/limelight.vim'

"style
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
"Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
"Plug 'joshdick/onedark.vim'
"Plug 'altercation/vim-colors-solarized'

" file managent
Plug 'janko-m/vim-test'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'editorconfig/editorconfig-vim'

" full url loading
"
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'


call plug#end()

" THEME
set background=dark
colorscheme dracula
set encoding=UTF-8

" show number lines
set number
syntax enable
set laststatus=2
set wildmenu
set title

" mouse and cursor
set mouse=a
set guicursor+=n:hor20-Cursor/lCursor

set history=1000

set shell=bash
"set spell

" other settings i use
"set wrap
set linebreak
set foldmethod=indent

set hlsearch
set ignorecase

"set complete-=x

set expandtab
filetype plugin indent on
set autoindent
set smarttab
set tabstop=4


" NERDtree
"autocmd StdinReadPre * let s:std_in=
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists(s:std_in) | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" CUSTOM KEY BINDINGS
" *******************************
"
" Enable NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Move lines
" Normal mode
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

" Insert mode
inoremap <A-j> <ESC>:m .+1<CR>==gi
inoremap <A-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
