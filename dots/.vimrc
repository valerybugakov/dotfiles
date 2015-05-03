" CTRL-C to copy (visual mode)
vmap <C-c> y
" CTRL-X to cut (visual mode)
vmap <C-x> x
" CTRL-V to paste (insert mode)
imap <C-v> <esc>P

vmap <C-z-z> <esc>:wq

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
let path = '~/.vim_bundle'
call vundle#rc(path)

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'dmitriiabramov/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'kien/ctrlp.vim'
" Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
" Bundle 'mxw/vim-jsx'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
" Bundle 'tomasr/molokai'
Bundle 'wting/rust.vim'
" Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
" Bundle 'mattn/emmet-vim'
Plugin 'mattn/emmet-vim'

filetype plugin indent on

colorscheme monokai
" syntax enable
" set background=light
" colorscheme solarized

" rainbow parents
au BufEnter * silent! RainbowParenthesesToggle
au BufEnter * silent! RainbowParenthesesActivate
au BufEnter * silent! RainbowParenthesesLoadBraces
au BufEnter * silent! RainbowParenthesesLoadSquare
au BufEnter * silent! RainbowParenthesesLoadRound

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

set fileformats=unix
" e ++ff=unix

" ==========================================================
" Shortcuts
" ==========================================================
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Allow pasting blocks of code without indenting
set pastetoggle=<F2>

"Fix Shift+Tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

map ,t <Esc>:tabnew<CR>
map ,b <Esc>:Gblame<CR>
map ,n :NERDTreeToggle<CR>
map ,w <Esc>:%s/\s\+$//e<CR>:%s/\t/    /ge<CR>:%s/\r\+$//ge<CR>
map ,W <Esc>:w!!<CR>
map ,s <Esc>:w<CR>
map ,q <Esc>:q<CR>
map ,Q <Esc>:q!<CR>
map ,c <Esc>:setlocal spell!<CR>
"nmap <Leader>t :TagbarToggle<CR>

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Let me save files with sudo
cmap w!! w !sudo tee % >/dev/null

let NERDTreeIgnore = ['\.pyc$']
" Let NERDTree show hidden files
let NERDTreeShowHidden = 1
" Let me expand emmet abbr with <TAB>
let g:user_emmet_expandabbr_key = ',<Tab>'

set tw=0
set wm=0
set wrap
set linebreak

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=light           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set showcmd
set cpoptions+=$
set virtualedit=all
set clipboard=unnamed
set gfn=Monaco:h16

if has("gui_running")
  syntax on
  set hlsearch
  colorscheme macvim
  set bs=2
  set ai
  set ruler
endif

set colorcolumn=120

" don't bell or blink
"set noerrorbells
"set vb t_vb=


" don't outdent hashes
inoremap # #

set tabstop=2
set shiftwidth=2
au FileType javascript setl sw=2 sts=2 et
au FileType coffeescript setl sw=2 sts=2 et
set expandtab
set smarttab
set autoindent
set smartindent
set mouse=a


set ls=2  "Always show status line"

set ruler

set hidden

set nolazyredraw
set showmatch
set encoding=utf8

set backspace=indent,eol,start

set nobackup
set noswapfile

" language en_US

"set undodir=~/.vim_runtime/undodir
"set undofile

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>.,trail:~,precedes:<,extends:>
set list
au FileType go set nolist

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" ===========================================================
" FileType specific changes
" ============================================================
" Javascript
au BufRead *.js set makeprg=jslint\ %
" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
autocmd filetype javascript set sw=2 ts=2 expandtab
let g:acp_completeoptPreview=1

" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2

autocmd BufRead,BufNewFile *.hamlc setf haml
" Exec js script in vim ctrl+b
map <C-b> :call ExecNode() <cr>
function ExecNode()
  exec "! node %"
endfunction
