" Neovim configuration file

" call plug#begin('~/.local/share/nvim/plugged')

  " Editing & moving
  Plug 'raimondi/delimitMate'
    let delimitMate_expand_cr = 1
    let delimitMate_expand_space = 1
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim'
    let g:tcomment#blank_lines = 1
  Plug 'justinmk/vim-sneak'
  Plug 'tommcdo/vim-lion'
  Plug 'ajh17/vimcompletesme'

  " Interface
  Plug 'junegunn/fzf.vim'
  Plug 'ap/vim-buftabline'
    let g:buftabline_show = 1
  Plug 'scrooloose/nerdtree'
    let g:NERDTreeMapActivateNode = 'l'
    let g:NERDTreeMapCloseDir = 'h'
    let g:NERDTreeMapPreview = 'L'
  Plug 'machakann/vim-highlightedyank'
    let g:highlightedyank_highlight_duration = 100

  " Colors
  Plug 'cocopon/iceberg.vim'
  Plug 'archSeer/colibri.vim'
  Plug 'jacoborus/tender.vim'
  Plug 'tyrannicaltoucan/vim-deep-space'

  " Other
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-unimpaired'
  Plug 'pbrisbin/vim-mkdir'
  Plug 'sheerun/vim-polyglot'
  Plug 'pbrisbin/vim-restore-cursor'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'yuttie/comfortable-motion.vim'

call plug#end()

colorscheme tender

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

set listchars=tab:▸\ ,space:·,eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮

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

" Change command doesn't affect clipboard
nnoremap c "_c
xnoremap c "_c

" Move visual block
vnoremap <c-j> :m '>+1<cr>gv=gv;
vnoremap <c-k> :m '<-2<cr>gv=gv

" Better macros
xnoremap Q :norm! @
nnoremap Q @q

" Select whatever's just been pasted
nnoremap gV `[V`]

" Make arrow keys do something useful
nnoremap <left> :vertical resize +2<cr>
nnoremap <right> :vertical resize -2<cr>
nnoremap <up> :resize -2<cr>
nnoremap <down> :resize +2<cr>

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Disable artefacts after searching
nnoremap <c-l> :nohlsearch<bar>diffupdate<bar>syntax sync fromstart<cr>

" Switch to normal mode
inoremap <c-l> <c-c>
vnoremap <c-l> <c-c>
cnoremap <c-l> <c-c>

" Quit vim
nnoremap <leader>q :wq<cr>
nnoremap <leader>Q :qa!<cr>

" Toggle options
nnoremap <leader>tf :NERDTreeToggle<cr>
nnoremap <leader>tn :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>
nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>tl :set list!<cr>
nnoremap <leader>ths :if exists("g:syntax_on")<bar>syntax off<bar>else<bar>syntax enable<bar>endif<cr>
nnoremap <leader>thl :set cursorline!<cr>
nnoremap <leader>thc :set cursorcolumn!<cr>
nnoremap <leader>thC :call css_color#toggle()<cr>

" Working with buffers
nnoremap <leader>bw :write<cr>
nnoremap <leader>bd :w<cr>:bdelete<cr>
nnoremap <leader>bD :bdelete!<cr>
nnoremap <leader>bo :%bd<bar>e#<bar>bd#<cr>

" Cycle through buffer list
nmap <expr> <tab> v:count > 0 ? '<Plug>BufTabLine.Go(' . v:count . ')' : ':bnext<cr>'
nmap <expr> <s-tab> v:count > 0 ? '<Plug>BufTabLine.Go(' . v:count . ')' : ':bprev<cr>'

" Working with plugins
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :PlugUpdate<cr>
nnoremap <leader>pc :PlugClean<cr>
nnoremap <leader>ps :PlugStatus<cr>

" Fzf
if executable('fd')
  command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, {'source': 'fd -H -E .cache -E .git -t f'}, <bang>0)
endif
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fF :GFiles<cr>
nnoremap <leader>fl :BLines<cr>
nnoremap <leader>fc :Commands<cr>

" Show syntax highlighting groups for word under cursor
nmap <leader>sh :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
