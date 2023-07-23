call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'jpalardy/vim-slime'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'rodjek/vim-puppet'
Plug 'cespare/vim-toml'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-rhubarb'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-unimpaired'
Plug 'rust-lang/rust.vim'
Plug 'lexysoda/vim-notes'
Plug 'tpope/vim-surround'
Plug 'pearofducks/ansible-vim'
Plug 'uarun/vim-protobuf'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

source ~/dotfiles/lsp.lua

colorscheme gruvbox
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set relativenumber
set scrolloff=5
set foldmethod=syntax
syntax enable

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.

let g:vimnotes_dir = "$HOME/notes"

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 0

let mapleader= ' '

inoremap jk <Esc>

" vim-notes
nnoremap <silent> <Leader>vn :NotesFZF<CR>
nnoremap <silent> <Leader>vd :NotesOpenDiary<CR>
nnoremap <Leader>vt :NotesOpenTopic 

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

function! SwitchSourceHeader()
  let extension = expand("%:e")
  if extension ==? "cpp"
    let extension = ".hpp"
  elseif extension ==? "hpp"
    let extension = ".cpp"
  endif
  let alternate = expand("%:r") . extension
  echom alternate
  if filereadable(alternate)
    execute ":edit" alternate
  endif
endfunction

nnoremap <leader>pp :call SwitchSourceHeader()<cr>
command! FormatCpp !/opt/clang-format-static/clang-format-10 -style=file -i %
