call plug#begin('~/.vim/plugged')

" Plugins

" Rice
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'gorodinskiy/vim-coloresque'
Plug 'altercation/vim-colors-solarized'

" Utils
Plug 'amirh/HTML-AutoCloseTag'
Plug 'othree/html5.vim'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'spf13/vim-autoclose'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Lokaltog/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/BufOnly.vim'
Plug 'freitass/todo.txt-vim'

" Syntax
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'slim-template/vim-slim'
Plug 'paranoida/vim-airlineish'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/vim-easy-align'
Plug 'mxw/vim-jsx'
Plug 'elixir-lang/vim-elixir'
Plug 'rust-lang/rust.vim'
Plug 'digitaltoad/vim-pug'
Plug 'mattn/emmet-vim'
Plug 'tomlion/vim-solidity'

call plug#end()

filetype plugin indent on


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
endif

let mapleader="\<Tab>"
let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#bufferline#enabled=1

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
  let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks'])
endfunction

let g:user_emmet_install_global = 0

"let g:airline_powerline_fonts = 1

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

let g:airline_theme='raven'
"let g:airline_theme='sol'

syntax on
syntax enable
set nocompatible
set ruler
set number
set tabstop=2
set shiftwidth=2
set showmatch
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
set smarttab
set smartcase
set expandtab
set wildmenu
set title
set showmode
set showcmd
set smarttab
set autoindent
set copyindent
set wrap
set nobackup
set noswapfile
set hidden
set shiftround
set history=1000
set undolevels=1000
set backspace=indent,eol,start
set wildmode=list:full
set wildignore=*.swp,*.bak,*.pyc,*.class
set encoding=utf8
set splitright
set splitbelow
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace"
set mouse=a
set mousehide
set background=dark
set noerrorbells visualbell t_vb=
set noerrorbells visualbell t_vb=

if has('statusline')
  set laststatus=2
  set statusline=%<%f\ " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y] " Filetype
  set statusline+=\ [%{getcwd()}] " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav inf
endif

" Mappings

nnoremap <C-X>     <Esc>:bd!<CR>
nnoremap <C-L>     <Esc>:bn<CR>
nnoremap <C-H>     <Esc>:bp<CR>
nnoremap <C-S>     <Esc>:w<CR>
nnoremap <C-d>     <Esc>:NERDTreeToggle<CR>
vmap <C-s> <esc>:w<CR>gv

xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"

" resizing vsplits
nnoremap <leader>< <Esc>:30winc ><CR><Esc>
nnoremap <leader>> <Esc>:30winc <<CR><Esc>
nnoremap <leader>xa <Esc>:BufOnly<CR><Esc>

" resizing horizontal split
nnoremap <leader>- <Esc>:10winc -<CR><Esc>
nnoremap <leader>+ <Esc>:10winc +<CR><Esc>

" Clear Search
nnoremap <leader><Space> <Esc>:nohl<CR><Esc>

nnoremap ; :
noremap j gj
noremap k gk
nnoremap Y y$
vnoremap < <gv
vnoremap > >gv
vnoremap . :normal .<CR>
map <Leader> <Plugin>(easymotion-prefix)

if has("autocmd")
  augroup inivisible_chars
  au!
  autocmd BufWritePre * :%s/\s\+$//e
  augroup end

  autocmd BufNewFile,BufRead *.html,*.erb               set filetype=html.eruby
  autocmd BufNewFile,BufRead *.html.twig                set filetype=html.twig
  autocmd BufNewFile,BufRead *.slim                     set filetype=slim
  autocmd BufNewFile,BufRead *.coffee                   set filetype=coffee
  autocmd BufRead,BufNewFile *.go                       set filetype=go
  autocmd BufRead,BufNewFile *.ts                       set filetype=typescript
  autocmd BufRead,BufNewFile *.py,*.pyc                 set filetype=python
  autocmd BufRead,BufNewFile *.ex,*.exs,*.eex           set filetype=elixir
  autocmd BufRead,BufNewFile *.rs,*.toml                set filetype=rust
  autocmd BufRead,BufNewFile *.pug                      set filetype=pug
  autocmd BufRead,BufNewFile *.sol                      set filetype=solidity
  autocmd FileType *.go autocmd BufWritePre <buffer> Fmt
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
  autocmd VimEnter * call AirlineInit()
  autocmd GUIEnter * set visualbell t_vb=
endif

"highlight LineNr ctermfg=black

let g:tmuxline_preset = 'nightly_fox'
let g:typescript_compiler_options = '-sourcemap'
let g:indent_guides_auto_colors = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set background=dark
set linespace=2


colo hybrid

hi clear SignColumn
hi GitGutterAdd ctermfg=green
hi GitGutterChange ctermfg=yellow
hi GitGutterDelete ctermfg=red
hi GitGutterChangeDelete ctermfg=yellow
hi LineNr ctermfg=red
hi NonText ctermfg=magenta
hi CursorLine term=bold cterm=bold guibg=Grey40
hi VertSplit ctermfg=red ctermbg=NONE cterm=NONE

nmap <C-Q> "+gP
nnoremap y "+y
vnoremap y "+y

"set t_Co=256
"let g:hybrid_use_Xresources = 1
"let g:hybrid_reduced_contrast = 1
colo hybrid
set guifont=Consolas\ 11
set laststatus=0
