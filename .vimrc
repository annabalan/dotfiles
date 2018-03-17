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
    Plugin 'https://github.com/altercation/vim-colors-solarized' "colorscheme
    Plugin 'https://github.com/airblade/vim-gitgutter.git' "git diff support
call vundle#end()

filetype plugin indent on "turn filetype autodetection back on
syntax on "turn syntax highlighting on

"Solarized colorscheme settings
set t_Co=256 "force terminal colors to 256
let g:solarized_termcolors=256
set background=dark
silent! colorscheme solarized

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

"TAB settings
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 "number of spaces in tab when editing
set expandtab "tabs are spaces
set shiftwidth=4 "control how many columns text is indented with the reindent operations
autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType sass setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2"

" Miscellaneous settings
set number "Show line numbers on the sidebar
set showmatch "highlight matching ([{}])
set ruler "always show cursor position
set visualbell "Flash the screen instead of beeping on errors.
set wrap "Enable line wrapping
set autoindent "New lines inherit the indentation of previous lines
set copyindent "copy the previous indentation on autoindenting
set confirm "Display a confirmation dialog when closing an unsaved file.
set showcmd "show command in bottom bar
set wildmenu "Display command line’s tab complete options as a menu.
set hidden "Hide files in the background instead of closing them
set history=100 "remember limited commands and search history
set ignorecase "Ignore case when searching
set smartcase "Automatically switch search to case-sensitive when search query contains an uppercase letter.
set linebreak "Avoid wrapping a line in the middle of a word
set spelllang=en_us "Enable spellchecking in English

autocmd BufWritePre * :%s/\s\+$//e
"delete trailing whitespace
set autoread " Set to auto read when a file is changed from the outside

" Searching settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
nmap <leader>w :w!<cr>
