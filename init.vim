call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf'

call plug#end()

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set relativenumber 
syntax enable
highlight LineNr ctermfg=DarkGrey

" Use OSX system clipboard
set clipboard=unnamed
