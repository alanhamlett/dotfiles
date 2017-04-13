""
"" Vim Configuration
""  Author: Alan Hamlett <alan.hamlett@gmail.com>
""  Url: https://github.com/alanhamlett/dotfiles
""

"" Cheat Sheet
""  Code Folding:
""      zR - Open all folds
""      zM - Close all folds
""      zc - Close one fold under the cursor
""      zC - Close all folds under the cursor recursively
""      zo - Open one fold under the cursor
""      zO - Open all folds under the cursor recursively
""      zv - Open just enough folds to make the line in which the cursor is located not folded
""      zj - Jump to start of next fold
""      zk - Jump to end of previous fold
""      set foldlevel=N - Close all folds at level N
""  Vundle:
""      :PluginList          - list configured bundles
""      :PluginInstall       - install bundles
""      :PluginUpdate        - update bundles
""      :h vundle            - more vundle help
""  Window Navigation:
""      CTRL-h - Move cursor to window left of current one
""      CTRL-j - Move cursor to window below current one
""      CTRL-k - Move cursor to window above current one
""      CTRL-l - Move cursor to window right of current one
""  Buffer Navigation:
""      :e <file> - edit <file> in a new buffer
""      :ls - list current buffers
""      :b <part of file name> - switch to buffer with TAB completion
""      CTRL-n - switch to next buffer
""      CTRL-p - switch to previous buffer
""      CTRL-d - delete current buffer
""      :MBEbf - Move one buffer forward in the most recent used buffer list
""      :MBEbb - Move one buffer backward in the most recent used buffer list
""      CTRL-6 - switch to previously used buffer
""      #-CTRL-6 - switch to buffer number #
""      :b # - switch to buffer number #

" General {
    set nocompatible " explicitly get out of vi-compatible mode
    set encoding=utf-8
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set showcmd " display incomplete commands
    set hidden " allow switching buffers without saving changes to file
    set noerrorbells " don't make beep noises
    set backspace=indent,eol,start " allow backspacing indentation
    "set autochdir " switch to directory containing current file
    "set mouse=a " use mouse everywhere

    " remove whitespace from end of every line
    fun! <SID>StripTrailingWhitespace()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfun
    autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespace()
" }

" Plugins {
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle
    Plugin 'gmarik/Vundle.vim'

    " Plugins
    Plugin 'klen/python-mode'
    Plugin 'rking/ag.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'fholgado/minibufexpl.vim'
    Plugin 'bkad/CamelCaseMotion'
    Plugin 'tmhedberg/matchit'
    Plugin 'tpope/vim-fugitive'
    Plugin 'sjl/gundo.vim'
    Plugin 'alanhamlett/vim-jinja'
    Plugin 'pangloss/vim-javascript'
    Plugin 'genoma/vim-less'
    Plugin 'LargeFile'
    Plugin 'bling/vim-airline'
    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'wakatime/vim-wakatime'
    Plugin 'terryma/vim-expand-region'
    Plugin 'elzr/vim-json'
    Plugin 'othree/javascript-libraries-syntax.vim'
    Plugin 'ctrlpvim/ctrlp.vim' " open fuzzy file finder with CTRL + f
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-surround'
    Plugin 'leafgarland/typescript-vim'
    Plugin 'wavded/vim-stylus'
    Plugin 'mattn/webapi-vim' " required for gist-vim
    Plugin 'mattn/gist-vim' " post current buffer with :Gist
    "Plugin 'scrooloose/syntastic'
    "Plugin 'davidhalter/jedi-vim'


    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required

    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" }

" Backup, Swap, and View Files {
    " Creating directories if they don't exist
    silent execute '!mkdir -p $HOME/.vim/.backups'
    silent execute '!mkdir -p $HOME/.vim/.swaps'
    silent execute '!mkdir -p $HOME/.vim/.views'

    " Store backups in $HOME to keep the directory tree clean
    set backup
    set backupdir=$HOME/.vim/.backups/
    set directory=$HOME/.vim/.swaps/
    set viewdir=$HOME/.vim/.views/
" }

