"Vim-Plug Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'MarcelRobitaille/wal.vim'
call plug#end()
colorscheme wal

" Map Leader
let mapleader=" "

" Tab KeyBindings
nnoremap <C-t> :tabnew<cr>
nnoremap <C-w> :tabclose<cr>
nnoremap <Leader>& 1gt<cr>
nnoremap <Leader>é 2gt<cr>
nnoremap <Leader>" 3gt<cr>
nnoremap <Leader>' 4gt<cr>
nnoremap <Leader>( 5gt<cr>

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Plugins Shortcut
map <C-f> :NERDTreeToggle<CR>
nnoremap <f5> :UndotreeToggle<CR> :UndotreeFocus<CR>
nnoremap <f4> :Goyo<CR>
let g:goyo_width=100
nnoremap <C-s> :Files!<CR>
map <C-l> :Limelight!!0.8<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Automatically re-read files of unmodified inside vim
set autoread

"Always show current position
set ruler

" Don't redraw while executing macros
set lazyredraw

"Show matching brackets when text indicator is over them
set showmatch
set mat=2

"Add a bit extra margin to the left
set foldcolumn=1

" Shortcut split navigation
map <C-h> <C-w>h
map <C-j>  <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Smart case sensitivity
set ignorecase
set smartcase

" Set cursor Highlight
" set cursorline
" set cursorcolumn
" highlight cursorline cterm=bold ctermbg=black

" Set true color
set termguicolors

"Allow mouse usage
set mouse=a

" Set Compatibility to Vim only
set nocompatible

" Automaically Wrap the Text that extends beyond the screen length
set wrap

" Encoding
set encoding=utf-8

" Remove trailing white spaces
autocmd BufWritePre * %s/\s\+$//e

" Show line Numbers
set number relativenumber

" Avoid wrapping a line in the middle of a word
set linebreak

" Set the window title, reflecting the file currently being edited
set title

" Directory to store backup files
"set dir=~/.cache/vim

"Display a confirmation dialog when closing an unsaved file
set confirm

"Increase the undo limit
"set history=1000

" Status Bar
set laststatus=2

" Does Searches Incremently
set incsearch

" Set default clipboard to the system clipboard
set clipboard=unnamedplus

" Highlight Search
set hlsearch

" Set Tab size to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Converts tabs to spaces
set expandtab
set autoindent
set fileformat=unix

"Filetype Plug
syntax on

" Enable autocompletion ctrl+n to activate
set wildmode=longest,list,full

"Splits Open at the bottom and right
set splitbelow splitright



















































