call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jpalardy/vim-slime'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'rodjek/vim-puppet'
Plug 'cespare/vim-toml'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-rhubarb'

call plug#end()

colorscheme gruvbox
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set relativenumber
set conceallevel=2
syntax enable

let mapleader= ' '

" Use OSX system clipboard
if has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" Let slime use tmux
let g:slime_target = "tmux"

" FZF
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>ag :Ag<CR>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
nnoremap <silent> <Leader><Leader> :Files<CR>
