set encoding=utf-8

set nocompatible               " be iMproved
filetype off                   " required!

call plug#begin('~/.vim/plugged')

Plug 'rbgrouleff/bclose.vim'
"
" Thanks tpope
Plug 'tpope/vim-fugitive' " Git
Plug 'tpope/vim-surround' " surround stuff easier
Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

Plug 'sheerun/vim-polyglot' " programming languages
Plug 'ervandew/supertab' " tab completion

Plug 'machakann/vim-highlightedyank' " highlight yank

Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletion

Plug 'vim-airline/vim-airline' " status bar

Plug 'airblade/vim-gitgutter'

Plug 'editorconfig/editorconfig-vim'

Plug 'luochen1990/rainbow'

Plug 'mattn/emmet-vim'

Plug 'luochen1990/rainbow'

" Languages
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql' 


" Theme
Plug 'haishanh/night-owl.vim'

call plug#end()

filetype plugin indent on
syntax on
set mouse=a
set relativenumber

" Rainbow parantheses
let g:rainbow_active = 1 

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme night-owl

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'nightowl' }


" Leader mappings
let mapleader = ","

" FZF
noremap <Leader>t :Files<CR>

set ai
set modeline
set wildignore=*.swp,*.bak,*.pyc,*.class,*~,node_modules,out,tmp

" Improves smoothness of redrawing when there are multiple windows and the
" terminal does not support a scrolling region.
set ttyfast

set t_Co=256
set t_ut=

" Use smart indenting
set smarttab expandtab autoindent
set cindent

" By default use 2 spaces as indentation
set tabstop=2 shiftwidth=2 softtabstop=2

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Command for resetting tab width
command -nargs=1 TabWidth setlocal shiftwidth=<args> tabstop=<args> softtabstop=<args>

" CSS properties and classes often use dash in their names. Add it to word
" match then.
au FileType css,jade,stylus,less,scss,handlebars,html,coffee,eruby,javascript setlocal iskeyword+=-

" Makefiles and gitconfig require tab
au FileType make,gitconfig setlocal noexpandtab

" set custom file types
au BufNewFile,BufRead *.zcml  setfiletype xml
au BufNewFile,BufRead *.pt  setfiletype xml
au BufNewFile,BufRead *.coffee  setfiletype coffee
au BufNewFile,BufRead *.cson  setfiletype coffee
au BufNewFile,BufRead *.ru setfiletype ruby
au BufNewFile,BufRead *.conf setfiletype conf
au BufNewFile,BufRead *.pde setfiletype arduino
au BufNewFile,BufRead *.jade setfiletype jade

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

augroup json
    au!
    au BufNewFile,BufRead *.json setlocal filetype=json
augroup END

" Show statusline always
set laststatus=2

" change the terminal's title
set title

" don't beep
set noerrorbells

" hide buffers instead of closing them
set hidden

" make backspace work like most other apps
set backspace=2

" Vim’s defaults are awful messy, leaving .swp files everywhere if the editor
" isn’t closed properly. This can save you a lot of time.
set nobackup
set noswapfile

" No Vi stuff anymore
set nocompatible

" Write the old file out when switching between files
set autowrite

" Map escape key to jj -- much faster to exit insert mode
imap jj <esc>

" Start window scrolling n lines before hitting the edge
set scrolloff=3

" Make Y behave like other capitals. Yank to end of line.
map Y y$

let g:yankring_history_dir = "$HOME/.vim"

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" When opening a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif

" Search and replace
""""""""""""""""""""
" This turns off Vim’s crazy default regex characters and makes searches use
" normal regexes.
nnoremap / /\v
vnoremap / /\v

" Word scouting
" Hilight all words matching the one under the cursor and mark the position to
" 'p'. Return to original word with <Leader><Space>
noremap <Space> mp*N
noremap  <Leader><Space> 'p \| :noh<cr>
" Same for visual mode selection too
vmap <Space> mpy/<C-r>"<cr>

" Simple word refactoring shortcut. Hit <Leader>r<new word> on a word to
" refactor it. Navigate to more matches with `n` and `N` and redo refactoring
" by hitting the dot key.
noremap <Leader>r mp*Nciw

" Clear search hilights
noremap å :noh<cr><esc>

" Join lines from below too. See :help J
map K kJ

" work together to highlight search results (as you type). It’s really quite
" handy, as long as you have the next line as well.
set incsearch
set showmatch
set hlsearch

" * Search & Replace
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" Close buffer
noremap <Leader>q :Bclose<CR>

" Write buffer (save)
noremap <Leader>w :w<CR>

" Always disable paste mode when leaving insert mode
au InsertLeave * set nopaste

" Show trailing whitespace characters
set list
set listchars=tab:▸—,trail:·,extends:…,nbsp:␣

" Show soft wrapped lines as …
set showbreak=↳
" set showbreak=⌞ " alternative

" Activate soft wrap by words
command! -nargs=* WrapText set wrap linebreak nolist
command! -nargs=* WrapCode set wrap linebreak list

" Some aliases for typoists
command W w
command Q q
command WQ wq
command Wq wq
command Qa qa
command QA qa
command Wa wa
command WA wa
command E e
nnoremap ; :
vnoremap ; :
nnoremap _ :
vnoremap _ :

" Show unsaved changes
command ShowUnsaved w !diff -u % -

" Folding
"set foldmethod=indent
set foldlevel=9999        " initially open all folds
command FoldAll set foldlevel=0
command FoldOne set foldlevel=1

" Use Q for formatting the current paragraph (or selection).
vmap Q gq
nmap Q gqap

"  to reselect the text that was just pasted so I can perform commands (like
"  indentation) on it
nnoremap <leader>v V`]

"" Window management

" Easily resize split windows with Ctrl+hjkl
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>

"" Extend navigation keys
map ö ^
map ä $
map Ö 0
map Ä g_
vmap ö ^
vmap ä $
vmap Ö 0
vmap Ä g_

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Reset messed up Vim. Redraw screen, clear search hilights and balance window
" splits
map <F5> :redraw! \| :noh \| <cr><c-w>=

" Move by screen lines instead of file line. Nice with long lines.
nnoremap j gj
nnoremap k gk
"
" Easily change directory to the file being edited.
nmap <Leader>cd :cd %:p:h<CR>

" Block navigation
map <Leader>k [%
map <Leader>j ]%

" tab navigation
map <Leader>n :tabnext<CR>

" buffer navigation
map <Leader>b :bnext<CR>

" thanks Waltsu
function! NumberToggle()
  if (&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

nnoremap <silent><leader>f :Ag <C-R>=expand("<cword>")<CR><CR>
