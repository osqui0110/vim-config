" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'kana/vim-arpeggio'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'ap/vim-buftabline'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'tpope/vim-fugitive'
call plug#end()

" Basic SetUp
set backspace=indent,eol,start
set shell=/bin/zsh
let g:pymode_python = 'python3'
colorscheme gruvbox
set bg=dark
filetype plugin on
set relativenumber
set nu
syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set cursorline
set mouse=a
set nohlsearch
set noerrorbells
set incsearch
set scrolloff=8
set signcolumn=yes
set hidden
set splitbelow
"Key maps
let mapleader=" "
nnoremap bd :bd<cr>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
inoremap <C-P> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>
map <C-r> :NERDTreeToggle<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <leader>fs :Files<cr>
nnoremap <leader>gs :CocSearch
" Arpeggio maps
" Loading arpeggio
call arpeggio#load()
call arpeggio#map('n', '', 0, '<Leader>f', ':NERDTreeFind<CR>')
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
call arpeggio#map('n', '', 0, '<Leader>o', 'o<Esc>')
call arpeggio#map('n', '', 0, '<Leader>O', 'O<Esc>')
call arpeggio#map('n', '', 0, '<Leader>7', '<Leader>cs')
call arpeggio#map('n', '', 0, '<Leader>8', '<Leader>cu') 

" AutoCommands
:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
