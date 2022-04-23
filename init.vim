" Vim Plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }             " dracula theme
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multi cursors
Plug 'vim-airline/vim-airline'                      " airline bar
Plug 'preservim/nerdtree'                           " side bar
"Plug 'Xuyuanp/nerdtree-git-plugin'                 " side bar git highlight
Plug 'tpope/vim-surround'                           " surround a block with some character
Plug 'jiangmiao/auto-pairs'                         " auto pairs
Plug 'gko/vim-coloresque'                           " colors code highlighting
Plug 'preservim/nerdcommenter'                      " comments shortcuts
Plug 'ryanoasis/vim-devicons'                       " pretty icons (requires a nerd-font)
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " file icons and color highlighting in NerdTree
Plug 'morhetz/gruvbox/'                             " gruvbox color theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " install fzf
Plug 'junegunn/fzf.vim'                             " fuzzy file finder for vim
Plug 'airblade/vim-rooter'                          " set project root as working directory
Plug 'goolord/alpha-nvim'                           " startup screen customizer
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " vim auto completition
let g:coc_global_extensions = ['coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-markdownlint', 'coc-spell-checker', 'coc-yaml', 'coc-go']

call plug#end()

" Settins file for alpha-nvim
luafile $HOME/.config/nvim/config/alpha.lua

" Fuzzy file finder (Fzf)
let g:fzf_command_prefix = 'Fzf'
map <C-F> :FzfFiles<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" NERDTree
let NERDTreeWinSize = 50
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^.git$', '^node_modules$']

nnoremap <leader>n :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Airline
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" vim-coc setup file
source $HOME/.config/nvim/config/coc.vim

let $LANG='en_US'              " english language
set langmenu=en_US             " menu language

set background=dark
colorscheme gruvbox

" Key remaps
noremap <leader>r :source ~/.config/nvim/init.vim<CR>

" use cntrl + s to save a file instead of lock vim
" requires zshrc config: alias vim="stty stop '' -ixoff ; vim"
nnoremap <silent><c-s> :<c-u>update<cr>
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr>

" navigate between screens using Cntrl + h j k or l
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" tabs management
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tk :tabfirst<CR>
nnoremap tj :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>
nnoremap to :tabo<CR>

" buffers management
nnoremap bl :bn<CR>
nnoremap <Tab> :bn<CR>
nnoremap bh :bp<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap bk :bfirst<CR>
nnoremap bj :blast<CR>
nnoremap bn :enew<CR>
nnoremap bd :bd<cr>
nnoremap bo :%bd\|e#\|bd#<cr>\|'"

nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>

" move selected code block up or down using Shift + K or J
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
vnoremap L >gv
vnoremap H <gv

" reside window
nnoremap <C-Up>    :resize -2<CR>
nnoremap <C-Down>  :resize +2<CR>
nnoremap <C-Left>  :vertical resize +2<CR>
nnoremap <C-Right> :vertical resize -2<CR>

" toggle selected code block comments using \+;
nnoremap <leader>; :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <leader>; :call nerdcommenter#Comment(0,"toggle")<CR>

" split screen using <leader> + h or v
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" close vim without
nnoremap<leader>q :q<CR>

" filetype settings
filetype off                " disable file type detection
filetype indent on          " sintax highlight by filetype
filetype plugin indent on   " use the file type plugins
filetype plugin on          " use the file type plugins

syntax on               " enable syntax highlighting

set clipboard=unnamedplus

set ruler               " show the cursor position
set nomodeline          " ignore file’s mode lines; use vimrc configurations instead
set wrap                " wrap words on screen width
set linebreak           " avoid wrapping a line in the middle of a word
set scrolloff=5         " keep 5 lines off the edges of the screen when scrolling
set backspace=indent,eol,start
set ttyfast
set laststatus=2        " tell VIM to always put a status line in, even if there is only one window
set number              " set number lines
set noswapfile          " disable swap files
set nocompatible        " don't try to be vi compatible
set hidden              " allow open other file if the current is not saved

set colorcolumn=80,100     " set a ruler line on 100º column
"highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

set tabstop=2           " set 2 tab spaces
set shiftwidth=2        " set 2 shift spaces
set softtabstop=2       " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab           " expand tabs to spaces by default
set noshiftround        " don't use multiple of shiftwidth when indenting with '<' and '>'
set autoindent          " always set autoindenting on
set copyindent          " copy the previous indentation on autoindenting
set smarttab            " insert tabs on the start of a line according to shiftwidth, not tabstop

set showmode            " show current mode (visual, insert, normal...)
set showcmd             " show (partial) command in the last line of the screen this also shows visual selection info

set showmatch           " show matching parenthesis
set matchpairs+=<:>     " match pairs with <>

set list                " show empty characters, below the characters...
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set visualbell          " flash the screen instead of beeping on errors
set noerrorbells        " don't beep

set encoding=utf-8      " encoding utf-8
set termencoding=utf-8  " terminal encoding utf-8

set hlsearch            " highlight words in search
set incsearch           " show search matches as you type
set ignorecase          " ignore uppercase and lowercase in search, highlight both in search
set smartcase           " highlight only uppercases if search with uppercase

set mouse=a             " use mouse in visual mode

set wildmenu            " make tab completion for files/buffers act like bash
set wildmode=list:full  " show a list when pressing tab and complete
set confirm             " confirm menu on exit without saving
set title               " put filename on title of terminal
set splitbelow          " put new screen at below when split
set splitright          " put new screen at right when split
