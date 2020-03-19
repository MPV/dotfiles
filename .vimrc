" ----- vundle start

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive' 	            " https://vimawesome.com/plugin/fugitive-vim
Plugin 'scrooloose/nerdtree' 	            " https://vimawesome.com/plugin/nerdtree-red
Plugin 'tpope/vim-surround'		            " https://vimawesome.com/plugin/surround-vim
Plugin 'kien/ctrlp.vim'				            " https://vimawesome.com/plugin/ctrlp-vim-red
Plugin 'airblade/vim-gitgutter'           " https://vimawesome.com/plugin/vim-gitgutter
"Plugin 'altercation/vim-colors-solarized' " https://vimawesome.com/plugin/vim-colors-solarized-ours
Plugin 'dracula/vim'											" https://draculatheme.com/vim/

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

" ----- vundle end

" ----- plugin config start:

" Ctrl+n triggers NERDTree
map <C-n> :NERDTreeToggle<CR>

" ----- plugin config end.

set background=dark
"colorscheme solarized
color dracula

" Make Vim more useful
"set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2

" Use highlight when searching
set hlsearch
