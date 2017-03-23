" auto reload the vimrc when it changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif | redraw
augroup END

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
