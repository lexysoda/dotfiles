call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jpalardy/vim-slime'

call plug#end()

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set relativenumber 
syntax enable
highlight LineNr ctermfg=DarkGrey

let mapleader= ' '

" Use OSX system clipboard
set clipboard=unnamed

" Nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>

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
