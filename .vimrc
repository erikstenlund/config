set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on

" Setting for plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree
map <C-n> :NERDTreeToggle<CR>

"Airline
set laststatus=2
let g:airline_powerline_fonts = 1
set noshowmode
set ttimeoutlen=100
set t_Co=256

"Tagbar
nmap <C-m> :TagbarToggle<CR>


" Regular settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoclose scratch while using omnicompletion
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Move visual lines
map j gj
map k gk

" Stop using arrows!!
noremap <Up>	<Nop>
noremap <Down>	<Nop>
noremap <Left>	<Nop>
noremap <Right>	<Nop>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use :E for explorer
cabbrev E Explore

set number
set relativenumber
set listchars=tab:▸\ ,eol:¬


" Keep .swp and backup files in a separate directory
set dir=~/.vim/.vimswapfiles//
set backupdir=~/.vim/.vimbackupfiles//


" Based on the example .vimrc file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow backspacing over everything in insert mode
set backspace=indent,eol,start


set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighing the last used search pattern.

syntax on
set hlsearch
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

augroup END
