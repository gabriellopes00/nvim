" Vim Plugg
call plug#begin('~/.config/nvim/plugged')

Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multi cursors
Plug 'vim-airline/vim-airline'                      " airline bar
Plug 'preservim/nerdtree'                           " side bar
Plug 'Xuyuanp/nerdtree-git-plugin'                  " side bar git highlight
Plug 'airblade/vim-gitgutter'                       " git highlight
Plug 'tpope/vim-surround'                           " surround a block with some character
Plug 'jiangmiao/auto-pairs'                         " auto pairs
Plug 'preservim/nerdcommenter'                      " comments shortcuts
Plug 'ryanoasis/vim-devicons'                       " pretty icons (requires a nerd-font)
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " file icons and color highlighting in NerdTree
Plug 'morhetz/gruvbox/'                             " gruvbox color theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " install fzf
Plug 'junegunn/fzf.vim'                             " fuzzy file finder for vim
Plug 'airblade/vim-rooter'                          " set project root as working directory
Plug 'goolord/alpha-nvim'                           " startup screen customizer
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " vim auto completition
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-markdownlint',
      \ 'coc-spell-checker',
      \ 'coc-yaml',
      \ 'coc-go',
      \ 'coc-snippets',
      \ 'coc-sumneko-lua']

call plug#end()

" Settins file for alpha-nvim
luafile $HOME/.config/nvim/config/alpha.lua

" Fuzzy file finder (Fzf)
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
let g:fzf_action = {
    \ 'ctrl-j': 'split',
    \ 'ctrl-l': 'vsplit'
    \ }
noremap ff :FzfFiles<CR>
noremap fl :FzfLines<CR>
noremap fr :FzfRg<CR>
noremap fb :FzfBuffers<CR>

" NERDTree
let NERDTreeWinSize = 50
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^.git$', '^node_modules$']

nnoremap <leader>n :NERDTreeToggle<CR>

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
source $HOME/.config/nvim/config/coc-snippets.vim

let $LANG='en_US'              " english language
set langmenu=en_US             " menu language

set background=dark
colorscheme gruvbox

" Key remaps

" reload vim
noremap <leader>r :source ~/.config/nvim/init.vim<CR>

" Quit quickly
nnoremap q :q<CR>
nnoremap x :x<CR>
nnoremap w :w<CR>

" GitGutter diff
nnoremap df :GitGutterDiffOrig<CR>

" Add empty lines
nnoremap mj o<Esc>k
nnoremap mk <S-o><Esc>j

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
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap bk :bfirst<CR>
nnoremap bj :blast<CR>
nnoremap bn :enew<CR>
nnoremap bd :bd<cr>
nnoremap bo :%bd\|e#\|bd#<cr>\|'"

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
set nobackup            " disable backup files
set nowritebackup       " disable backup files
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
set smartindent

set showmode            " show current mode (visual, insert, normal...)
set showcmd             " show (partial) command in the last line of the screen this also shows visual selection info

set showmatch           " show matching parenthesis
set matchpairs+=<:>     " match pairs with <>

set list                " show empty characters, below the characters...
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set noerrorbells        " don't beep
set belloff=all         " disable error bells

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
