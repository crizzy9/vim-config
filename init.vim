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

" Spell checking
set spell spelllang=en_us

" for autosuggestions
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete
" set omnifunc with deoplete for better performance


" Theme
" colorscheme solarized
" colorscheme desert
" colorscheme gruvbox


" Showcase comments in italics
highlight Comment cterm=italic gui=italic


" Plugins
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')

" Git
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" General
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'

" Autocomplete Suggestions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'

" Fast Controls
Plug 'tpope/vim-surround'

" Nerd Plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'  " For sexy commenting

" Comments
Plug 'tpope/vim-commentary'      " For easy commenting

" File icons
Plug 'ryanoasis/vim-devicons'

" File system navigation
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

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

" Colorizer
Plug 'chrisbra/Colorizer'

" Colorschemes
Plug 'rakr/vim-one'
" Smooth Scrolling
" Plug 'yuttie/comfortable-motion.vim'

"Plugin Settings

" indentLine settings
let g:indentLine_setColors = 1
let g:indentLine_char = '|'
let g:indentLine_enabled = 1
let g:gruvbox_contrast_dark = 1

" deoplete settings
let g:deoplete#enable_at_startup = 1

" supertab settings
let g:SuperTabDefaultCompletionType = "<c-n>"     " defaults super tab to ctrl-n

" airline settings
let g:airline_theme='one'

call plug#end()

"----------------------------------
"  Neovim-specific configurations |
"----------------------------------

if has('nvim')

  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  if (has("termguicolors"))
    set termguicolors
  endif

  " colorscheme xoria-mod256
  " colorscheme NeoSolarized

  " Vim One settings
  colorscheme one
  set background=dark
  let g:one_allow_italics=1

  " Fix vim-tmux-navigator <C-h> https://git.io/viGRU
  nmap <BS> <C-W>h

  " Fix vim-tmux-navigator <C-h> https://git.io/vS5QH
  nmap <BS> :<C-u>TmuxNavigateLeft<CR>

endif


" -------------------
"  Custom functions |
" -------------------

" From your first vim plugin talk
function! FixLastSpellingError()
    normal! mm[s1z=`m
endfunction

nnoremap <leader>se :call FixLastSpellingError()<cr>

" Zooming into panes like tmux and iterm2
" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction

command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-A> :ZoomToggle<CR>

" -------------------
"  Custom mappings  |
" -------------------

" Insert mode mappings
" Go to new line in insert mode
inoremap <leader>nn <C-O>o

" Normal mode mappings
" New line mappings
" The mark should stay at the same place but instead its shifting a bit
" nnoremap <CR> :normal! mmo<Esc>`m           " Insert new line in normal mode

" Add mappings for moving all the content on the right of the curser goes down
" while staying in insert mode
" nnoremap <S-CR> O<Esc>
" The mark should stay at the same place.
nnoremap <space><CR> a<CR><Esc>

" Line movement mapings
nnoremap <space>j :m+1<cr>     " Move line down
nnoremap <space>k :m-2<cr>     " Move line up

" Nerd Tree Mappings
nnoremap <C-n><C-t> :NERDTreeToggle<CR>
nnoremap <C-n><C-m> :NERDTreeMirror<CR>
" Terminal mapping
" nnoremap <leader>t :split|terminal<CR>
" nnoremap <leader>vt :vsplit|terminal<CR>

" Custom mapping for replacing word without storing in register
" In future map it with a motion command instead of word to delete a certain
" thing and paste something you copied elsewhere in place. unless you find a
" better way to do this
nnoremap <leader>rp "_diwp

" Easy Save and Quit in normal mode
nnoremap ;w :w<CR>
nnoremap ;q :q<CR>

" Easily get out of terminal mode
tnoremap <Esc> <C-\><C-n>
