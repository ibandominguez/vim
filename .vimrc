" My custom .vimrc

" TODO:
" - Fixes and Enhancements:
"   - When pressing <Esc> the cursor moves one to the left.
"   - When copying the cursor moves to the beginning of the selection.
"   - Replace Tabs on the left for the project path
"   - Enhanced Specific lang support for TS, JS, PHP, CSS & HTML
"   - Add Snippets
" - Plugins:
"   - Linting
"   - Multicursors
"   - Search and replace, current file and project (Far) 
"   - Improve intellisense

" ==> Plugins Setup 
" ==> Additional functionality 

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'ctrlpvim/ctrlp.vim' 
Plugin 'editorconfig/editorconfig-vim' 
Plugin 'powerline/powerline-fonts'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'neoclide/coc.nvim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc'
Plugin 'Quramy/tsuquyomi'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mhinz/vim-startify'

call vundle#end()

" ==> Running commands
" ==> Setting up env, etc ...

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

" Create parent directories 
autocmd BufWritePre * :silent !mkdir -p %:p:h

" ==> Color scheme
" ==> Configure how vim looks

colorscheme Monokai " Use Monokai theme ~/.vim/colors/Monokai.vim

" ==> Handling syntax
" ==> Use syntax highlighting

syntax on " Use syntax highlighting

" ==> Filetype
" ==> File configs 

filetype plugin indent on " Filetype indentation

" ==> Setting options
" ==> Make vim yours

set showmode " Always show mode
set number " Display numbers
set smartindent " Indent Enhacements
set tabstop=2 " Tab indenting to 2
set shiftwidth=2 " When indenting with '>'
set expandtab " Indenting on tab
set backspace=indent,eol,start " Familiar like backspace behaving
set clipboard=unnamedplus " Make sure vim uses the system keyboard
set ignorecase " Case insensitive search
set smartcase " Use case sensitive if any cap is used
set incsearch " show match as search proceeds
set hlsearch " search highlights
set mouse=a " Enable using the mouse if terminal emulator
set updatetime=100 " Reduces update time for gitgutter to show updates
set encoding=UTF-8 " The encoding displayed.
set fileencoding=UTF-8 " The encoding written to file.
set nobackup " Prevent vim from creating backups
set noswapfile " Prevent vim from creating .sw files

" ==> Mappings
" ==> Custom shortcuts to save time

" Selection
" Ctrl + a = Toggle Select all
map <C-a> <Esc>ggVG<Enter>
imap <C-a> <Esc>ggVG<Enter>

" Prevent from mouse scrolling
" Pass the bottom end line
map <ScrollWheelUp> H5k
map <ScrollWheelDown> L5j

" File shortkeys
" Ctrl + n = Create a new file
" Ctrl + s = Save current file
" Ctrl + o = Use ctrlp Plugin
map <C-n> :tabnew ./filename.ext
noremap <C-s> :w<Enter>
vnoremap <C-s> <Esc>:w<Enter>
inoremap <C-s> <Esc>:w<Enter>

" Cut, Copy and Pase shortkeys
" Ctrl + x = Cut selection
" Ctrl + c = Copy selection
" Ctrl + p = Paste selection
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<Esc>"+p
nmap <C-v> p
imap <C-v> <Esc>"+pa

" Left indentation
" Shift + Tab = Indent left
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Quit Vim
map <C-q> :qa!<Enter>

" Undo, Redo Default shortkeys
" Ctrl + z = Undo 
" Ctrl + r = Redo
map <C-z> u
imap <C-z> <Esc>ua
vmap <C-z> <Esc>uv
imap <C-r> <Esc><C-r>a
vmap <C-r> <Esc><C-r>v

" Tabs shortkeys
" Ctrl + t = Open new tab
" Ctrl + w = Close current tab
" Ctrl + Left = Navigate to previous tab
" Ctrl + Right = Navigate to next tab
map <C-t> :tabnew ./filename.ext
map <C-w> :close<Enter>
map <C-Left> :tabprevious<Enter>
map <C-Right> :tabnext<Enter>

" Find shortkeys
" Ctrl + f = Find in current document
map <C-f> /
imap <C-f> <Esc>/
vmap <C-f> <Esc>/

" ==> Plugins Configuration

autocmd VimEnter *
\   if !argc() || argv(0) == '.'
\ |   Startify
\ |   NERDTree
\ |   wincmd w
\ | endif

" Nerdtree
nnoremap <C-l> :NERDTreeToggle<CR>

" Ctrlp configs
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': [], 'AcceptSelection("t")': ['<cr>', '<c-m>'] } " Open new files in tab
let g:ctrlp_match_current_file = 1 " List editing files too
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " Ignore from .gitignore

" Airline configs
let g:airline#extensions#tabline#enabled = 1 " Enhaced tabs
let g:airline_theme = 'base16_grayscale' " Bar theme
let g:airline_powerline_fonts = 1
