"Puggins
call plug#begin('~/.vim/plugged')
Plug 'dikiaap/minimalist' "theme
Plug 'tomasiser/vim-code-dark' "theme
Plug 'scrooloose/nerdtree'
"Plug 'w0rp/ale'
"Plug 'sirver/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mcchrish/nnn.vim'
call plug#end()

"leader key: space.
let mapleader=" "

"Αρίθμηση
set number
set relativenumber

"Copy to system clipboard
set clipboard=unnamedplus

"Εμφάνιση.
set t_Co=256
set t_ut=
syntax on
colorscheme codedark "minimalist

"wrap lines
set lbr!

"Tab: 2 spaces.
set tabstop=2
set shiftwidth=2
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
"let g:ale_fixers = {
"\   'javascript': ['eslint']
"\}
"let g:ale_open_list=1
"let g:ale_list_window_size=5
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
let g:coc_global_extensions = [ 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-css', 'coc-json', 'coc-html']

" UltiSnips
"let g:UltiSnipsExpandTrigger="<c-j>"

" nerdtree
nmap <C-n> :NERDTreeToggle<CR>

"Buffers
set hidden "Για να φεύγω από unsaved buffer.:
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

"Folding
"set foldmethod=syntax
"set foldlevel=1
"set foldclose=all

"Χειροκίνητο folding με //{{{1 name }}}1
"set foldmethod=marker

"fzf
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
"nmap <Leader>h :History<CR>
"nmap <Leader>t :BTags<CR>
"nmap <Leader>' :Marks<CR>
"nmap <Leader>s :Snippets<CR>

