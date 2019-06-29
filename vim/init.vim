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
Plug 'scrooloose/nerdtree'

" coc.nvim intellisense for vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" colorcheme
Plug 'morhetz/gruvbox'

" flake8 plugin
Plug 'nvie/vim-flake8'

" Distraction free writing
Plug 'junegunn/goyo.vim'

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

" Show tabs at all times
"" set showtabline=2

" remove all trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

" run flake8 on save python files
autocmd BufWritePost *.py call Flake8()

" automatic reloading of info.vim
"" autocmd! BufWritePost info.vim source %

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving of code block in visual mode
vnoremap < <gv
vnoremap > >gv

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

" AIRLINE
" set airline theme
let g:airline_theme='solarized'
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

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
