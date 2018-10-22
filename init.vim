syntax on

set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set nobackup nowritebackup noswapfile " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells

set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection

set nu
set relativenumber
set numberwidth=3
set autoindent
set nohlsearch
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

" Theme
" colorscheme solarized
" colorscheme desert
" colorscheme gruvbox

" for autosuggestions
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" Showcase comments in italics
highlight Comment cterm=italic gui=italic

" Mappings
imap \nn <C-O>o

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Plugins
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')

" Git
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tpope/vim-fugitive'

" General
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'

" Autocomplete Suggestions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" Fast Controls
Plug 'tpope/vim-surround'

" Nerd Plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" File icons
Plug 'ryanoasis/vim-devicons'

" status and powerline
Plug 'vim-airline/vim-airline'

" Tmux Integration
Plug 'christoomey/vim-tmux-navigator'

" Syntax linter
Plug 'vim-syntastic/syntastic'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'icymind/NeoSolarized'
Plug 'morhetz/gruvbox'

" File System Navigation
Plug 'junegunn/fzf.vim'


"Plugin Settings

" indentLine settings
let g:indentLine_setColors = 0
let g:indentLine_char = '|'
let g:indentLine_enabled = 1
let g:gruvbox_contrast_dark = 1

" deoplete settings
let g:deoplete#enable_at_startup = 1

call plug#end()

"-------------------------------------------------------------------------------
" Neovim-specific configurations
"-------------------------------------------------------------------------------

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
  colorscheme NeoSolarized
  set background=dark

  " Fix vim-tmux-navigator <C-h> https://git.io/viGRU
  nmap <BS> <C-W>h

  " Fix vim-tmux-navigator <C-h> https://git.io/vS5QH
  nmap <BS> :<C-u>TmuxNavigateLeft<CR>
endif
