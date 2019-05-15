"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'sirver/ultisnips'
"Plugin 'tpope/vim-fugitive'
call vundle#end()      
filetype plugin indent on 

"Αρίθμηση:
set number
set relativenumber

"Copy to system clipboard
set clipboard=unnamedplus

"Εμφάνιση σύνταξης αρχείου. Δεν μπορώ να καταλάβω διαφορά.
"syntax on
syntax enable

"wrap lines
set lbr!

"Tab: 4 spaces.
set tabstop=4
set shiftwidth=4
set expandtab

"Ελληνικά με control-6.
"set keymap=greek_utf-8
"set iminsert=0
"set imsearch=-1

"Search down into subfolders
"Provides tab-completion for all file-related tasks
"Fuzzy search χωρίς plugin. :find και tab
set path+=**

" Εμφανίζει όλες τις επιλογές όταν κάνουμε χρήση το TAB.
set wildmenu

"Mouse scroll
set mouse=a

" Shortcut το esc.
inoremap jk <esc>
inoremap kj <esc>

"ale
let g:ale_fixers = {
\   'javascript': ['eslint']
\}
let g:ale_open_list=1
let g:ale_list_window_size=5
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"

" nerdtree
map <C-n> :NERDTreeToggle<CR>

"Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

"Folding
"set foldmethod=syntax
"set foldlevel=1
"set foldclose=all

"Χειροκίνητο folding με //{{{1 name }}}1
set foldmethod=marker
