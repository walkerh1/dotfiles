" BASIC SETTINGS
" =============================================================================
set scrolloff=8 " scroll starts 8 lines from top or bottom
set number " include line numbers
set relativenumber " include relative numbers
set tabstop=4 softtabstop=4 " set tab to equal 4 spaces
set shiftwidth=4 " how many spaces inserted for '>' and '<' motions
set expandtab " expand tabs into spaces
set smartindent " be smart about indenting
set noerrorbells " silence terminal error bells
set hlsearch is " highlight all search matches (incremental match)

syntax on " syntax highlighting

let &t_EI = "\e[2 q" " non-blinking thin cursor for insert mode
let &t_SI = "\e[6 q" " non-blinking think cursor for every other mode


" PLUGINS
" =============================================================================
call plug#begin('~/.vim/plugged')
    " fuzzzy finder plugin
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " theme plugin
    Plug 'ayu-theme/ayu-vim'

    " LSP support plugin
    Plug 'prabirshrestha/vim-lsp'
call plug#end()

" set color from ayu-theme plugin
set termguicolors
colorscheme ayu


" KEY REMAPPINGS
" =============================================================================
" set leader variable for remappings
let mapleader = " "

" insert mode
inoremap jj <ESC>

" open finder in new window (vertical split)
nnoremap <leader>pv :Vex<CR>

" open fuzzy finder in git repo
nnoremap <C-p> :GFiles<CR>

" open fuzzy finder in non-git directory
nnoremap <leader>pf :Files<CR>

" navigate up and down quickfix list
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" remove highlighting from search
nnoremap <C-l> :nohlsearch<CR>

" move highlighted text up and down (respects indentation)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