" File Syntax and Folding {
    let g:pymode_folding = 0
    let g:pymode_lint = 1
    let g:pymode_lint_checkers = ['pyflakes']
    let g:pymode_lint_signs = 1
    let g:pymode_lint_cwindow = 1
    let g:pymode_rope_completion = 0
    let g:pymode_rope = 0
    syntax on " enable syntax highlighting in Vim5 and newer

    let g:ycm_filetype_whitelist = { 'python':1 }

    " Turn off syntax highlighting for long lines
    set synmaxcol=600
    let g:LargeFile=10

    " language specific word dividers
    au FileType perl set iskeyword+=@-@,$,%
    au FileType javascript set iskeyword+=$

    " disable json quote concealing
    let g:vim_json_syntax_conceal = 0

    au BufEnter * :syntax sync fromstart " most accurate syntax highlighting
    let perl_extended_vars=1 " highlight Perl vars inside strings
    filetype plugin indent on " load filetype plugins/indent settings
    set fileformats=unix,mac,dos " support fileformats in this order
    set expandtab " Use spaces for indenting
    set shiftwidth=2 " Number of spaces per indent
    set softtabstop=2 " Number of spaces per tab
    set tabstop=4 " Number of spaces in actual tabs
    set autoindent " When pressing Enter, cursor gets indented to same column as previous line
    set foldenable " auto fold code
    set foldmarker={,} " fold C style blocks
    set foldmethod=indent " fold using indentions by default
    au BufNewFile,BufReadPost *.md set filetype=markdown

    " Filetype Specific Indent Settings
    au Filetype javascript setlocal sts=2 sw=2 foldmethod=marker nocindent smartindent
    au Filetype coffee setlocal sts=2 sw=2
    au Filetype typescript setlocal sts=2 sw=2
    au Filetype python setlocal sts=4 sw=4
    au Filetype ruby setlocal sts=2 sw=2
    au FileType perl setlocal sts=4 sw=4 foldmethod=marker
    au Filetype html setlocal sts=2 sw=2 nocindent smartindent
    au Filetype htmldjango setlocal sts=2 sw=2 nocindent smartindent
    au Filetype htmljinja setlocal sts=2 sw=2 nocindent smartindent
    au Filetype css setlocal sts=2 sw=2 nocindent smartindent
    au Filetype less setlocal sts=2 sw=2 nocindent smartindent
    au Filetype scss setlocal sts=2 sw=2 nocindent smartindent
    au Filetype c setlocal sts=2 sw=2 nocindent smartindent

    set foldlevel=0 " autofold upon opening file
    set foldopen=block,hor,mark,percent,quickfix,tag " movements that open folds
    set nowrap " don't wrap long lines
" }

" UI {
    set number " Show line numbers
    set showmatch " Highlight matching braces/parents/brackets
    set incsearch " find as you type search
    set hlsearch " highlight search terms
    set ignorecase " case insensitive search
    set smartcase " case sensitive when uppercase letters present
    set wildmenu " show shell style completion list
    set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
    set scrolloff=2 " minimum lines to keep above and below cursor
    set laststatus=2 " Status bar with file name etc. 0=never, 1=only if > 1 file/buffer/tab, 2=always
    set ruler "Show %of file remaining in statusbar

    " Highlight column 80 to help with line wrapping
    if exists('+colorcolumn')
        set colorcolumn=80
        au Filetype ruby setlocal colorcolumn=100
    endif

    " restore cursor position when reopening files
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

    " Load solarized as the default color scheme
    if filereadable(expand("$HOME/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        set t_Co=256 " enable 256 colors
        set background=dark
        let g:solarized_termcolors=16
        if !has('gui_running')
            let g:solarized_termtrans=1
        endif
        colorscheme solarized

        " Fix background color for vim-gitgutter
        highlight SignColumn ctermbg=NONE
    endif

    " use powerline fonts for airline
    let g:airline_powerline_fonts = 1
" }

" Key Mappings {
    " pressing v escapes from visual mode
    vnoremap <v> <Esc>

    " move current line front and center by pressing space
    nnoremap <space> zvzz

    " Up/Down keys scroll one line
    noremap <up> <C-y>
    noremap <down> <C-e>

    " fix syntax highlighting for current buffer by pressing CTRL and s
    noremap <C-s> :syntax sync fromstart

    " Left/Right keys move towards the next/prev fold marker
    noremap <left> zk
    noremap <right> zj

    " Shift + Backspace becomes regular backspace instead of del
    noremap <S-BS> <BS>
    noremap <DEL> <BS>
    noremap <S-DEL> <BS>
    inoremap <S-BS> <BS>
    inoremap <DEL> <BS>
    inoremap <S-DEL> <BS>

    " Pressing F5 toggles Gundo
    nnoremap <F5> :GundoToggle<CR>

    " Show syntax group for character under cursor by pressing CTRL SHIFT p
    noremap <C-S-P> :call SyntaxAttr()<CR>

    " Open ctrlp.vim with Ctrl-f
    let g:ctrlp_map = '<C-f>'

    " Open NERDTree with Ctrl+g
    map <C-g> :NERDTreeToggle<CR>

    " Set MiniBufExpl Mappings
    map <Leader>e :MBEOpen<cr>
    map <Leader>c :MBEClose<cr>
    map <Leader>t :MBEToggle<cr>
    " Previous buffer in tab list with Ctrl+p
    noremap <C-p> :MBEbp<CR>
    " Next buffer in tab list with Ctrl+n
    noremap <C-n> :MBEbn<CR>
    noremap <C-d> :MBEbd<CR>

    " easier cursor navigation between split windows using CTRL and h,j,k, or l
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l

    " Turn On CamelCaseMotion
    call camelcasemotion#CreateMotionMappings(',')

" }
