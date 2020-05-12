" set nocompatible

setglobal nocompatible
setglobal pastetoggle=<F2>

set ttyfast
set lazyredraw

call plug#begin('~/.vim/plugged')

Plug 'calebsmith/vim-lambdify'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-sensible'
Plug 'gberenfield/cljfold.vim'
Plug 'ervandew/supertab'
Plug 'ajh17/VimCompletesMe'
Plug 'w0rp/ale'
Plug 'flowtype/vim-flow'
Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'janko-m/vim-test'
Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' }
Plug 'Shougo/echodoc.vim'
Plug 'fatih/vim-nginx', { 'for': 'nginx' }
Plug 'lepture/vim-jinja', { 'for': 'jinja' }
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'nanotech/jellybeans.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-projectionist'
Plug 'othree/html5.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joonty/vdebug', { 'on': 'VdebugStart' }
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
Plug 'tpope/vim-ragtag'
Plug 'Quramy/tsuquyomi'
Plug 'mhartington/vim-typings'
Plug 'Shougo/unite.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'elzr/vim-json'
Plug 'vim-scripts/JavaScript-Indent'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
        \ 'do': 'npm install',
        \ 'for': ['javascript', 'typescript', 'css', 'html', 'json'],
        \ }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }
Plug 'moll/vim-node'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'reedes/vim-lexical'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure', 'scheme', 'racket'] }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

call plug#end()

set rtp+=/root/.fzf

let mapleader = "\<Space>"

" https://github.com/vim/vim/blob/master/runtime/doc/russian.txt
" Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" setlocal spell spelllang=en_us,ru_ru

" set visualbell
set completeopt=noinsert,menuone,noselect

if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw
set ttyfast

set shortmess+=c

set cursorline
set hidden
set nofoldenable
set wrap
set linebreak
set number relativenumber
set nu rnu
set hlsearch
set ignorecase
set smartcase
set termguicolors

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

set showcmd       " display incomplete commands
set autowrite     " Automatically :write before running commands

" Use one space, not two, after punctuation.
" set nojoinspaces

" set softtabstop=4
set expandtab
" set noexpandtab
set softtabstop=2
set shiftwidth=2

set splitbelow
set cmdheight=2
set signcolumn=yes
set scrolloff=3

silent! colorscheme jellybeans

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

""" Basics Keymaps

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
nmap j gj
nmap k gk

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nmap <silent> <leader>tn :TestNearest<CR>
" nmap <silent> t<C-f> :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>

nmap <silent> <leader>s :w!<CR>
nmap <silent> <leader>q :q!<CR>

" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

""" Plugins Keymaps

nmap <C-m> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

nnoremap <leader>b :Buffers<CR>

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

vmap <leader>y :w! /tmp/.vbuf<CR>
nmap <leader>y :.w! /tmp/.vbuf<CR>
nmap <leader>p :r /tmp/.vbuf<CR>

map <leader>cr :GrammarousCheck --lang=ru --preview<CR>

""" Plugin Settings

" configure clojure folding
let g:clojure_foldwords = "def,defn,defmacro,defmethod,defschema,defprotocol,defrecord"


" clojure rainbow parens
let g:rainbow_active = 1
let g:rainbow_conf = {
      \  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \  'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \  'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \  'separately': {
      \      '*': 0,
      \      'clojure': {},
      \  }
      \}

" a few extra mappings for fireplace
" evaluate top level form
au BufEnter *.clj nnoremap <buffer> cpt :Eval<CR>
" show last evaluation in temp file
au BufEnter *.clj nnoremap <buffer> cpl :Last<CR>


let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#config_precedence = 'file-override'

let g:LanguageClient_autoStart = 1
set shell=/bin/zsh

let g:LanguageClient_serverCommands = {
       \ 'javascript': ['javascript-typescript-stdio'],
       \ 'javascript.jsx': ['javascript-typescript-stdio'],
       \ }

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1
let g:lexical#spelllang = ['en_us', 'ru_ru']
let g:airline#extensions#ale#enabled = 1

let g:ale_completion_enabled = 1
let g:ale_linters = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint', 'tslint', 'tsserver'],
      \   'racket': ['raco'],
      \   'haskell': ['ghc'],
      \   'yaml': ['yamllint']
      \}

let g:ale_fixers = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'html': ['tidy'],
      \ 'racket': ['raco'],
      \ 'haskell': ['ghc']
      \ }

let g:ale_javascript_tsserver_use_global = 1
let g:ale_javascript_eslint_use_global = 1

let test#strategy = "neovim"

let g:vim_markdown_folding_disabled = 1

let g:SuperTabDefaultCompletionType = '<C-n>'

"---BEGIN Rainbow parentheses---
" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]

" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
"---END Rainbow parentheses---

nnoremap ff :normal! gg=G``<CR>

noremap <Leader>y "+y

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :GFiles .<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fa :Ag<CR>

let NERDTreeIgnore = ['\.pyc$', '\.retry$']

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nmap <silent> // :nohlsearch<CR>
noremap ,hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" nnoremap <silent> <bs> <C-w><Left>

" let g:bufExplorerDisableDefaultKeyMapping=1
" let g:bufExplorerShowRelativePath=1

" let g:deoplete#enable_at_startup = 1

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" if filereadable(expand("~/.vimrc.after"))
"   source ~/.vimrc.after
" endif

" augroup Common
"   autocmd!
"   autocmd BufEnter * EnableStripWhitespaceOnSave
" augroup END

augroup FileTypeTetect
  autocmd!
  au BufEnter *.markdown,*.mkd,*.md setl wrap tw=79
  au BufEnter *.json setl ft=javascript
  autocmd BufEnter *.php setlocal ts=4 sw=4 sts=4
  autocmd BufEnter *.java setlocal ts=4 sw=4 sts=4
  autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
  autocmd BufNewFile,BufRead *.slime setlocal filetype=slim
  autocmd BufNewFile,BufRead *.jsh setlocal filetype=java
  au BufEnter *.js setl ts=2 sw=2 sts=2
  au BufEnter *.html setl ts=4 sw=4 sts=4
  " au BufEnter *.tex setl wrap tw=79 fo=tcqor
  " au BufEnter *.[ch] setl cindent
  " au BufEnter *.[ch]pp setl cindent
  au BufEnter Makefile setl ts=4 sts=4 sw=4 noet list
  " au BufEnter *.es6 setf javascript
augroup END

" Open new split for C+hjkl, if split doesnt exist
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
    if (t:curwin == winnr())
      if (match(a:key,'[jk]'))
        wincmd v
      else
        wincmd s
      endif
   exec "wincmd ".a:key
  endif
endfunction

autocmd BufReadPost * call vimlambdify#lambdify("Statement", "scmNiceLambda", "lambda")
