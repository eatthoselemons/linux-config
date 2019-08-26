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
