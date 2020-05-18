set nocompatible

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.exs set filetype=elixir

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'Lokaltog/vim-powerline'
" Plugin 'powerline/powerline'
" let g:Powerline_symbols = 'fancy'

" ================ Python =================
Plugin 'klen/python-mode'
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

Plugin 'psf/black'
let g:black_linelength = 79
let g:black_skip_string_normalization = 0
autocmd BufWritePre *.py execute ':Black'

" ================ Others =================
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'build/\|\.agility-shared\|.git\|bin'

" ================ JS =================
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
Plugin 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['eslint']
" Plugin 'wookiehangover/jshint.vim'
" Plugin 'Shutnik/jshint2.vim'
Plugin 'posva/vim-vue'
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
" let g:vue_disable_pre_processors=1
" Plugin 'paredit.vim'
" let g:JSHintHighlightErrorLine = 0
"Plugin 'AutoTag'

Plugin 'vim-ruby/vim-ruby'
"Plugin 'michaeljsmith/vim-indent-object'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'gregsexton/gitv'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'

Plugin 'tomtom/tcomment_vim'
nmap <C-/><C-/> :TComment<CR>
vmap <C-/><C-/> :TComment<CR>

Plugin 'corntrace/bufexplorer'
Plugin 'moll/vim-bbye'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-pathogen'
Plugin 'nono/vim-handlebars'
Plugin 'elixir-lang/vim-elixir'
Plugin 'jimenezrick/vimerl'
Plugin 'derekwyatt/vim-scala'

"Plugin 'szarski/buftabs'

" let g:NERDTreeWinSize = 40

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0
set clipboard=unnamed

"set cursorline
"hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=NONE guibg=darkred guifg=white

set autoread                    "Reload files changed outside vim
"set autowrite

syntax on

" Autocomplete
set wildmode=longest,list
set wildmenu

" Tabs
set expandtab

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
" set ignorecase
" set smartcase
" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and tr[MaFailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Scrolling =F=======================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

let ruby_space_errors = 1

nnoremap <leader>h :set hlsearch!<CR>

silent! colorscheme solarized
set term=xterm-256color
set t_Co=16
" set t_Co=256
let g:solarized_termcolors=16
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set background=dark

" highlight clear SignColumn
" highlight VertSplit    ctermbg=236
" highlight ColorColumn  ctermbg=237
" highlight LineNr       ctermbg=236 ctermfg=240
" highlight CursorLineNr ctermbg=236 ctermfg=240
" highlight CursorLine   ctermbg=236
" highlight StatusLineNC ctermbg=238 ctermfg=0
" highlight StatusLine   ctermbg=240 ctermfg=12
" highlight IncSearch    ctermbg=0   ctermfg=3
" highlight Search       ctermbg=0   ctermfg=9
" highlight Visual       ctermbg=3   ctermfg=0
" highlight Pmenu        ctermbg=240 ctermfg=12
" highlight PmenuSel     ctermbg=0   ctermfg=3
" highlight SpellBad     ctermbg=0   ctermfg=1

let mapleader = "\<Space>"

nmap <leader>w <c-w>w
nmap <leader>x :Gblame<CR>
nmap <leader>a :Gitv<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>g :Ag<SPACE>
let g:ackprg = 'ag --nogroup --nocolor --column'

au! BufNewFile,BufRead *.god set ft=ruby
au! BufNewFile,BufRead *.ex set ft=elixir
au BufRead,BufNewFile * set colorcolumn=80

imap <c-l> <space>=><space>
imap <s-tab> <c-x><c-o>

nmap <leader>f :CtrlP<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>d :Bdelete<CR>

nmap <leader>, :tabprevious<CR>
nmap <leader>. :tabNext<CR>

" nmap <leader>g <C-]>
" nmap <leader>h <C-t>

nmap <leader>n :NERDTreeToggle<CR>

nmap <leader>e :BufExplorer<CR>

set showcmd

set hidden
set mouse=a
set ttymouse=xterm2
set mousemodel=extend

nmap <leader>3 gcc

nmap <leader>s :vsplit<CR>
nmap <leader>z :split<CR>

nmap <leader>v <S-v>

nmap <TAB> <C-w>w
nmap <S-TAB> <C-w><S-w>

set laststatus=2

" let NERDTreeIgnore = ['\.o$']
nmap \ :noh<CR>
nmap <leader>o <c-o>

nmap <leader>r :Eval<CR>
vmap <leader>r :Eval<CR>
nmap <leader>t :Require<CR>
nmap <leader>T :vertical term<CR>
let &shell="/bin/bash --login"
function! Tapi_wincmd(bufnum, arglist)
  execute 'wincmd' a:arglist[0]
endfunction
nmap <leader>k i<CR><Esc>
nmap <leader>j :%!python -m json.tool<CR>
nmap <leader>l :%!python -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parseString(''.join(sys.stdin.readlines())).toprettyxml(indent='  '))"<CR>
nmap <leader>m :copen<CR>

set completeopt-=preview

vnoremap <leader>c "+y

Plugin 'ycm-core/YouCompleteMe'
" Plugin 'FSwitch'
" nmap <leader>y :FSHere<CR>
nmap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>D <c-o>
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_detailed_diagnostics = '<c-s>d'
Plugin 'rking/ag.vim'
let $PYTHONPATH .= getcwd()

call vundle#end()

filetype off
filetype plugin on
filetype indent on
