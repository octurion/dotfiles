call plug#begin('~/.vim/plugged')

" My plugins:
Plug 'flazz/vim-colorschemes'     " Colorschemes

" Syntax files
Plug 'rust-lang/rust.vim'                 " Rust syntax
Plug 'cespare/vim-toml', {'for': 'toml'}  " TOML syntax
Plug 'peterhoeg/vim-qml', {'for': 'qml'}  " QML syntax (Qt Quick)
Plug 'jceb/vim-orgmode', {'for': 'org'}   " Org mode
Plug 'chrisbra/csv.vim'                   " CSV stuff

Plug 'tpope/vim-speeddating'

Plug 'junegunn/vim-easy-align'    " Alignment plugin
Plug 'ctrlpvim/ctrlp.vim'         " File searching
Plug 'chrisbra/vim-diff-enhanced' " Patience diff algorithm

" Load Vim-Dispatch first before the plugins coming next
Plug 'tpope/vim-dispatch' " Asynchronous command execution

" Plugins with optional dependency on Vim-Dispatch
Plug 'tpope/vim-fugitive' " Fugitive (Git)
Plug 'Valloric/YouCompleteMe', {'for': ['c', 'cpp']} " C and C++ autocompletion

" Vim-airline must run last because it integrates with lots of other plugins
Plug 'vim-airline/vim-airline-themes' " Vim-airline themes
Plug 'vim-airline/vim-airline'        " Better status line

" Vundle config end
call plug#end()

" Ctrl-P ignore list:
" Some directories starting with a dot and lots of common non-text files
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|dll|o|so|class|jar|pyc)$',
    \ }
" Use git ls if possible
let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" If in a repository, search the repository instead of the current directory
let g:ctrlp_working_path_mode = 'rw'
" Filename completion is probably the better default
let g:ctrlp_by_filename = 1

" Don't ask for confirmation every time YCM loads the custom Python script
let g:ycm_confirm_extra_conf = 0

" Use the vim-airline tab bar instead of the Gvim default one
let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#show_buffers    = 0 " Don't display buffers
let g:airline#extensions#tabline#show_tab_type   = 0 " More tabline real estate
let g:airline#extensions#tabline#tab_nr_type     = 2 " Splits and tab number
" Airline & YCM integration
let g:airline#extensions#ycm#enabled = 1
" Allow spaces after tabs in C/C++-style comments
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Use the Patience diff algorithm
let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'

" General
set number
set undolevels=3000
set history=1000               " Command history size
set virtualedit=block
set ignorecase
set wildignorecase             " Ignore case for file completion (like zsh)
set wildmode=longest,list,full " Make <Tab> in command mode behave kinda like zsh
set dir=~/.swapfiles           " Place swapfiles in one place
set mouse=a                    " Enable mouse
set backspace=indent,eol,start " Make backspace key work as intended
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set smartindent

" Searching and replacing
set gdefault
set hlsearch
set incsearch

" Copying/pasting
set clipboard^=unnamedplus " "+p is now unnecessary

" Show matching parentheses when typing
set showmatch
set matchtime=3

" Eliminate lag when going into insert mode sometimes
set timeout
set timeoutlen=1000
set ttimeoutlen=100

" No beeping (for terminals that insist on beeping all the time)
set t_vb=

" Status bar options
set laststatus=2 "Always display the status bar

set colorcolumn=+0   " Margin relative to current textwidth value
set formatoptions-=t " No auto line wrapping
set formatoptions+=j " Remove comment leader when joining lines

" Make UTF-8 the default encoding even on Windows
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8
" Prefer UNIX-style lines to DOS-style lines
set fileformat=unix
set fileformats=unix,dos

" Filetype settings
filetype plugin indent on
syntax on

" Default configs for files
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" 80 chars per column as a default
set textwidth=80

set matchpairs+=<:>

" File-specific ones
au FileType c,cpp,cuda,make,lex,yacc setlocal ts=4 sw=4 sts=0 noexpandtab
au FileType c,cpp,cuda setlocal makeprg=ninja\ -C\ build
set cino+=N-s,:0,i-s,j1,(0,ws,Ws
au FileType html setlocal ts=2 sw=2 sts=2
" 100 chars per column for Java files
au FileType java setlocal textwidth=100
" Only necessary when working with LaTeX documents without a makefile
" au FileType tex setlocal makeprg=xelatex\ %

" Y is now consistent with C and D commands
nnoremap Y y$

" Nobody uses Ex mode
nnoremap Q <Nop>

" Also nobody uses Shift+k
nnoremap K <Nop>
vnoremap K <Nop>

" Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use F12 for compiling
nnoremap <F12> :make!<CR>

" Toggle search highlighting on and off
nnoremap <F3> :noh<CR>

" Browser-style tab navigation
nnoremap <C-T> :tabnew<CR>
nnoremap <C-F4> :tabclose<CR>
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

" Ctrl+S to save. Picked up the habit of pressing Ctrl+S while using VsVim
" and I'm too lazy to change that.
nnoremap <C-s> :w<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)

" Annoying shift key fixes
"cnoreabbrev W w
"cnoreabbrev Wq wq
"cnoreabbrev Q q
"cnoreabbrev Qa qa
"cnoreabbrev E e

" Spelling mistakes I make all the time (because I can't brain)
iab teh the
iab heigth height

" Appearance
set guifont=Ubuntu\ Mono\ 13
set guioptions=aeit
if has('gui_running')
    colorscheme molokai
endif
