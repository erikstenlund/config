set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'davidhalter/jedi-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'sickill/vim-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'rhysd/vim-clang-format'

call vundle#end()
filetype plugin indent on

"NERDTree
map <C-n> :NERDTreeToggle<CR>

" Status bar
set statusline+=%F
set statusline+=\ - 
set statusline+=%y

" Clang format
autocmd FileType c,cpp ClangFormatAutoEnable
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:clang_format#auto_format_on_insert_leave = 1

" Tagbar <C-m> == Enter
map <C-m> :TagbarToggle<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set tags=./tags;

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use Ctrl+Space for omni-completion
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  \ "\<lt>C-n>" :
  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

" enable global scope search
let OmniCpp_GlobalScopeSearch = 1
" show function parameters
let OmniCpp_ShowPrototypeInAbbr = 1
" show access information in pop-up menu
let OmniCpp_ShowAccess = 1
" auto complete after '.'
let OmniCpp_MayCompleteDot = 1
" auto complete after '->'
let OmniCpp_MayCompleteArrow = 1
" auto complete after '::'
let OmniCpp_MayCompleteScope = 0
" don't select first item in pop-up menu
let OmniCpp_SelectFirstItem = 0

" gVim specific settings
if has('gui_running')
	set vb t_vb=
	set guioptions-=T "no toolbar
	set guioptions-=m "no menubar
	set guioptions-=r "no right-hand scroll bar
	set guioptions-=L "no left-hand scroll bar
	colorscheme gruvbox
	set background=dark

	set guifont=Monospace\ 12
endif

" Highlight color
highlight IncSearch ctermfg=yellow ctermbg=NONE
highlight Search ctermfg=yellow ctermbg=NONE

highlight SignColumn ctermbg=black
highlight SyntasticError ctermbg=white ctermfg=red
highlight SyntasticWarning ctermbg=yellow
highlight SyntasticStyleError ctermbg=yellow
highlight SyntasticStyleWarning ctermbg=yellow

" Autoclose scratch while using omnicompletion
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Move visual lines
map j gj
map k gk

" Leader keys
let mapleader = ","
let g:mapleader = ","

" Map save to leader key
nmap <leader>w :w!<CR>

" Use F2 - F12 to something useful
map <F2> :ls<CR>
map <F3> :reg<CR>
map <F4> :!make<CR>

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
set dir=~/.vim/.vimswapfiles//
set backupdir=~/.vim/.vimbackupfiles//

" Allow backspacing over everything in insert mode
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
