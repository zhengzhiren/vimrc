set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'elzr/vim-json'
Plugin 'Mark'
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'a.vim'
Plugin 'Blackrush/vim-gocode'


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


set ruler

set tabstop=4
set shiftwidth=4

" line number
set number        

" always show status line
set laststatus=2

" highlight search
set hlsearch        

" <leader>
let mapleader = ","    

if has("gui_running")
	" highlight current line
	set cursorline
	" Set to fullscreen when GVim started
	if has("win32")
		au GUIEnter * simalt ~x
	endif
endif

" golang
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
if exists("g:did_load_filetypes")
	filetype off
	filetype plugin indent off
endif
set runtimepath+=/home/zhengzr/go/misc/vim " replace $GOROOT with the output of: go env GOROOT
filetype plugin indent on
syntax on
"autocmd BufWritePre *.go :Fmt
autocmd FileType go autocmd BufWritePre <buffer> Fmt
