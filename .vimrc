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
Plugin 'sainnhe/edge'
Plugin 'elixir-editors/vim-elixir'
Plugin 'rhysd/vim-crystal'
Plugin 'slashmili/alchemist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'igankevich/mesonic'
Plugin 'neoclide/coc.nvim', {'pinned': 1}
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

" MarcWeber/vim-addon-mw-utils & tomtom/tlib_vim are dependencies of
" garbas/vim-snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

call vundle#end()
filetype plugin indent on
" VUNDLE.VIM END

set tabstop=4
set shiftwidth=4
set expandtab
syntax on
colo onehalfdark
set cursorline
let g:airline_powerline_fonts = 1
let g:airline_theme='onehalfdark'
set number relativenumber

command RebuildTags execute "!ctags -R ."

nnoremap <C-a> :RebuildTags<CR><CR>
nnoremap <C-b> :CtrlPBufTag<CR>
nnoremap <C-m> :CtrlPTag<CR>

" remap :w to Ctrl + S in normal and insert mode
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i

map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

"Nerdtree
map <C-n> :NERDTreeToggle<CR>


" Crystal Language Settings
let g:crystal_auto_format=1
autocmd Filetype crystal setlocal ts=2 sw=2 expandtab


" Perl Language Settings
autocmd BufRead *.t set filetype=perl

" NeoVim does not reset the cursor style on exit
au VimLeave * set guicursor=a:hor100
