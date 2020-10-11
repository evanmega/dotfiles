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
set foldlevel=99
set ignorecase        " Makes search case-insensitive
set smartcase         " Makes caps required

" use more colors?
" if (has("termguicolors"))
 " set termguicolors
" endif

" color predawn
color vice

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
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'roxma/nvim-yarp'
" Plugin 'roxma/vim-hug-neovim-rpc'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate' " do I use this? does it even work?
Plugin 'gioele/vim-autoswap'
Plugin 'mileszs/ack.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'JamshedVesuna/vim-markdown-preview'

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

" after delimitMate adds a bracket or whatever, can hit
" ctrl + c to split lines
imap <C-u> <CR><Esc>O

"""""""""""""""""
" vimBetterWhitespace settings
"""""""""""""""""
" let g:better_whitespace_filetypes_blacklist=['<filetype1>', '<filetype2>', '<etc>']
" let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
" let g:strip_whitespace_on_save = 1
" autocmd BufEnter * EnableStripWhitespaceOnSave

" -------- NERDTRee --------
let NERDTreeShowHidden=1
nnoremap <leader>a :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR> "what is this again?
let NERDTreeIgnore=['\.DS_Store$']

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
" let g:NERDTrimTrailingWhitespace = 1

nnoremap <c-_> :call NERDComment(0,"toggle")<CR>
vnoremap <c-_> :call NERDComment(0,"toggle")<CR>

" json formatting
nmap =j :%!python -m json.tool<CR>

"from Julian's dotfiles
" -------- DEOPLETE --------
" call deoplete#enable()
" let g:deoplete#enable_at_startup=1
" 
" " Closes the suggestion popup when we leave insert mode (i.e. when we've chosen something)
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" 
" " Changes autocomplete button to TAB
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ deoplete#mappings#manual_complete()
" function! s:check_back_space() abort "{{{
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}

"""""""""""""""""
" ctrlp settings
"""""""""""""""""
let g:ctrlp_show_hidden=1
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = ""
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" lets CtrlP use git to list files, which includes untracked files, but honours your gitignores
" from https://news.ycombinator.com/item?id=4470283
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"""""""""""""""""
" ack / ag settings
"""""""""""""""""
" for silver surfer (switched to ripgrep)
  "***ran into errors when big files present
  "ERR expected to read <num> bytes but read <num>
" if executable('ag')
  " let g:ackprg = 'ag --vimgrep'
" endif

" if executable('rg')
  " set grepprg=rg\ --color=never
  " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  " let g:ctrlp_use_caching = 0
" endif

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  " smart-case set's -i automatically (case-insensitive flag) if no uppercase
  " characters present in search string
  let g:ackprg = 'rg --smart-case --vimgrep --no-heading'
endif

cabbrev Ack Ack!
nnoremap <leader>f :Ack!<space>


"""""""""""""""""
" markdown settings
"""""""""""""""""
let vim_markdown_preview_hotkey='<F6>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_perl=1
let g:vim_markdown_new_list_item_indent = 0 " avoid indent on newline following list item

" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F5> :!open -a "Google Chrome.app" %:p<CR>'

" EVAN
nnoremap E $
nnoremap B 0

nmap ;o o<Esc>k
nmap ;O O<Esc>j

nnoremap x "_x
vnoremap x "_x

" add 2 lines:
" 80 dashes
" todays date with format > Thu, 01/02/19
nnoremap <C-n><C-d> 80i-<Esc><CR>i<C-R>=strftime("%a, %m/%d/%y")<Esc><CR><Esc>

" allow auto source for updates to vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
set number

"""""""""""""""""
" weird screen issues w tmux?
"""""""""""""""""
if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

