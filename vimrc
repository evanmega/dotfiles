set nocompatible              " be iMproved, required
filetype off                  " required

set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=100
set number
syntax enable

" settings for word wrap does not add line break
set tw=80
set linebreak
set nolist
set wrapmargin=0

set foldmethod=indent
set nofoldenable
set ignorecase        " Makes search case-insensitive
set smartcase         " Makes caps required
color predawn

set hlsearch          " highlight search matches
set incsearch         " incremental searching

set path=.,/usr/include,,**

" Save .swp/.swo files to a dif directory
set directory=$HOME/.vim/swapfiles//

" Allows yank to pbcopy
set clipboard=unnamed

" Enable mouse lol
set mouse=a

" Set mapleader to spacebar
" let mapleader = "\<Space>"
" set mapleader to ,
let mapleader = ','

" set the runtime path to include Plugin and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Plugin should install plugins
"call vundle#begin('~/some/path/here')

" let Plugin manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'gioele/vim-autoswap'
Plugin 'mileszs/ack.vim'
Plugin 'ternjs/tern_for_vim'

" after delimitMate adds a bracket or whatever, can hit
" ctrl + c to split lines
imap <C-u> <CR><Esc>O

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntastic settings
let g:syntastic_javascript_checkers = ['standard']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_exec = 'tidy5'

"""""""""""""""""
" vimBetterWhitespace settings
"""""""""""""""""
autocmd BufEnter * EnableStripWhitespaceOnSave

"""""""""""""""""
" NERDTRee settings
"""""""""""""""""
let NERDTreeShowHidden=1
map <C-k><C-b> :NERDTreeToggle<CR>
map <C-k><C-f> :NERDTreeFind<CR>
nnoremap <leader>a :NERDTreeFind<cr>
let NERDTreeIgnore=['\.DS_Store$']

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

nnoremap <c-_> :call NERDComment(0,"toggle")<CR>
vnoremap <c-_> :call NERDComment(0,"toggle")<CR>

" json formatting
nmap =j :%!python -m json.tool<CR>

"""""""""""""""""
" ctrlp settings
"""""""""""""""""
let g:ctrlp_show_hidden=1
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = ""
" lets CtrlP use git to list files, which includes untracked files, but honours your gitignores
" from https://news.ycombinator.com/item?id=4470283
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

"""""""""""""""""
" ack / ag settings
"""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cabbrev Ack Ack!
nnoremap <leader>f :Ack!<space>

" EVAN
nnoremap E $
nnoremap B 0

nmap ;o o<Esc>k
nmap ;O O<Esc>j

nnoremap x "_x
vnoremap x "_x

" allow auto source for updates to vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
set number
