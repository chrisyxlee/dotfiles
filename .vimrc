" Vundle BEGIN
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" google/vim-codefmt BEGIN
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" https://github.com/hashivim/vim-terraform
Plugin 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Vundle END

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
" google/vim-codefmt END

color wombat256mod
set t_Co=256
set term=xterm-256color
syntax enable
set tabstop=2       " The width of a TAB, still it is a \t.
                    " Vim will interpret it to be having such width.
set shiftwidth=2    " Indents will have such width
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab
set paste
set ruler
set colorcolumn=80
set smarttab
set nocindent
set number
set showcmd
set cursorline
set wildmenu
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set filetype=unix
set autoread
set backspace=indent,eol,start
nnoremap j gj
nnoremap k gk
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end
" Always assume *.gvy files are Groovy-compliant file
au BufNewFile,BufRead,BufReadPost *.gvy set syntax=groovy
" Remove trailingw whitespaces
autocmd BufWritePre * :%s/\s\+$//e
" Spellcheck English files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell
set complete+=kspell
" Swapfile and enable backups
silent !mkdir $HOME/.vim > /dev/null 2>&1
silent !mkdir $HOME/.vim/backups > /dev/null 2>&1
silent !mkdir $HOME/.vim/undo > /dev/null 2>&1
silent !mkdir $HOME/.vim/swaps > /dev/null 2>&1
set backup
set dir=$HOME/.vim/swaps//
set backupdir=$HOME/.vim/backups//
" Enable undo storage
set undofile
set undodir=$HOME/.vim/undo//
set undolevels=5000
set undoreload=50000
let myvar = "set backupext=_". strftime("--%y%m%d--%Hh%M")
execute myvar
" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" ALE
let g:ale_linters = {'ruby': ['standardrb'], 'go': ['gofmt'], 'yaml': ['prettier'], 'tf': ['terraform']}
let g:ale_fixers = {'ruby': ['standardrb'], 'go': ['gofmt'], 'yaml': ['prettier'], 'tf': ['terraform']}
let g:ale_fix_on_save = 1
" Protobuf syntax
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
" Auto-formatting.
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

source $HOME/.vim/plugins.vim
