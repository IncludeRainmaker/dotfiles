set nocompatible
filetype off
set shell=/bin/bash
let &t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

"My Plugins
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'slim-template/vim-slim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'rdnetto/YCM-Generator'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'mattesgroeger/vim-bookmarks'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'shougo/vinarise.vim'
Plugin 'fidian/hexmode'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'easymotion/vim-easymotion'
Plugin 'honza/vim-snippets'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'morhetz/gruvbox'

" Disablbled Plugins
"Plugin 'Shougo/unite.vim'
"Plugin 'lokaltog/vim-powerline'
"Plugin 'altercation/vim-colors-solarized'

" Languages/Frameworks
Plugin 'JuliaLang/julia-vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'mitsuhiko/flask'
Plugin 'pangloss/vim-javascript'

call vundle#end()
filetype plugin indent on

let mapleader=","
syntax enable
set background=dark
colorscheme gruvbox

set cursorline
set expandtab
set modelines=0
set shiftwidth=4
set clipboard=unnamed
set ttyscroll=10
set encoding=utf-8
set tabstop=4
set autoindent
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set ignorecase
set smartcase
set smartindent
set ttyfast
set laststatus=2
set ruler
set mouse=a
set diffopt+=vertical
set formatoptions+=r,c,o
set lazyredraw
set updatetime=250
set hlsearch
set completeopt-=preview

let g:enable_bold_font = 1

"DISABLED SETTINGS
"set synmaxcol=128


" YouCompleteMe Config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion=1

"vim airline
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode'
set laststatus=2

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
let g:bookmark_auto_close = 1
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

" Go programming
set rtp+=/usr/local/Cellar/go/1.0.3/misc/vim

" Quit with :Q
command -nargs=0 Quit :q!

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
" }}}
