set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kchmck/vim-coffee-script'
Plugin 'davidhalter/jedi-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'ternjs/tern_for_vim'

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
set ttimeoutlen=100 "this messes up vim-surround!
set t_Co=256

"Tagbar (Obs <C-m> == Enter)
map <C-m> :TagbarToggle<CR> 

"Syntastic default
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Regular settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoclose scratch while using omnicompletion
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Move visual lines
map j gj
map k gk

" Add matching parenthesis and leave with Ctrl+j
inoremap ( ()<Esc>:let leavechar=")"<CR>i
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a

" Leader keys
let mapleader = ","
let g:mapleader = ","

" Map save to leader key
nmap <leader>w :w!<CR>

" Use F2 - F12 to something useful
map <F2> :ls<CR>
map <F3> :reg<CR>

" Clipboard shortcuts
noremap <leader>y "+y
noremap <leader>p "+p

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

" Solves :Wq :wQ :WQ rage
nmap :W :w
nmap :Wq :wq
nmap :WQ :wq
nmap :wQ :wq
nmap :Q :q

" Line numbers and nice tab and eol when using set list
set number
set relativenumber
set listchars=tab:▸\ ,eol:¬

" Set tabstop, softtabstop and shiftwidth to the same value, from vimCasts
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" Keep .swp and backup files in a separate directory
set dir=~/.config/nvim/.vimswapfiles//
set backupdir=~/.config/nvim/.vimbackupfiles//


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
