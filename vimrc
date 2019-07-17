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
" Plug 'skywind3000/vim-keysound', {'do': 'pip3 install --user pysdl2'}
" let g:keysound_enable = 1
" let g:keysound_theme = 'default'
" let g:keysound_volume = 500
" let g:keysound_py_version = 2

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" --------------------------------------------------------------------------- "
"                        Auto Completion & Auto Format                        "
" --------------------------------------------------------------------------- "

" Install the prerequsite:
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev python3-dev
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer
" pip install jedi
Plug 'valloric/youcompleteme', {
    \'do': './install.py --clang-completer && pip install --upgrade --user jedi'
    \}
let g:ycm_python_binary_path = 'python'
set encoding=utf-8

" Install the prerequsite:
" pip install yapf
Plug 'Chiel92/vim-autoformat', {'do': 'pip install --user yapf'}
let g:formatter_yapf_style = 'pep8'
" noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'

Plug 'godlygeek/tabular'

" Plug 'edkolev/tmuxline.vim'

Plug 'plasticboy/vim-markdown'

" --------------------------------------------------------------------------- "
"                          Search & File Management                           "
" --------------------------------------------------------------------------- "

Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=[
            \'__pycache__$[[dir]]',
            \'\.git$[[dir]]',
            \'\.idea$[[dir]]',
            \'\.mypy_cache$[[dir]]',
            \'\.swp$[[file]]',
            \'\.mypy_cache$[[dir]]',
            \'\.pyc',
            \'\.pytest_cache',
            \'\.tox',
            \'\.egg-info'
            \]
let NERDTreeShowHidden=1

Plug 'jistr/vim-nerdtree-tabs'

Plug 'scrooloose/nerdcommenter'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Plug 'majutsushi/tagbar'
" nmap <F8> :TagbarToggle<CR>

" --------------------------------------------------------------------------- "
"                                    Git                                      "
" --------------------------------------------------------------------------- "

Plug 'tpope/vim-fugitive'

Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'airblade/vim-gitgutter'

" --------------------------------------------------------------------------- "
"                          Syntax Check & Highlight                           "
" --------------------------------------------------------------------------- "

Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}

Plug 'w0rp/ale', {'do':'pip install --user autopep8 mypy pylint black flake8 isort yapf'}
let g:ale_echo_msg_format = '[%linter%] [%severity%] [%code%] %s'
" let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \'*': ['remove_trailing_lines', 'trim_whitespace'],
    \'python': ['add_blank_lines_for_python_control_statements','autopep8', 'black', 'isort', 'yapf']
    \}

" --------------------------------------------------------------------------- "
"                                 Navigation                                  "
" --------------------------------------------------------------------------- "

Plug 'easymotion/vim-easymotion'

Plug 'sheerun/vim-polyglot'

Plug 'takac/vim-hardtime'
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_allow_different_key = 1

call plug#end()

" colorscheme solarized
set number
set nowrap

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

" auto reload the vimrc when it changes
if has ('autocmd') " Remain compatible with earlier versions
    augroup vimrc     " Source vim configuration upon save
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
        autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
    augroup END
endif " has autocmd
