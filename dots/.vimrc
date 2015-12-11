set nocompatible              " Vim settings, rather then Vi settings
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
let path = '~/.vim_bundle'
call vundle#begin(path)
" call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" ==========================================================
" My Bundles here:
" ==========================================================
"
""""""" General plugins
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
  let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
      \ ]
    \ }
Plugin 'jistr/vim-nerdtree-tabs'
  let g:nerdtree_tabs_open_on_gui_startup = 0
  let g:nerdtree_tabs_smart_startup_focus = 2
  let g:nerdtree_tabs_open_on_new_tab = 0
Bundle 'scrooloose/nerdtree'
  let NERDTreeIgnore = ['\.pyc$']
  let NERDTreeShowHidden = 1
  let NERDTreeDirArrows=1
  noremap <silent> <C-e> :NERDTreeToggle<CR>:silent NERDTreeMirror<CR>
  " let NERDTreeShowBookmarks=1
  " let NERDTreeChDirMode=2
  " let NERDTreeQuitOnOpen=1
  " let NERDTreeKeepTreeInNewTab=0
  " let NERDTreeMinimalUI=1
Plugin 'tpope/vim-repeat'
Plugin 'troydm/easybuffer.vim'
Plugin 'vim-scripts/camelcasemotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'chrisbra/NrrwRgn'                             " :NR on visual-selected region to open it in narrowed window
Plugin 'nelstrom/vim-visual-star-search'              " Star(*) search for the whole selection in visual mode
Plugin 'tomtom/tcomment_vim'                          " gcc
Plugin 'tpope/vim-surround'                           " ds, cs}), yss<p>
Plugin 'briandoll/change-inside-surroundings.vim'     " cit to change inside tag, ci[ to change inside []
Plugin 'godlygeek/tabular'                            " :Tab [pattern]
Plugin 'tpope/vim-unimpaired'                         " [space, ]space etc
Plugin 'valerymercury/auto-pairs'                     " Automatic closing of quotes, parenthesis, brackets, etc.
Plugin 'AndrewRadev/splitjoin.vim'                    " gS to split single-line statement, gJ for the opposite
Plugin 'vim-scripts/YankRing.vim'                     " Go through paste-stack with OPTION-[pP]
  let g:yankring_replace_n_pkey='π'
  let g:yankring_replace_n_nkey='∏'
Plugin 'terryma/vim-multiple-cursors'                 " Yay ^_^
  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-b>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'

""""""" Navigation
Plugin 'Lokaltog/vim-easymotion'
  let g:EasyMotion_smartcase = 1
Plugin 'kien/ctrlp.vim.git'
  let g:ctrlp_reuse_window  = 'startify'
  let g:ctrlp_by_filename = 0                         " Search by filename
  let g:ctrlp_match_window_bottom = 1                 " show at bottom of window
  let g:ctrlp_working_path_mode = 'ra'                " our working path is our vcs project or the current directory
  let g:ctrlp_mru_files = 1                           " enable most recently used files feature
  let g:ctrlp_jump_to_buffer = 2                      " jump to tab and buffer if already open
  let g:ctrlp_open_new_file = 'r'                     " open selections in a vertical split
  let g:ctrlp_open_multiple_files = 'vr'              " opens multiple selections in vertical splits to the right
  let g:ctrlp_arg_map = 0
  let g:ctrlp_dotfiles = 0                            " do not show (.) dotfiles in match list
  let g:ctrlp_showhidden = 0                          " do not show hidden files in match list
  let g:ctrlp_split_window = 0
  let g:ctrlp_max_height = 40                         " restrict match list to a maxheight of 40
  let g:ctrlp_use_caching = 0                         " don't cache, we want new list immediately each time
  let g:ctrlp_max_files = 0                           " no restriction on results/file list
  let g:ctrlp_working_path_mode = ''
  let g:ctrlp_dont_split = 'NERD_tree_2'              " don't split these buffers
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|gitkeep)$',
    \ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png|psd|DS_Store|ctags|gitattributes)$'
    \ }
  " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  " if you want to use git for this rather than ag
  " let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
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

Plugin 'mileszs/ack.vim'
  cabbrev Ack Ack!
  cabbrev Ag Ag!
  let g:ackprg = 'ag --vimgrep'
  let g:ackhighlight = 1
