" Neovim configuration file 

if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  echo "Please install junegunn/vim-plug in order to load config file"
  finish
endif

call plug#begin('~/.local/share/nvim/plugged')

  " Mappings
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'

  " Editing
  Plug 'Raimondi/delimitMate'
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/vim-easy-align'
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)

  Plug 'pbrisbin/vim-mkdir'
  Plug 'wellle/targets.vim'
  Plug 'pbrisbin/vim-restore-cursor'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-user'

  " Syntax
  Plug 'jacoborus/tender.vim'
  Plug 'sheerun/vim-polyglot'

  " Interface
  Plug 'junegunn/fzf.vim'
  Plug 'ap/vim-buftabline'
  Plug 'scrooloose/nerdtree'
    let g:NERDTreeMapActivateNode = 'l'
    let g:NERDTreeMapCloseDir = 'h'
    let g:NERDTreeMapPreview = 'L'
  Plug 'yuttie/comfortable-motion.vim'

call plug#end()

colorscheme tender

set listchars=tab:▸\ ,space:·,eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮

set nowrap                 " Disable line wrapping
set number                 " Enable number line
set relativenumber         " Enable relative number line
set termguicolors          " Enable 24-bit coloring
set showbreak=↪            " Display '↪' at the beginnig of wrapped line
set inccommand=nosplit     " Shows the effects of a search in real time
set hidden                 " Allow switching to unsaved buffers
set formatoptions-=o       " Disable auto-comment for o and O
set ignorecase             " Case insensitive searching
set smartcase              " Case sensitive searching if first char is uppercase
set wrapscan               " Searches wrap around EOF
set lazyredraw             " Faster rendering when doing macros
set splitbelow             " Open splits below focused window
set splitright             " Open splits on the right side of focused window
set clipboard^=unnamedplus " Forward unnamed register to X11 clipboard
set scrolloff=2            " Keep some context around cursor
set undofile               " Persistent undo history

let mapleader = " "
let maplocalleader = " "

" Better default mappings
cnoremap <c-n> <down>
cnoremap <c-p> <up>
nnoremap / /\v
nnoremap ? ?\v
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Cycle through buffer list
nnoremap <silent> <tab> :bnext<cr>
nnoremap <silent> <s-tab> :bprev<cr>

" Disable artefacts after searching
nnoremap <c-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" Switch to normal mode
inoremap <c-l> <c-c>
vnoremap <c-l> <c-c>
cnoremap <c-l> <c-c>

" Quit vim
nnoremap <leader>q :wq<cr>
nnoremap <leader>Q :q!<cr>

" Toggle options
nnoremap <leader>tf :NERDTreeToggle<cr>
nnoremap <leader>tn :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>
nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>tl :set list!<cr>
nnoremap <leader>ths :if exists("g:syntax_on") <bar> syntax off <bar> else <bar> syntax enable <bar> endif<cr>
nnoremap <leader>thl :set cursorline!<cr>
nnoremap <leader>thc :set cursorcolumn!<cr>

" Working with buffers
nnoremap <leader>bw :write<cr>
nnoremap <leader>bd :w<cr>:bdelete<cr>
nnoremap <leader>bD :bdelete!<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap <leader>bo :%bd<bar>e#<bar>bd#<cr>

" Working with plugins
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :PlugUpdate<cr>
nnoremap <leader>pc :PlugClean<cr>
nnoremap <leader>ps :PlugStatus<cr>

