call plug#begin()
Plug 'VundleVim/Vundle.vim'

Plug 'rust-lang/rust.vim'
Plug 'kien/ctrlp.vim'
Plug 'racer-rust/vim-racer'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/edge'
Plug 'elixir-editors/vim-elixir'
Plug 'rhysd/vim-crystal'
Plug 'slashmili/alchemist.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'igankevich/mesonic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" MarcWeber/vim-addon-mw-utils & tomtom/tlib_vim are dependencies of
" garbas/vim-snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'arcticicestudio/nord-vim'
Plug 'sbdchd/neoformat'


set termguicolors
Plug 'ayu-theme/ayu-vim'

" light, mirage or dark
let ayucolor="mirage" 

call plug#end()
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
syntax on
colo ayu
set cursorline
let g:airline_powerline_fonts = 1
" let g:airline_theme='onehalfdark'
let g:airline_theme='ayu'
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

" Neoformat
let g:neoformat_cpp_clangformat = {'exe': 'clang-format','args': ['--style=LLVM'] }

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
nnoremap <F3> :Neoformat<CR>


" Perl Language Settings
autocmd BufRead *.t set filetype=perl

" NeoVim does not reset the cursor style on exit
au VimLeave * set guicursor=a:hor100