Plugin 'skwp/greplace.vim'
Plugin 'dkprice/vim-easygrep'
  let g:EasyGrepCommand=1
  let g:EasyGrepRecursive=1
  let g:EasyGrepIgnoreCase=1
  let g:EasyGrepHidden=0
  let g:EasyGrepFilesToExclude='*.swp'
  let g:EasyGrepPatternType='fixed'

  if executable('ag')
     " Note we extract the column as well as the file and line number
     set grepprg=ag\ --vimgrep
     set grepformat=%f:%l:%c%m
  endif

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
Plugin 'groenewege/vim-less'

"""""" UI
Bundle 'scrooloose/syntastic'
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_check_on_open=0
  let g:syntastic_enable_signs=1
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'wting/rust.vim'
Plugin 'chrisbra/color_highlight'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'benjaminwhite/Benokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mkitt/tabline.vim'
Plugin 'bling/vim-airline'       " UI statusbar niceties
  set laststatus=2               " enable airline even if no splits
  let g:airline#enable#branch=1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='light'
  let g:airline#left#sep = ''
  let g:airline#right#sep = ''
  let g:airline#linecolumn#prefix = '␊ '
  let g:airline#linecolumn#prefix = '␤ '
  let g:airline#linecolumn#prefix = '¶ '
  let g:airline#branch#prefix = '⎇ '
  let g:airline#paste#symbol = 'ρ'
  let g:airline#paste#symbol = 'Þ'
  let g:airline#paste#symbol = '∥'
  let g:airline#extensions#syntastic#enabled=1
  let g:airline#extensions#nrrwrgn#enabled = 1

  " Tabline settings
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#tabline#tab_nr_type = 0
  let g:airline#extensions#tabline#show_tab_nr = 0
  let g:airline#extensions#tabline#show_tab_type = 0
  let g:airline#extensions#tabline#tab_min_count = 1
  let g:airline#extensions#tabline#show_close_button = 0

""""""" Templates
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'mattn/emmet-vim'
  " Let me expand emmet abbr with <TAB>
  let g:user_emmet_expandabbr_key = ',<Tab>'

Plugin 'dag/vim2hs'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
" Plugin 'tpope/vim-haml'

call vundle#end()

" ==========================================================
" UI Settings
" ==========================================================

set t_Co=256
set background=dark
colorscheme Benokai
" colorscheme molokai
" colorscheme solarized
" let g:solarized_termcolors=256
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

" ==========================================================
" Shortcuts
" ==========================================================
" Warning: nightmare mode!
  " Disable mouse
  set mouse=
  " Disable <Arrow keys>
  inoremap <Up> <NOP>
  inoremap <Down> <NOP>
  inoremap <Left> <NOP>
  inoremap <Right> <NOP>
  noremap <Up> <NOP>
  noremap <Down> <NOP>
  noremap <Left> <NOP>
  noremap <Right> <NOP>
  inoremap # #

" Navigate with <Ctrl>-hjkl in Insert mode
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
" Navigate through wrapped lines
noremap j gj
noremap k gk
" Clear the search highlight in Normal mode
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
" Allow pasting blocks of code without indenting
set pastetoggle=<F2>
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
" Go through CamelCased words
map W <Plug>CamelCaseMotion_w
map B <Plug>CamelCaseMotion_b
map E <Plug>CamelCaseMotion_e
sunmap W
sunmap B
sunmap E

vmap <C-z-z> <esc>:wq

" Fix Shift+Tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

""""""" LEADER shortcuts
let mapleader=","
let g:mapleader = ","

  map ,t <Esc>:tabnew<CR>
  map ,b <Esc>:Gblame<CR>
  map ,n :call WorkaroundNERDTreeToggle()<CR>
  noremap ,w <Esc>:w<CR>
  noremap ,W <Esc>:w!!<CR>
  noremap <nowait> ,s <Esc>:w<CR>
  map ,q <Esc>:q<CR>
  map ,Q <Esc>:q!<CR>
  map ,c <Esc>:setlocal spell!<CR>
  nmap ,l :EasyBufferHorizontalBelow<CR>
  nmap ,r :NERDTreeFind<CR>
  map <leader>ba :1,1000 bd!<cr>
  nnoremap <leader>f :Ack! ""<Left>
  nmap <Leader>. :TagbarToggle<CR>

