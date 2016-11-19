set nocompatible              " Vim settings, rather then Vi settings
filetype off                  " required
set visualbell t_vb=

call plug#begin('~/.vim_bundle')

" ==========================================================
" My Plugs here:
" ==========================================================
"
""""""" General plugins
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'majutsushi/tagbar'
Plug 'gorkunov/smartpairs.vim'
Plug 'gorkunov/smartgf.vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
  let g:UltiSnipsEditSplit='vertical'
  let g:UltiSnipsExpandTrigger = '<C-e>'
  let g:UltiSnipsJumpForwardTrigger = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  let g:UltiSnipsSnippetsDir='~/dotfiles/.vim/.vim/ultisnipssnippets'
Plug 'ervandew/supertab'
  let g:SuperTabDefaultCompletionType = '<C-n>'

Plug 'scrooloose/nerdtree'
" Plug 'low-ghost/nerdtree-fugitive'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-repeat'

Plug 'Valloric/YouCompleteMe'
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
Plug 'troydm/easybuffer.vim'
  let g:easybuffer_sort_mode = 's'
Plug 'vim-scripts/camelcasemotion'
Plug 'chrisbra/NrrwRgn'                             " :NR on visual-selected region to open it in narrowed window
Plug 'nelstrom/vim-visual-star-search'              " Star(*) search for the whole selection in visual mode
Plug 'tomtom/tcomment_vim'                          " gcc
Plug 'tpope/vim-surround'                           " ds, cs}), yss<p>
Plug 'briandoll/change-inside-surroundings.vim'     " cit to change inside tag, ci[ to change inside []
Plug 'godlygeek/tabular'                            " :Tab [pattern]
Plug 'tpope/vim-unimpaired'                         " [space, ]space etc
Plug 'jiangmiao/auto-pairs'                         " Automatic closing of quotes, parenthesis, brackets, etc.
Plug 'AndrewRadev/splitjoin.vim'                    " gS to split single-line statement, gJ for the opposite
Plug 'vim-scripts/YankRing.vim'                     " Go through paste-stack with OPTION-[pP]
  let g:yankring_replace_n_pkey='π'
  let g:yankring_replace_n_nkey='∏'
Plug 'terryma/vim-multiple-cursors'                 " Yay ^_^
  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-b>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'
Plug 'duff/vim-bufonly'

""""""" Navigation
Plug 'Lokaltog/vim-easymotion'
  let g:EasyMotion_smartcase = 1

Plug 'paradigm/TextObjectify'

Plug 'mileszs/ack.vim'
  cabbrev Ack Ack!
  cabbrev Ag Ag!
  let g:ackprg = 'ag --vimgrep'
  let g:ackhighlight = 1
Plug 'skwp/greplace.vim'
Plug 'dkprice/vim-easygrep'
  let g:EasyGrepCommand=1
  let g:EasyGrepRecursive=1
  let g:EasyGrepHidden=0
  let g:EasyGrepFilesToExclude='*.swp'

  if executable('ag')
     " Note we extract the column as well as the file and line number
     set grepprg=ag\ --vimgrep
     set grepformat=%f:%l:%c%m
  endif

"""""" JavaScript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs = 'jquery,underscore,react,rambda'
Plug 'othree/es.next.syntax.vim'

Plug 'ternjs/tern_for_vim'
Plug 'crusoexia/vim-javascript-lib'
" Plug 'mxw/vim-jsx'
"   let g:jsx_ext_required = 0
" Plug 'jsx/jsx.vim'
" Plug 'moll/vim-node'
" Plug 'ahayman/vim-nodejs-complete'
" Plug 'facebook/vim-flow'

Plug 'elzr/vim-json'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'isRuslan/vim-es6'
Plug 'kchmck/vim-coffee-script'

"""""" Plugin ''CSS
Plug 'JulesWang/css.vim'
" Plug 'aaronjensen/vim-sass-status'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'lukaszb/vim-web-indent'
Plug 'groenewege/vim-less'

"""""" UI
Plug 'scrooloose/syntastic'
  " let g:syntastic_css_checkers = ['stylelint']
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_javascript_eslint_exec = 'eslint_d' " sudo npm i -g eslint_d
  let g:syntastic_javascript_eslint_args = '--parser=babel-eslint'
  let g:syntastic_check_on_open=1
  let g:syntastic_enable_signs=1
  let g:syntastic_mode_map = {
  \ 'passive_filetypes': ['html', 'haml', 'jade']
  \ }
