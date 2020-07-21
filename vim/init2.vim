set nocompatible

" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off

" Turn syntax on
syntax on

" enable mouse
set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""
" Plugins with vim-plug (put between begin and end)
call plug#begin('~/.local/share/nvim/plugged')

" Airline - better statusbar/tabs
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nerdtree - project structure sidebar
"" Plug 'scrooloose/nerdtree'

" ranger for vim
Plug 'francoiscabrol/ranger.vim'
" ranger dependancy for neovim
Plug 'rbgrouleff/bclose.vim'

" coc.nvim intellisense for vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" colorcheme
Plug 'morhetz/gruvbox'
"" Plug 'junegunn/seoul256.vim'

" Distraction free writing
Plug 'junegunn/goyo.vim'

" godot plugin
Plug 'habamax/vim-godot'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""

" show line numbers
set nu rnu

" in insert mode show absolute numbers, otherwise hybrid
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set rnu
  autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

" set leader key to ,
let mapleader=","

" remove all trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map godot lint to F5
" nnoremap <silent> <F5> :! gdlint %<cr>

" , + f open ranger in vim - open file in new tab
" disable ranger mappings before setting our own.
let g:ranger_map_keys = 0
map <leader>f :RangerNewTab<CR>

" easier moving between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving of code block in visual mode
vnoremap > <gv
vnoremap < >gv

" toggle spell check with F11
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" useful settings
set history=700
set undolevels=700

" real programmers don't use tabs, they use spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" set tab to two spaces for .js, .html and .css
au BufNewFile,BufRead *.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" use tabs not spaces for godot files
au BufNewFile,BufRead *.gd
    \ set noexpandtab

au BufNewFile,BufRead *.java
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Set clipboard
set clipboard+=unnamedplus

" AIRLINE
" set airline theme
let g:airline_theme='base16_pop'
let g:airline_solarized_bg='dark'

" colorscheme
colorscheme gruvbox
let g:gruvbox_bold = '1'

" coc.nvim configuration

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-markdownlint',
  \ ]

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
