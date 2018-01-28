set nocompatible
filetype off

let mapleader=','

" For plugins to load correctly
filetype plugin indent on

" Security
 set modelines=0

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'  
Plugin 'https://github.com/scrooloose/nerdtree.git' "nerdtree plugin
autocmd vimenter * NERDTree
Plugin 'https://github.com/jiangmiao/auto-pairs' "auto complete [{()}]
Plugin 'scrooloose/nerdcommenter'
Plugin 'https://github.com/altercation/vim-colors-solarized'
Plugin 'quramy/vim-js-pretty-template' "adds support of in-string html syntax highlighting"
       
syntax on
set t_Co=256 "force terminal colors to 256
let g:solarized_termcolors=256
set background=light
silent! colorscheme solarized

"NerdTree Settings
let NERDTreeShowHidden=1 "force nerdtree to show hidden files
let NERDTreeIgnore = ['\.swp$'] "hide .swp files
" let NERDTreeMinimalUI=1 "hide Press ? for help
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

" TAB settings
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType sass setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

" Set to auto read when a file is changed from the outside
set autoread

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l 

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"Miscellaneous settings
set number
set ruler
set visualbell
set wrap
set showmatch
" All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
