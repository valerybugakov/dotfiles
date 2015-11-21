vmap <C-z-z> <esc>:wq

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
let path = '~/.vim_bundle'
call vundle#begin(path)

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
Bundle 'dmitriiabramov/nerdtree'
Bundle 'tomtom/tcomment_vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'crusoexia/vim-monokai'
" Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'       " UI statusbar niceties
  set laststatus=2               " enable airline even if no splits
  let g:airline#enable#branch=1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='powerlineish'
  let g:airline#left#sep = ''
  let g:airline#right#sep = ''
  let g:airline#linecolumn#prefix = '␊ '
  let g:airline#linecolumn#prefix = '␤ '
  let g:airline#linecolumn#prefix = '¶ '
  let g:airline#branch#prefix = '⎇ '
  let g:airline#paste#symbol = 'ρ'
  let g:airline#paste#symbol = 'Þ'
  let g:airline#paste#symbol = '∥'
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#syntastic#enabled=1
  " set guifont=Source\ Code\ Pro\ for\ Powerline

" Automatic closing of quotes, parenthesis, brackets, etc.
Plugin 'valerymercury/auto-pairs'

"""""" JavaScript
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'
Bundle 'mxw/vim-jsx'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Plugin 'isRuslan/vim-es6'
Plugin 'kchmck/vim-coffee-script'

"""""" CSS
" Plugin 'aaronjensen/vim-sass-status'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'lukaszb/vim-web-indent'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-haml'

"""""" UI
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'tomasr/molokai'
Bundle 'wting/rust.vim'
" Bundle 'sjl/badwolf'

""""""" Templates
Plugin 'digitaltoad/vim-jade'
Plugin 'mattn/emmet-vim'
Plugin 'dag/vim2hs'


call vundle#end()
syntax on

set t_Co=256
set background=dark
colorscheme monokai
" colorscheme molokai
" colorscheme solarized
" let g:solarized_termcolors=16
" let g:solarized_termtrans=1

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
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" nmap <Leader>t :TagbarToggle<CR>

" map <C-j> <C-W>j
" map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k

map ≤ :tabp<CR>
map ≥ :tabn<CR>

" map ∆ <C-W>j
" map ˚ <C-W>k
map ¬ :bnext<CR>
map ˙ :bprev<CR>

map <C-w>0 :exec FullScreenSplit()<ENTER>
function FullScreenSplit()
  :res
  :vertical res
endfunction

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
au BufRead,BufNewFile *.scss set filetype=scss.css


" Let me save files with sudo
cmap w!! w !sudo tee % >/dev/null
:set path=$PWD/**

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
syntax enable
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
" Removes top toolbar
set guioptions-=T
" Removes right hand scroll bar
set guioptions-=r
" Removes left hand scroll bar
set go-=L
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
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
" set cursorcolumn
set cursorline
set timeoutlen=200

set ls=2  "Always show status line"
set ruler
set hidden

set nolazyredraw
set showmatch
set encoding=utf8

set backspace=indent,eol,start

set nobackup
set noswapfile

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
" au BufRead *.js set makeprg=eslint\ %
" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
autocmd filetype javascript set sw=2 ts=2 expandtab
" let g:acp_completeoptPreview=1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_check_on_open=1
" let g:syntastic_enable_signs=1

" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2

autocmd BufRead,BufNewFile *.hamlc setf haml
" Exec js script in vim ctrl+b
map <C-b> :call ExecNode() <cr>
function ExecNode()
  exec "! node %"
endfunction

Plugin 'kien/ctrlp.vim.git'
  let g:ctrlp_reuse_window  = 'startify'
  let g:ctrlp_by_filename = 0            " Search by filename
  let g:ctrlp_match_window_bottom = 1    " Show at bottom of window
  let g:ctrlp_working_path_mode = 'ra'   " Our working path is our VCS project or the current directory
  let g:ctrlp_mru_files = 1              " Enable Most Recently Used files feature
  let g:ctrlp_jump_to_buffer = 2         " Jump to tab AND buffer if already open
  let g:ctrlp_open_new_file = 'r'        " open selections in a vertical split
  let g:ctrlp_open_multiple_files = 'vr' " opens multiple selections in vertical splits to the right
  let g:ctrlp_arg_map = 0
  let g:ctrlp_dotfiles = 0               " do not show (.) dotfiles in match list
  let g:ctrlp_showhidden = 0             " do not show hidden files in match list
  let g:ctrlp_split_window = 0
  let g:ctrlp_max_height = 40            " restrict match list to a maxheight of 40
  let g:ctrlp_use_caching = 0            " don't cache, we want new list immediately each time
  let g:ctrlp_max_files = 0              " no restriction on results/file list
  let g:ctrlp_working_path_mode = ''
  let g:ctrlp_dont_split = 'NERD_tree_2' " don't split these buffers
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|gitkeep)$',
    \ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png|psd|DS_Store|ctags|gitattributes)$'
    \ }
  " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  " let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co'] " if you want to use git for this rather than ag
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " let g:ctrlp_prompt_mappings = {
  "   \ 'AcceptSelection("e")': ['<c-e>', '<c-space>'],
  "   \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  "   \ 'AcceptSelection("t")': ['<c-t>'],
  "   \ 'AcceptSelection("v")': ['<cr>'],
  "   \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
  "   \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
  "   \ 'PrtHistory(-1)':       ['<c-n>'],
  "   \ 'PrtHistory(1)':        ['<c-p>'],
  "   \ 'ToggleFocus()':        ['<c-tab>'],
  "   \}

" Plugins
    " Syntastic
        let g:syntastic_javascript_checkers = ['eslint']
    " NERDTree
        noremap <silent> <C-e> :NERDTreeToggle<CR>:silent NERDTreeMirror<CR>
        " let NERDTreeShowBookmarks=1
        " let NERDTreeChDirMode=2
        " let NERDTreeQuitOnOpen=1
        " let NERDTreeShowHidden=1
        " let NERDTreeKeepTreeInNewTab=0
        " Disable display of the 'Bookmarks' label and 'Press ? for help' text
        let NERDTreeMinimalUI=1
        " Use arrows instead of + ~ chars when displaying directories
        let NERDTreeDirArrows=1

" Shortcuts
    " Disable mouse
        set mouse=
    " Disable <Arrow keys>
        " Warning: nightmare mode!
        inoremap <Up> <NOP>
        inoremap <Down> <NOP>
        inoremap <Left> <NOP>
        inoremap <Right> <NOP>
        noremap <Up> <NOP>
        noremap <Down> <NOP>
        noremap <Left> <NOP>
        noremap <Right> <NOP>
        " Navigate with <Ctrl>-hjkl in Insert mode
        imap <C-h> <C-o>h
        imap <C-j> <C-o>j
        imap <C-k> <C-o>k
        imap <C-l> <C-o>l
    " Navigate through wrapped lines
        noremap j gj
        noremap k gk
    " <Esc><Esc>
        " Clear the search highlight in Normal mode
        nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
    " Beautify
        autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
    " Allow pasting blocks of code without indenting
        set pastetoggle=<F2>

""""" Normalization ====================

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite * silent call DeleteTrailingWS()

""""" End Normalization ================
