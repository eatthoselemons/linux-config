if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/tpope/vim-surround.git' 
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'
Plug 'https://github.com/junegunn/vim-easy-align.git'
Plug 'https://github.com/easymotion/vim-easymotion.git'
Plug 'https://github.com/junegunn/goyo.vim.git'
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'https://github.com/sheerun/vim-polyglot.git'
Plug 'https://github.com/wesQ3/vim-windowswap.git'
Plug 'https://github.com/junegunn/limelight.vim.git'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'https://github.com/janko/vim-test.git'
Plug 'https://github.com/wsdjeg/FlyGrep.vim.git'
Plug 'https://github.com/jeetsukumaran/vim-buffergator.git'
Plug 'https://github.com/mattn/emmet-vim.git'
Plug 'https://github.com/chriskempson/base16-vim.git'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'adelarsq/vim-hackernews'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-dispatch'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()

"colorscheme seoul256
"let g:seoul256_background=235

set background=dark


inoremap jk <Esc>

noremap H ^
noremap L $

noremap J 10j
noremap K 10k

let maplocalleader=","

set number

if filereadable(expand("~/.vim/vimrc_background"))
	let base16colorspace=256
	source ~/.vim/vimrc_background
endif


set expandtab
set shiftwidth=2
set tabstop=2

filetype plugin indent on

set smartcase
set ignorecase
syntax on


noremap <F9>  :execute "vertical botright copen \| vertical resize 60"<cr>
noremap <F10> :execute "copen \| resize 40"<cr>

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
"let g:airline#extensions#ale#enabled = 1

autocmd BufNewFile,BufRead *.shlib set filetype=sh
