set shell=/bin/bash

if has('python3')
endif

set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" --------------------------------------------------------------------------- "
"                                 Appearence                                  "
" --------------------------------------------------------------------------- "

" NOTICE: Install fonts for vim-airline
" On Fedora, install powerline-fonts
" sudo dnf install powerline-fonts
Plug 'vim-airline/vim-airline'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

Plug 'vim-airline/vim-airline-themes'
let g:aireline_theme='solarized'

Plug 'altercation/vim-colors-solarized'
if has('gui_running')
    set background=light
else
    set background=dark
endif

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
nmap <F9> :IndentLinesToggle<CR>

" On Fedora, install SDL2_mixer-devel
" sudo dnf install SDL2_mixer-devel
" For python, install PySDL2
" sudo python3 -m pip install pysdl2
Plug 'skywind3000/vim-keysound', {'do': 'pip install --user pysdl2'}
let g:keysound_enable = 1
let g:keysound_theme = 'default'
" let g:keysound_volume = 500
" let g:keysound_py_version = 2

" --------------------------------------------------------------------------- "
"                        Auto Completion & Auto Format                        "
" --------------------------------------------------------------------------- "

" Install the prerequsite:
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev python3-dev
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer
" pip install jedi
Plug 'valloric/youcompleteme', {'do': './install.py --clang-completer'}
let g:ycm_python_binary_path = 'python'
set encoding=utf-8

" Install the prerequsite:
" pip install autopep8
Plug 'Chiel92/vim-autoformat', {'do': 'pip install --user autopep8'}
noremap <F3> :Autoformat<CR>

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'

Plug 'godlygeek/tabular'

Plug 'edkolev/tmuxline.vim'

Plug 'plasticboy/vim-markdown'

" --------------------------------------------------------------------------- "
"                          Search & File Management                           "
" --------------------------------------------------------------------------- "

Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['__pycache__$[[dir]]', '\.git$[[dir]]', '\.idea$[[dir]]', '\.swp$[[file]]', '\.pyc', '\.pytest_cache', '\.tox', '\.egg-info']
let NERDTreeShowHidden=1

Plug 'jistr/vim-nerdtree-tabs'

Plug 'scrooloose/nerdcommenter'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" --------------------------------------------------------------------------- "
"                                    Git                                      "
" --------------------------------------------------------------------------- "

Plug 'tpope/vim-fugitive'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'

" --------------------------------------------------------------------------- "
"                          Syntax Check & Highlight                           "
" --------------------------------------------------------------------------- "

Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

" For python development, flake8 or pyflakes or pylint is needed.
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_aggregate_errors = 1

let g:syntastic_python_pylint_post_args = "--const-rgx=[a-zA-Z]+"
" let g:syntastic_python_pylint_post_args = "--include-naming-hints=y"

" Install jedi first
" pip install jedi
Plug 'davidhalter/jedi-vim', {'do': 'pip install --user jedi'}

" --------------------------------------------------------------------------- "
"                                 Navigation                                  "
" --------------------------------------------------------------------------- "

Plug 'easymotion/vim-easymotion'

Plug 'sheerun/vim-polyglot'

" call vundle#end()            " required
call plug#end()
filetype plugin indent on    " required

" colorscheme solarized
set number
set nowrap

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
set showmatch

" history
set history=10000

" indent
set foldmethod=indent

set colorcolumn=80

set showcmd

nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Force the cursor onto a new line after 80 characters
set textwidth=80
" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the 81st (or 73rd) column so that we don’t type over our limit
set colorcolumn=+1
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51
