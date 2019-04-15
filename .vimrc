" FOLLOWING LINES ARE REQUIRED BY VUNDLE.VIM !!
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" All PLUGINS NEED TO BE BETWEEN vundle#begin() AND vundle#end() !!
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'rust-lang/rust.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'joshdick/onedark.vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'elixir-editors/vim-elixir'
Plugin 'rhysd/vim-crystal'
Plugin 'slashmili/alchemist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on
" VUNDLE.VIM END

set tabstop=4
set shiftwidth=4
set expandtab
syntax on
colo onedark
set number relativenumber

" remap :w to Ctrl + S in normal and insert mode
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

"Nerdtree
map <C-n> :NERDTreeToggle<CR>


" Crystal Language Settings
let g:crystal_auto_format=1
autocmd Filetype crystal setlocal ts=2 sw=2 expandtab



let g:clang_library_path='/usr/lib/llvm-6.0/lib'
