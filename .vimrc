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

" https://github.com/altercation/vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
    set background=light
else
    set background=dark
endif

" https://github.com/Yggdroot/indentLine
Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '|'
nmap <F9> :IndentLinesToggle<CR>

" --------------------------------------------------------------------------- "
"                        Auto Completion & Auto Format                        "
" --------------------------------------------------------------------------- "

" https://github.com/valloric/youcompleteme
" Install the prerequsite:
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev python3-dev
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer
" pip install jedi
Plugin 'valloric/youcompleteme'
let g:ycm_python_binary_path = 'python'

" https://github.com/Chiel92/vim-autoformat
" Install the prerequsite:
" pip install autopep8
Plugin 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat

" --------------------------------------------------------------------------- "
"                          Search & File Management                           "
" --------------------------------------------------------------------------- "


" --------------------------------------------------------------------------- "
"                                    Git                                      "
" --------------------------------------------------------------------------- "

" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

" --------------------------------------------------------------------------- "
"                          Syntax Check & Highlight                           "
" --------------------------------------------------------------------------- "

" https://github.com/docker/docker/tree/master/contrib/syntax/vim
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

" https://github.com/vim-syntastic/syntastic
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
