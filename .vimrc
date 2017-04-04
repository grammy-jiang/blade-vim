set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" https://github.com/VundleVim/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

" --------------------------------------------------------------------------- "
"                                 Appearence                                  "
" --------------------------------------------------------------------------- "

Plugin 'vim-airline/vim-airline'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#left_sep = ' ' 
let g:airline#extensions#tabline#left_alt_sep = '|' 

Plugin 'vim-airline/vim-airline-themes'

Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
    set background=light
else
    set background=dark
endif

Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '|'
nmap <F9> :IndentLinesToggle<CR>

" --------------------------------------------------------------------------- "
"                        Auto Completion & Auto Format                        "
" --------------------------------------------------------------------------- "

" Install the prerequsite:
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev python3-dev
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer
" pip install jedi
Plugin 'valloric/youcompleteme'
let g:ycm_python_binary_path = 'python'

" Install the prerequsite:
" pip install autopep8
Plugin 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat

" --------------------------------------------------------------------------- "
"                          Search & File Management                           "
" --------------------------------------------------------------------------- "

Plugin 'scrooloose/nerdtree'
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'


" --------------------------------------------------------------------------- "
"                                    Git                                      "
" --------------------------------------------------------------------------- "

Plugin 'tpope/vim-fugitive'

" --------------------------------------------------------------------------- "
"                          Syntax Check & Highlight                           "
" --------------------------------------------------------------------------- "

Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

" For python development, flake8 or pyflakes or pylint is needed.
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_aggregate_errors = 1

call vundle#end()            " required
filetype plugin indent on    " required

" auto reload the vimrc when it changes
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

" set tab as 4 space
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" search
set hlsearch
set ignorecase

" history
set history=10000

" indent
set foldmethod=indent
