if !has('nvim')
  set nocompatible
endif
filetype off
"set shell=/bin/bash
let t_Co=256

call plug#begin('~/.vim/plugged')

"My Plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'slim-template/vim-slim'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer' }
Plug 'ervandew/supertab'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nelstrom/vim-visual-star-search'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'drmikehenry/vim-fontsize'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sleuth'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'shougo/denite.nvim'
Plug 'hail2u/vim-css3-syntax'

" Disablbled Plugins
"Plug 'shougo/vinarise.vim'
"Plug 'fidian/hexmode'

" Languages/Frameworks
" Plug 'JuliaLang/julia-vim'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-rake'
Plug 'mitsuhiko/flask'
Plug 'tbastos/vim-lua'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'


call plug#end()
filetype plugin indent on

let mapleader=","
syntax enable
set background=dark
colorscheme gruvbox

set cursorline
set modelines=0
set clipboard=unnamed
set shiftwidth=4
set tabstop=4
if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=10
  set ttyfast
endif
set encoding=utf-8
set autoindent
set nowrap
set number
set nowritebackup
set noswapfile
set nobackup
set ignorecase
set smartcase
set smartindent
set laststatus=2
set ruler
set mouse=a
set diffopt+=vertical
set formatoptions+=r,c,o
set updatetime=250
set hlsearch
set colorcolumn=80
set lazyredraw
" :mode to reset window

let g:enable_bold_font = 1

"DISABLED SETTINGS
"set synmaxcol=128
"set completeopt-=preview

" Use Silver Searchre instead of Ack if it is installed
if executable('ag')
  let g:ackpr = 'ag --vimgrep'
endif

" YouCompleteMe Config
"let g:ycm_global_ycm_extra_conf = 'path to .ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_python_binary_path = 'python3'
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" WhiteSpace Highlighting
let g:better_whitespace_enabled = 0

" vim airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode'

"Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
map <Leader>j <Plug>(easymotion-bd-jk)
map <Leader>k <Plug>(easymotion-bd-jk)
map <leader>w <Plug>(easymotion-bd-w)
map <leader>e <Plug>(easymotion-bd-e)

" Bookmarks
let g:bookmark_auto_save = 1
let g:bookmark_save_per_working_dir = 1

"GitGutter,,
let g:gitgutter_override_sign_column_highlight = 0
"highlight SignColumn ctermbg=NONE
"highlight SignColumn guibg=NONE

" WhiteSpace Auto Remove
autocmd BufWritePre * StripWhitespace

" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go

" No show command
autocmd VimEnter * set nosc

" Copy Paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
imap <C-v> <ESC><C-v>a

" Improved Tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Quick ESC
imap jj <ESC>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" format the entire file
nmap <leader>fef ggVG=

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Tab between buffers
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Resize buffers
if bufwinnr(1)
  nmap Ä <C-W><<C-W><
  nmap Ö <C-W>><C-W>>
  nmap ö <C-W>-<C-W>-
  nmap ä <C-W>+<C-W>+
endif

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
"let NERDTreeShowHidden=1

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'

" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

" Quit with :Q
command -nargs=0 Quit :q!

" }}}
