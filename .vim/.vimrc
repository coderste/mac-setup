syntax on
set number
set nowrap
set encoding=utf8
set mouse=a

"""" Start Vundle configuration
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle will manage... Vundle... required :confused:
Plugin 'VundleVim/Vundle.vim'

" Generic Programming
Plugin 'tomtom/tcomment_vim'

" OSX stupid backspace fix
set backspace=indent,eol,start

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
