vim.cmd([[
  noremap K 10k
  noremap H ^
  noremap L $
  set expandtab
  set shiftwidth=2
  set tabstop=2

  filetype plugin indent on
  
  set smartcase
  set ignorecase
  syntax on
]])

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set("n", "J", "10j")

vim.wo.number = true

require("config.lazy")
require('leap').set_default_mappings()