Plug 'airblade/vim-gitgutter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'wting/rust.vim'
Plug 'chrisbra/color_highlight'
Plug 'jonathanfilip/vim-lucius'
Plug 'benjaminwhite/Benokai'
Plug 'jaxbot/semantic-highlight.vim'
  let g:semanticEnableFileTypes = ['javascript', 'javascript.jsx', 'coffee', 'py', 'rb']
Plug 'w0ng/vim-hybrid'
  let g:hybrid_custom_term_colors = 1
  let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'mkitt/tabline.vim'

Plug 'bling/vim-airline'       " UI statusbar niceties
  set laststatus=2               " enable airline even if no splits
  let g:airline#enable#branch=1
  let g:airline_powerline_fonts = 1
  " let g:airline_theme='light'
  " let g:airline_theme='hybrid'
  let g:airline_theme='oceanicnext'
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
  let g:airline#extensions#hunks#enabled = 0

  " Tabline settings
  let g:airline#extensions#tabline#enabled = 1
  " Formatter defined in
  " autoload/airline/extensions/tabline/formatters/jsformatter.vim
  let g:airline#extensions#tabline#formatter = 'jsformatter'
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#tabline#tab_nr_type = 0
  let g:airline#extensions#tabline#show_tab_nr = 0
  let g:airline#extensions#tabline#show_tab_type = 0
  let g:airline#extensions#tabline#tab_min_count = 1
  let g:airline#extensions#tabline#show_close_button = 0

" """"""" Templates
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-jade'
Plug 'mattn/emmet-vim'
  " Let me expand emmet abbr with <TAB>
  let g:user_emmet_expandabbr_key = ',<Tab>'

Plug 'dag/vim2hs'
Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-haml'

" =========================================================

if has("gui_running")
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
    let g:ctrlp_by_filename = 0                         " Search by filename
    let g:ctrlp_match_window_bottom = 1                 " show at bottom of window
    let g:ctrlp_working_path_mode = 'ra'                " our working path is our vcs project or the current directory
    let g:ctrlp_mru_files = 1                           " enable most recently used files feature
    let g:ctrlp_jump_to_buffer = 2                      " jump to tab and buffer if already open
    let g:ctrlp_open_new_file = 'r'                     " open selections in a vertical split
    let g:ctrlp_open_multiple_files = 'vr'              " opens multiple selections in vertical splits to the right
    let g:ctrlp_arg_map = 0
    let g:ctrlp_split_window = 0
    let g:ctrlp_max_height = 40                         " restrict match list to a maxheight of 40
    let g:ctrlp_use_caching = 0                         " don't cache, we want new list immediately each time
    let g:ctrlp_max_files = 0                           " no restriction on results/file list
    let g:ctrlp_working_path_mode = ''
    let g:ctrlp_dont_split = 'NERD_tree_2'              " don't split these buffers
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|gitkeep)$',
      \ 'file': '\v\.(svg|exe|so|dll|log|gif|jpg|jpeg|png|psd|DS_Store|ctags|gitattributes)$'
      \ }
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
  Plug 'junegunn/fzf.vim'
    set rtp+=/usr/local/opt/fzf
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

  nmap <c-p> :FZF<CR>

  " Plug 'ryanoasis/vim-devicons'
  " " -----------------------------------------------------------------------------
  " " SETTINGS - NERDTree
  " " -----------------------------------------------------------------------------
  " let g:NERDTreeAutoCenter          = 1
  " let g:NERDTreeAutoCenterThreshold = 8
  " let g:NERDTreeChDirMode           = 2
  " let g:NERDTreeHighlightCursorline = 1
  " let g:NERDTreeIgnore              = ['.DS_Store', '.git$[[dir]]', 'target$[[dir]]']
  " let g:NERDTreeWinSize             = 50
  " let g:NERDTreeShowHidden          = 1
  " let g:NERDTreeShowLineNumbers     = 0
  " let g:NERDTreeMinimalUI           = 1
  "
  " " -----------------------------------------------------------------------------
  " " SETTINGS - devicons
  " " -----------------------------------------------------------------------------
  " let g:WebDevIconsOS                           = 'Darwin'
  " let g:WebDevIconsUnicodeDecorateFolderNodes   = 1
  " let g:webdevicons_conceal_nerdtree_brackets   = 1
  " let g:WebDevIconsNerdTreeAfterGlyphPadding    = ' '
  " let g:WebDevIconsUnicodeGlyphDoubleWidth      = 1
  " let g:WebDevIconsNerdTreeGitPlugForceVAlign = 0
  "
  " let g:NERDTreeFileExtensionHighlightFullName = 1
  " let g:NERDTreeExtensionHighlightColor = {
  "   \ 'coffee': 'f7fdb3',
  "   \ 'babelrc': 'ce93d8',
  "   \ 'eslintrc': 'b6b3fe',
  "   \ 'js':  'f0db4f',
  "   \ 'css': '90e255',
  "   \ 'jade': 'F16529'
  "   \}
  "
  " " Fix half display issue
  " let s:blank = ''
  " let g:NERDTreeExactMatchHighlightColor = {
  "   \ 'dropbox'                          : s:blank,
  "   \ '.ds_store'                        : s:blank,
  "   \ '.gitconfig'                       : s:blank,
  "   \ '.gitignore'                       : s:blank,
  "   \ '.bashrc'                          : s:blank,
  "   \ '.bashprofile'                     : s:blank,
  "   \ 'favicon.ico'                      : s:blank,
  "   \ 'license'                          : s:blank,
  "   \ 'node_modules'                     : s:blank,
  "   \ 'procfile'                         : s:blank,
  "   \}
