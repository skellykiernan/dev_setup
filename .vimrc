set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/taglist.vim'
" For snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Ag grep like
Plugin 'rking/ag.vim'
" Mako Syntax
Plugin 'sophacles/vim-bundle-mako'
" Fuzzy file searcher
Plugin 'kien/ctrlp.vim'
" Tabularize and Markdown Support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Plugin 'tpope/vim-markdown'
" Indent Guides
Plugin 'nathanaelkane/vim-indent-guides'
" Airline status
Plugin 'bling/vim-airline'
" Commenter
Plugin 'scrooloose/nerdcommenter'
" color schemes
" Plugin 'altercation/vim-colors-solarized'
" diff a directory
Plugin 'DirDiff.vim'
" undo tree
Plugin 'mbbill/undotree'
" for semaless pane naviagtion with tmux 
Plugin 'christoomey/vim-tmux-navigator'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"The basic settings
set nocp
set ls=2
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set number
set relativenumber
set ignorecase
set modeline
set smartindent
set hlsearch
set incsearch
set nobackup
set noswapfile
set wrap
set hidden
set backspace=indent,eol,start

"Syntax highlighting
syntax on

"Mapped some FUNCTION keys to be more useful..
map <F7> :make<Return>:copen<Return>
map <F8> :cprevious<Return>
map <F9> :cnext<Return>

"This is a nice buffer switcher
:nnoremap <F5> :buffers<CR>:b<Space>


"You can change colors easily in vim.
"Just type <ESC>:colorscheme and then TAB complete through the options
" adjust vim for 256 color scheme
let &t_Co=256
colorscheme desert
set background=dark

"TAGLIST setup
nnoremap <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50
