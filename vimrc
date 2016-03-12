" set ethe runtime path to include Vundle and initialize set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins

" Rice
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'itchyny/lightline.vim'

" Utils
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'spf13/vim-autoclose'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/BufOnly.vim'

" Syntax
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'slim-template/vim-slim'
Plugin 'paranoida/vim-airlineish'
Plugin 'leafgarland/typescript-vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'mxw/vim-jsx'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()
filetype plugin indent on

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let mapleader="\<Tab>"
let g:airline#extensions#tabline#enabled=1

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
  let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks'])
endfunction


let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"let g:airline_powerline_fonts=1
"let g:airline_theme='distinguished'
let g:airline_theme='raven'

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


if has('statusline')
  set laststatus=2
  set statusline=%<%f\ " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y] " Filetype
  set statusline+=\ [%{getcwd()}] " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav inf
endif

nnoremap <C-X>     <Esc>:bd!<CR>
nnoremap <C-L>     <Esc>:bn<CR>
nnoremap <C-H>     <Esc>:bp<CR>
nnoremap <C-s>     <Esc>:w<CR>
nnoremap <C-t>     <Esc>:NERDTreeToggle<CR>

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

  autocmd BufNewFile,BufRead *.html,*.erb   set filetype=html.eruby
  autocmd BufNewFile,BufRead *.html.twig    set filetype=html.twig
  autocmd BufNewFile,BufRead *.slim         set filetype=slim
  autocmd BufNewFile,BufRead *.coffee       set filetype=coffee
  autocmd BufRead,BufNewFile *.go           set filetype=go
  autocmd BufRead,BufNewFile *.ts           set filetype=typescript
  autocmd BufRead,BufNewFile *.py,*.pyc     set filetype=python
  autocmd BufRead,BufNewFile *.ex           set filetype=elixir
  autocmd FileType *.go autocmd BufWritePre <buffer> Fmt
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
  autocmd VimEnter * call AirlineInit()
  autocmd GUIEnter * set visualbell t_vb=
endif

highlight LineNr ctermfg=black

let g:tmuxline_preset = 'nightly_fox'
let g:typescript_compiler_options = '-sourcemap'

let g:indent_guides_auto_colors = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

"set t_Co=256
"colo grb256
"color gruvbox
"colo jellyx

set background=dark
set t_Co=16
set noerrorbells visualbell t_vb=
"colo hybrid
hi clear SignColumn
hi GitGutterAdd ctermfg=green
hi GitGutterChange ctermfg=yellow
hi GitGutterDelete ctermfg=red
hi GitGutterChangeDelete ctermfg=yellow
hi LineNr ctermfg=yellow
hi NonText ctermfg=gray
hi CursorLine term=bold cterm=bold guibg=Grey40