endif

call plug#end()

" ==========================================================
" UI Settings
" ==========================================================

set t_Co=256
set background=dark
set termguicolors
" colorscheme hybrid
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
" override default theme search highlighter
autocmd ColorScheme * hi Search guibg=NONE ctermbg=NONE gui=underline cterm=underline term=underline guifg=#80cbc4 ctermfg=darkcyan
" colorscheme Benokai
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
nnoremap <Esc><Esc> :nohlsearch<return><esc>
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
nmap ge :TComment<CR>
nnoremap <space> li<space><Esc>

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
  " nmap ,l :EasyBufferHorizontalBelow<CR>
  nmap ,r :NERDTreeFind<CR>
  nmap ,m :MerginalToggle<CR>
  map <leader>ba :1,100bd!<cr>
  nnoremap <leader>f :Ack! ""<Left>
  nmap <Leader>. :TagbarToggle<CR>
  nmap <Leader>/ :BufOnly<CR>
  nmap <Leader>h :SemanticHighlightToggle<CR>

  if has("gui_running")
    nmap <leader>p :CtrlPMRU<cr>
    nmap <leader>o :CtrlPBuffer<cr>
  else
    nmap <leader>p :Buffers<CR>
    nmap <leader>o :Ag<cr>
    nmap <leader>l :Lines<cr>
  endif

" Let me delete non-empty folders through netrw
let g:netrw_localrmdir='rm -r'

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

" Move lines with OPTION-[;']
nnoremap … :m .+1<CR>==
nnoremap æ :m .-2<CR>==
inoremap … <Esc>:m .+1<CR>==gi
inoremap æ <Esc>:m .-2<CR>==gi
vnoremap … :m '>+1<CR>gv=gv
vnoremap æ :m '<-2<CR>gv=gv

" Easymotion plugin mappings
  map  ? <Plug>(easymotion-sn)
  omap ? <Plug>(easymotion-tn)

  " Easy jump to line
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)

  " Search by two characters
  " After search you can type . to repeat action performed after previous search
  nmap t <Plug>(easymotion-s2)
  nmap s <Plug>(easymotion-s)

" Maximize current split window CTRL-0
" To return to equal sizes CTRL-=
map <C-w>0 :call FullScreenSplit()<CR>
function FullScreenSplit()
  :NERDTreeClose
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
set nrformats=
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

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set mouse=a
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

au FocusLost * silent! wa

" ===========================================================
" FileType specific changes
" ============================================================

autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
" autocmd FileType javascript :SemanticHighlight()<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd BufRead,BufNewFile *.hamlc setf haml

au BufRead *.js set makeprg=eslint\ %
" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
" autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2
" autocmd filetype javascript set sw=2 ts=2 expandtab
" au FileType coffeescript setl sw=2 sts=2 et

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

map <Leader><Leader>T :call DeleteTrailingWS() <CR>
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

" -----------------------------------------------------------------------------
" INIT
" -----------------------------------------------------------------------------

" if exists("g:loaded_webdevicons")
"   call webdevicons#refresh()
" endif

" Sad truth :(
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