" Let me delete non-empty folders through netrw
let g:netrw_localrmdir='rm -r'

" Add new line below the cursor
" nmap " <S-o><Esc>
" nmap <CR> o<Esc>

" Ctags: open tag in vertical|horizontal split OPTION-[]
map ‘ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map “ :sp <CR>:exec("tag ".expand("<cword>"))<CR>

" Jump 10 lines OPTION-[jk]
map ∆ 10j
map ˚ 10k

" Quickly move between windows CTRL-[hjkl]
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k

" Switch tabs with OPTION-[,.]
map ≤ :tabp<CR>
map ≥ :tabn<CR>

" Switch buffers with OPTION-[hl]
map ¬ :bnext<CR>
map ˙ :bprev<CR>

" Easymotion plugin mappings
  map  ? <Plug>(easymotion-sn)
  omap ? <Plug>(easymotion-tn)

  " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
  " Without these mappings, `n` & `N` works fine. (These mappings just provide
  " different highlight method and have some other features )
  map  n <Plug>(easymotion-next)
  map  N <Plug>(easymotion-prev)

  " Easy jump to line
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)

  " Search by two characters
  " After search you can type . to repeat action performed after previous search
  nmap t <Plug>(easymotion-s)
  nmap s <Plug>(easymotion-s)

" Maximize current split window CTRL-0
" To return to equal sizes CTRL-=
map <C-w>0 :call FullScreenSplit()<CR>
function FullScreenSplit()
  :res
  :vertical res
endfunction

" Let me save files with SUDO
cmap w!! w !sudo tee % >/dev/null
:set path=$PWD/**

" For fugitive.git, dp means :diffput. Define dg to mean :diffget
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dp :diffput<CR>
" Automatically jump to a file at the correct line number
nnoremap <silent> ,gf :vertical botright wincmd F<CR>
" Open all changed git files
nnoremap ,ocf :OpenChangedFiles<CR>
" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" ==========================================================
" Basic Settings
" ==========================================================

syntax enable
filetype on                             " try to detect filetypes
filetype plugin indent on               " enable loading indent file for filetype
set number                              " Display line numbers
set numberwidth=1                       " using only 1 column (and 1 space) while possible
set title                               " show title in console title bar
set autoread                            " Reload files changed outside of vim
set scrolloff=8                         " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1"
set fileformats=unix
set showcmd
set cpoptions+=$
set virtualedit=all
set clipboard=unnamed
set gfn=Monaco:h16
" set colorcolumn=120
" e ++ff=unix
set tw=0
set wm=0
set wrap
set linebreak

""""""" Completion menu
set wildmenu                            " Menu completion in command mode on <Tab>
set wildmode=list:longest,full          " <Tab> cycles between all matching choices.
set wildignore=*.o,*.obj,*~             " Stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set completeopt-=preview

if has("gui_running")
  syntax on
  set hlsearch
  colorscheme Benokai
  set guifont=Ubuntu\ Mono\ derivative\ Powerline:h22
  set transparency=10
  set bs=2
  set ai
  set ruler
endif

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set mouse=a
" set cursorcolumn
set re=1 " Use old regex engine for better performance
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

autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd BufRead,BufNewFile *.hamlc setf haml

" au BufRead *.js set makeprg=eslint\ %
" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2
autocmd filetype javascript set sw=2 ts=2 expandtab
au FileType coffeescript setl sw=2 sts=2 et

" Exec js script in vim CTRL-w-n
map <C-w>n :call ExecNode() <cr>
function ExecNode()
  exec "! node %"
endfunction

" Toggle NERDTree after all buffers delete
function! WorkaroundNERDTreeToggle()
  try | NERDTreeToggle | catch | silent! NERDTree | endtry
endfunction

""""" Normalization ====================

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite * silent call DeleteTrailingWS()

""""" End Normalization ================

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
"
" Shamelessly stolen from Gary Bernhardt: https://github.com/garybernhardt/dotfiles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  if len(filenames) > 0
    exec "edit " . filenames[0]
    for filename in filenames[1:]
      exec "sp " . filename
    endfor
  end
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

