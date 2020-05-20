" ==========================================================
" Basic Settings
" ==========================================================
syntax on
filetype on                " try to detect filetypes
filetype plugin indent on  " enable loading indent file for filetype

set nocompatible
set number
set numberwidth=1          " using only 1 column (and 1 space) while possible
set autochdir              " automatically change window's cwd to file's dir
set tabstop=4              " <tab> inserts 4 spaces 
set shiftwidth=4           " but an indent level is 2 spaces wide.
set softtabstop=4          " <BS> over an autoindent deletes both spaces.
set expandtab              " Use spaces, not tabs, for autoindent/tab key.
set foldmethod=syntax      " allow us to fold on indents
set foldlevel=99           " don't fold by default
set hlsearch               " Highlight searches by default.
set cursorline             " have a line indicate the cursor location
set ruler                  " show the cursor position all the time
set ignorecase
set smartcase

let mapleader=","

" more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
endif


let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']


" ==========================================================
" Basic key mapping
" ==========================================================
nmap <leader>l :set list!<CR>         " toggle display of whitespace (eg trailing $)
nmap <leader>n :NERDTreeToggle<CR>    " toggle NERDTree
nmap <leader>p :set paste!<CR>        " toggle paste mode
nmap <leader><space> :TagbarOpenAutoClose<CR> " show actual tag in tagbar
nmap <leader>, :PymodeLint<CR>  " check code with Lint
map <Leader>j :%!python -m json.tool<CR>




" ==========================================================
" Vundle and install bundles
" ==========================================================
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle -- required! 
" Bundle 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'
" The bundles you install will be listed here
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
call vundle#end()

filetype plugin indent on

augroup vimrc_autocmds
   autocmd!
   " highlight characters past column 120
   autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
   autocmd FileType python match Excess /\%120v.*/
   autocmd FileType python set nowrap
   augroup END

" Powerline setup
"   furthermore install this font from:
"   https://github.com/Lokaltog/powerline-fonts/blob/master/DejaVuSansMono/
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
set laststatus=2



" ==========================================================
" Settings for py-mode
" ==========================================================
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0 " use vim-jedi instead

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_ignore = "E501" " ignore line too long
let g:pymode_lint_checker = "flake8"
" let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" let g:pymode_options_max_line_length = 120

" Don't autofold code
let g:pymode_folding = 0


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " Linux/MacOSX


" ==========================================================
" Settings for jedi-vim Python tools
" ==========================================================
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"

" Viewport Controls
" ie moving between split panes
map <leader><Left> <C-w>h
map <leader><Down> <C-w>j
map <leader><Up> <C-w>k
map <leader><Right> <C-w>l
