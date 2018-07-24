" Syntax
syntax on                      " Enable syntax highlighting

" Color
color desert                   " Color

" Set configs
set nocompatible               " Don't make vim vi-compatibile
set autoindent                 " Copy indent to the new line
set backspace=indent           " ┐
set backspace+=eol             " │ Allow `backspace`
set backspace+=start           " ┘ in insert mode
set backupdir=~/.vim/backups   " Set directory for backup files
set backupskip=/tmp/*          " ┐ Don't create backups
set backupskip+=/private/tmp/* " ┘ for certain files

set clipboard=unnamed          " ┐
                               " │ Use the system clipboard
if has("unnamedplus")          " │ as the default register
    set clipboard+=unnamedplus " │
endif                          " ┘

set cursorline                 " Highlight the current line
set directory=~/.vim/swaps     " Set directory for swap files
set encoding=utf-8 nobomb      " Use UTF-8 without BOM
set history=5000               " Increase command line history
set hlsearch                   " Enable search highlighting
set ignorecase                 " Ignore case in search patterns
set incsearch                  " Highlight search pattern as it is being typed
set laststatus=2               " Always show the status line
set lazyredraw                 " Do not redraw the screen while, executing macros, registers
set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=eol:↴           " │ represent invisible characters
set listchars+=nbsp:_          " ┘
set magic                      " Enable extended regexp
set mousehide                  " Hide mouse pointer while typing
set noerrorbells               " Disable error bells
set nojoinspaces               " When using the join command, only insert a single space after a `.`, `?`, or `!`
set nostartofline              " Kept the cursor on the same column
set number                     " Show line number. Disable temp with :set nonu
set numberwidth=5              " Increase the minimal number of columns used for the `line number`
set report=0                   " Report the number of lines changed
set ruler                      " Show cursor position
set scrolloff=5                " When scrolling, keep the cursor, 5 lines below the top and 5 lines above the bottom of the screen
set shortmess=aAItW            " Avoid all the hit-enter prompts
set showcmd                    " Show the command being typed
set showmode                   " Show current mode
set spelllang=en_us            " Set the spellchecking language
set smartcase                  " Override `ignorecase` option, if the search pattern contains uppercase characters
set synmaxcol=2500             " Limit syntax highlighting (this avoids the very slow redrawing when long lines)
set tabstop=2                  " ┐
set softtabstop=2              " │ Set global <TAB> settings
set shiftwidth=2               " │ http://vimcasts.org/e/2
set expandtab                  " ┘
set ttyfast                    " Enable fast terminal connection
set undodir=~/.vim/undos       " Set directory for undo files
set undofile                   " Automatically save undo history
set virtualedit=all            " Allow cursor to be anywhere
set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping
set wildmenu                   " Enable enhanced command-line, completion (by hitting <TAB> in command mode
set winminheight=0             " Allow windows to be squashed
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" File types
filetype off                  " required
filetype plugin indent on     " required

" Plugins using Vundle
call vundle#begin()           " Plugins using Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " [1] File tree viewer
Plugin 'lepture/vim-jinja'  " [2] Twig syntax
Plugin 'tpope/vim-surround' " [3] easily surround things... Nice intro video: https://www.youtube.com/watch?v=5HF4jSyPpvs
Plugin 'tpope/vim-fugitive' " [4] Themes / Prettify stuff
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'justinj/vim-react-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/tComment' "Comment easily with gcc
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
call vundle#end()            " required

" Plugins Configs
au VimEnter *  NERDTree
