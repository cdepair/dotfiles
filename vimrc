" let g:no_turbux_mappings = 1

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'briancollins/vim-jst'
Bundle 'jgdavey/vim-blockle'
Bundle 'godlygeek/tabular'

syntax on
filetype plugin indent on

set nocompatible
" Set options for ctrlp.vim
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

let g:rails_projections = {
      \ "app/assets/javascripts/*.js.coffee": { "alternate": "spec/javascripts/%s_spec.coffee" },
      \ "spec/javascripts/*_spec.coffee": { "alternate": [
      \   "app/assets/javascripts/%s.js.coffee",
      \   "app/assets/javascripts/%s.jst.ejs"
      \ ] },
      \ "app/assets/javascripts/*.jst.ejs": { "alternate": "spec/javascripts/%s_spec.coffee" }
      \}

set wildignore+=*/spec/reports/*,*/vendor/*

set laststatus=2
set encoding=utf-8

map <leader>ff :CtrlP<CR>
map <leader>fb :CtrlPBuffer<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>t  :A<CR>
map <leader>ts :AS<CR>
map <leader>tv :AV<CR>
map <leader>rm :Rmodel<CR>
map <leader>rc :Rcontroller<CR>
map <leader>rh :Rhelper<CR>
map <leader>ru :Runittest<CR>
map <leader>rf :Rfunctionaltest<CR>
map <leader>ro :Robserver<CR>
map <leader>rv :Rview<CR>
map <leader>rl :Rlocale<CR>

set autoread    "Auto reload files changed outside of vim automatically
set wildmenu
set wildmode=list:longest
set splitright
set splitbelow
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set hidden
set number
set ic
set hlsearch
set incsearch
set noswapfile
set nobackup
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

runtime macros/matchit.vim

colorscheme molokai
set guifont=Monaco:h14
let g:Powerline_symbols = 'fancy'
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

nnoremap <Leader>[ :tabprevious<CR>
nnoremap <Leader>] :tabnext<CR>
nnoremap <silent> <Enter> :nohlsearch<Bar>:echo<CR>

augroup vimrc
autocmd!
autocmd GuiEnter * set columns=120 lines=70 number
augroup END

" remove whistespace at end of line before write
func! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  normal `Z
endfunc
au BufWrite * if ! &bin | call StripTrailingWhitespace() | endif

" Add syntax highlighting for rabl
au BufRead,BufNewFile *.rabl setf ruby

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
