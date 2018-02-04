set nocompatible
filetype off " required

let mapleader=','
   
"Setup vundle
"For vundle to work, you must first use  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off "filetypes turned off initially for vundle setup

set rtp+=~/.vim/bundle/Vundle.vim "set vim runtime path to inclue vundle
call vundle#begin() "initialize vundle

    Plugin 'VundleVim/Vundle.vim' "have vundle manage vundle
    Plugin 'https://github.com/scrooloose/nerdtree.git' "nerdtree plugin
    Plugin 'https://github.com/jiangmiao/auto-pairs' "auto complete [{()}]

call vundle#end()

filetype plugin indent on "turn filetype autodetection back on
syntax on "turn syntax highlighting on

"NerdTree Settings
let NERDTreeShowHidden=1 "force nerdtree to show hidden files
let NERDTreeIgnore = ['\.swp$'] "hide .swp files
let NERDTreeMinimalUI=1 "hide Press ? for help
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "auto close NERDTree if only one tab open
autocmd StdinReadPre * let s:std_in=1 "Open NERDtree if no file specified
autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif " ^
map <F2> :NERDTreeToggle<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Miscellaneous settings
set number
set showmatch
set ruler
set visualbell
set wrap

