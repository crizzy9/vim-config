syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nu
set numberwidth=3
set laststatus=2
set autoindent
set noswapfile

imap \nn <C-O>o

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'

let g:indentLine_setColors = 0
let g:indentLine_char = '|'
let g:indentLine_enabled = 1
let g:gruvbox_contrast_dark = 1

call plug#end()

colorscheme desert
" colorscheme gruvbox
