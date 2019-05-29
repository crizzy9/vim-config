syntax on 
set autoread                          " Auto reload changed files
au CursorHold,CursorHoldI * checktime " To update files without explicitly giving :e since autoread doesnt do that for you
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim

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
" WILL SWAP FILE ALLOW ME TO OPEN BACKGROUND VIM SESSION in fg if opened the same vim file again (Ctrl-Z fg and vim file)
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
set wildignore+=*/__pycache__/*

" Spell checking
set spell spelllang=en_us

" Fold options
set foldmethod=manual

" Opening an already open buffer while opening a tag
set swb+=useopen,usetab " doesnt work

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

" Use YouCompleteMe with UltiSnips

" Ultisnips
" Plug 'SirVer/ultisnips'

" Snippets seperate from the engine
" Plug 'honza/vim-snippets'

" NeoSnippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Vim Jupyter
Plug 'szymonmaszke/vimpyter'  " External dependency notedown (install using pip)

" Fast Controls
Plug 'tpope/vim-surround'

" Nerd Plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'  " For sexy commenting

" Comments
Plug 'tpope/vim-commentary'      " For easy commenting

" File icons
Plug 'ryanoasis/vim-devicons'

" Vim Latex PDF Live Preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Vim latex
Plug 'lervag/vimtex'

" File system navigation
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim'

" status and powerline
Plug 'vim-airline/vim-airline'

" Tmux Integration
Plug 'christoomey/vim-tmux-navigator'

" Syntax linter
Plug 'vim-syntastic/syntastic'

" Typescript plugins
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}    " Needs npm install -g neovim and a :UpdateRemotePlugins

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

" ultisnips settings
" Trigger configuration
" let g:UltiSnipsExpandTrigger="<c-s>"
" let g:UltiSnipsJumpForwardTrigger="<c-s>"
" let g:UltiSnipsJumpBackwardTrigger="<c-m>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Vim latex pdf viewer
let g:livepreview_previewer = 'zathura'

" deoplete settings
let g:deoplete#enable_at_startup = 1

" Jedi config
let g:jedi#show_call_signatures = "0"


" ========= Vim Surround Configuration ========= 

au FileType tex let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\1}"
au FileType tex let g:surround_{char2nr('e')} = "\\\1effect: \1{\r}"  " surround text by \emph or \textbf where emph is the effect

" ========= NeoSnippet Configuration ========= 

" neosnippet settings
let g:neosnippet#enable_completed_snippet = 1
" let g:neosnippet#enable_complete_done = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif " Do not show preview window after completion

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" supertab settings
let g:SuperTabDefaultCompletionType = "<c-n>"     " defaults super tab to ctrl-n

" airline settings
let g:airline_theme='one'

" Typescript plugin settings
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

" To not show symbols like mu in latex files
let g:tex_conceal = ""

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript :set makeprg=tsc

" after a re-source, fix syntax matching issues (concealing brackets for NerdTree):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

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
" Enter to new line while staying in normal mode
nnoremap ^[OM o<Esc> " Shift Enter. Insert line below
nnoremap ^[VM O<Esc> " Control Enter. Insert line above

" The mark should stay at the same place but instead its shifting a bit
" nnoremap <CR> :normal! mmo<Esc>`m           " Insert new line in normal mode

" Add mappings for moving all the content on the right of the curser goes down
" while staying in insert mode

" The mark should stay at the same place.
nnoremap <space><CR> a<CR><Esc>

" Line movement mapings
nnoremap <space>j :m+1<CR>     " Move line down
nnoremap <space>k :m-2<CR>     " Move line up

" Nerd Tree Mappings
nnoremap <C-n><C-t> :NERDTreeToggle<CR>
nnoremap <C-n><C-m> :NERDTreeMirror<CR>
" Terminal mapping
" nnoremap <leader>t :split|terminal<CR>
" nnoremap <leader>vt :vsplit|terminal<CR>

" Show hidden files in Nerd Tree by default
let NERDTreeShowHidden=1

" Custom mapping for replacing word without storing in register
" In future map it with a motion command instead of word to delete a certain
" thing and paste something you copied elsewhere in place. unless you find a
" better way to do this
nnoremap <leader>rp "_diwp

" Easy Save and Quit in normal mode
" nnoremap ;w :w<CR>
" nnoremap ;q :q<CR>
" nnoremap ;1 :q!<CR>
" nnoremap ;wq :wq<CR>
" nnoremap ;qa :qa<CR>
" nnoremap ;wa :wa<CR>
" nnoremap ;wqa :wqa<CR>

" Easily get out of terminal mode
tnoremap <Esc> <C-\><C-n>

" Shortcut to source init.vim
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

" Go to last active tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif

nnoremap <silent> gl :exe "tabn ".g:lasttab<cr>
vnoremap <silent> gl :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" Group all leader mappings together
nnoremap <leader>nt :tabnew<CR>                 " Open a new tab
nnoremap <leader>t :tabnew<CR>:term<CR>         " Open a new tab with terminal
nnoremap <leader>st :split<CR>:term<CR>         " Open a horizontal split with terminal
nnoremap <leader>vt :vsplit<CR>:term<CR>        " Open a vertical split with terminal

" Move elements in an array or remove or add them simply with a few key strokes
" Allow numbers to move multiple
" <?num?> + <Space> + h : Move element left
" <?num?> + <Space> + l : Move element right
" *<?num?> + <Space> + h : Remove left most element
" *<?num?> + <Space> + h : Remove right most element
" *<?num?> + <Space> + h : Add left most element
" *<?num?> + <Space> + h : Add right most element
" This is very buggy improve and use text objects
" Cannot move the first word right and last word left like this. Also cant
" move second word into the first one and vice versa
" When on second word and trying to move it left it gets deleted?
" ['word1', 'word2', 'word3', 'word 4', word5, 'word6', 'word7']
" di - delete item, df - delete first, dl - delete last
nnoremap <space>l T,df,f,p
nnoremap <space>h T,df,F,;p

" Maybe give an option as which closing or ending brackets we need to use? Like change surrounding.
nnoremap <space>dl t)F,dt)
nnoremap <space>df T(df,x

" Adding two seperate mappings for [ for first and last change
nnoremap <space>gl F,dt,t)p " similar for ]
nnoremap <space>gh T,df,F[,p " need to fix this


" How to escape [ or catch it. This doesnt seem to work!
nnoremap <space>b /,\|\[<CR>
" nnoremap <space>w /\%Vword<CR>
" nnoremap <space>b /\%V,\|\[<CR>

" allow this only for markdown files and make this into a snippet
" To add a ----- or ===== line underneath a heading in markdown.
nnoremap <space>- yypVr-<Esc>
nnoremap <space>= yypVr=<Esc>


function! FindItem(query)
    execute 'normal! /'. a:query ."\<cr>"
    let @/ = a:query
endfunction

" Todo Item states:
"   Should be like jira where its a graph of all the states and the states it can transition to
"   . -> - -> x -> X -> ^ -> ? -> /
"   Think of better ways to do this.

let states = ['-', 'x', 'X', '^', '?', '/']
" Create a graph for this and follow that for going to new states.
nnoremap <space>sp 0t]r:states[0]<CR>d

nnoremap <space>nn 0t]rx
" Mark the todo item to its NEXT state
nnoremap <space>ns 0t]rxddmm:call FindItem('## Completed')<CR>jp`m

" Mark the todo item to its PREVIOUS state

" Mark the todo item with the given state

" Add a new todo item below in normal mode
nnoremap <space>t o- [.] 

" Convert current checkpoint into a todo item (- xxx -> - [.] xxx)
nnoremap <space>st $T-i [.]<Esc>


" <S-CR>(Shift Enter) = ^[OM
" <C-CR>(Ctrl Enter) = ^[VM
autocmd FileType markdown inoremap ^[OM <CR>- [.]
autocmd FileType markdown inoremap ^[VM <Esc>O- [.]

" Move todo item when finished to completed
nnoremap <space>c dd:call FindItem('## Completed')<CR>jp


" Surround checkpoint with ys$* for markdown

"Paste in link to make it into a markdown link immediately

" Open current file in default app
nnoremap <leader>o :!open %<CR>

" ========= Folds ========= 

" Fold toggle shortcut with tab
nnoremap <Tab> za

" Saving folds upon closing vim sessions
" https://til.hashrocket.com/posts/17c44eda91-persistent-folds-between-vim-sessions
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  " https://vi.stackexchange.com/questions/13864/bufwinleave-mkview-with-unnamed-file-error-32
  " DO NOT USE SPACES BETWEEN BufWinLeave and BufLeave
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup END

set viewoptions=folds,cursor
set sessionoptions=folds
" ========================= 

" Vim Latex preview
au FileType tex nnoremap <space>p :LLPStartPreview<CR>

" LaTex shortcuts
" Using nmap instead of nnoremap to use inbuilt plugin
" https://vi.stackexchange.com/questions/15267/mapping-using-tpope-vim-surround-only-works-with-command
" Obsolete because of inbuilt custom surround mapping
au FileType tex nmap <leader>e ysiW}i\emph<Esc>

" Convert x/y form to \cfrac{x}{y} in latex

" REMOVE ADDITIONAL SPACES IN A LINE
nnoremap <leader><leader>s :s/\s\+/ /g<CR>
" SAME CAN BE DONE FOR MULTIPLE LINES DONT KNOW HOW
