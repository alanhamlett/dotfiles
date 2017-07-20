""
"" Vim Configuration
""  Author: Alan Hamlett <alan.hamlett@gmail.com>
""  Url: https://github.com/alanhamlett/dotfiles
""

"" Cheat Sheet
""  Code Navigation:
""      CTRL-g - Go to definition; Opens the file defining the current variable
""      TAB - When pressed after a word, shows autocomplete within current file
""      SPACE - Move current line front and center
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
""  Vundle Plugin Manager:
""      :PluginList          - list configured bundles
""      :PluginInstall       - install bundles
""      :PluginUpdate        - update bundles
""  Window Navigation:
""      CTRL-h - Move cursor to window left of current one
""      CTRL-j - Move cursor to window below current one
""      CTRL-k - Move cursor to window above current one
""      CTRL-l - Move cursor to window right of current one
""  Buffer Navigation: (Tab bar showing open files at top of Vim)
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
""  Git:
""      :Gbrowse - Open the current file in a web browser on GitHub or GHE
""      :Gblame - Blame the current file in a sidebar

" {
    " General

    set nocompatible " explicitly get out of vi-compatible mode
    set encoding=utf-8
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set showcmd " display incomplete commands
    set hidden " allow switching buffers without saving changes to file
    set noerrorbells " don't make beep noises
    set backspace=indent,eol,start " allow backspacing indentation
    "set mouse=a " use mouse everywhere

    " remove whitespace from end of every line
    fun! <SID>StripTrailingWhitespace()
        let s = @/
        let l = line('.')
        let c = col('.')
        call cursor(0, 0)
        silent! %s/\s\+$//e
        call cursor(l, c)
        let @/ = s
    endfun
    autocmd BufWritePre * :call <SID>StripTrailingWhitespace()

    " More Vim configs in ~/.vimrc_local
    let vimrclocal=expand("$HOME/.vimrc_local")
    if filereadable(vimrclocal)
        execute 'source ' . fnameescape(vimrclocal)
    endif
" }

" {
    " Plugins

    " Commands to Manage Plugins
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs any new plugins; append `!` to update or just :PluginUpdate
    " :PluginUpdate     - updates plugins to latest versions
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

    filetype off " Disable temporarily while configuring Vundle

    " Initialize Vundle
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle

    Plugin 'bkad/CamelCaseMotion'
    Plugin 'klen/python-mode'
    Plugin 'rking/ag.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'fholgado/minibufexpl.vim'
    Plugin 'tmhedberg/matchit'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-rhubarb'
    Plugin 'sjl/gundo.vim'
    Plugin 'alanhamlett/vim-jinja'
    Plugin 'pangloss/vim-javascript'
    Plugin 'mxw/vim-jsx'
    Plugin 'genoma/vim-less'
    Plugin 'LargeFile'
    Plugin 'vim-airline/vim-airline'
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
    Plugin 'ludovicchabant/vim-gutentags'
    "Plugin 'scrooloose/syntastic'
    "Plugin 'davidhalter/jedi-vim'

    call vundle#end()
    filetype plugin indent on " Re-enable after configuring Vundle
" }

" {
    " Backup, Swap, and View Files

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

" {
    " File Syntax and Folding

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
    set synmaxcol=900
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
    au Filetype vim setlocal sts=4 sw=4

    set foldlevel=0 " autofold upon opening file
    set foldopen=block,hor,mark,percent,quickfix,tag " movements that open folds
    set nowrap " don't wrap long lines

    " Color tabs red when used for indentation
    function! ShowBadTabs()
        highlight default BadTabs ctermbg=red guibg=red
        au ColorScheme <buffer> highlight default BadTabs ctermbg=red guibg=red
        match BadTabs /\s*\t\+/
    endfunction
    au BufWinEnter,WinEnter,FileType * call ShowBadTabs()
" }

" {
    " UI

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
        au Filetype javascript setlocal colorcolumn=100
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

    " Configure MiniBufExpl tab plugin
    let g:miniBufExplBuffersNeeded = 1

    " Use RipGrep for faster and more accurate CtrlP fuzzy file finding
    if executable('rg')
        set grepprg=rg\ --color=never
        let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
        let g:ctrlp_use_caching = 0
    endif
" }

" {
    " Key Mappings

    " pressing v escapes from visual mode
    vnoremap <v> <Esc>

    " move current line front and center by pressing space
    nnoremap <space> zvzz

    " Up/Down keys scroll one line
    noremap <up> <C-y>
    noremap <down> <C-e>

    " fix syntax highlighting for current buffer by pressing CTRL and s
    noremap <C-s> :syntax sync fromstart

    " Pressing f + a number sets current fold level to that number
    noremap f1 :set foldlevel=1<cr>
    noremap f2 :set foldlevel=2<cr>
    noremap f3 :set foldlevel=3<cr>
    noremap f4 :set foldlevel=4<cr>
    noremap f5 :set foldlevel=5<cr>
    noremap f6 :set foldlevel=6<cr>
    noremap f7 :set foldlevel=7<cr>
    noremap f8 :set foldlevel=8<cr>
    noremap f9 :set foldlevel=9<cr>

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

    " Open NERDTree with Ctrl+t
    map <C-t> :NERDTreeToggle<CR>

    " Go to definition with Ctrl+g
    map <C-g> <C-]>

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

    " Bind AutoComplete to TAB
    function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
            return "\<tab>"
        else
            return "\<c-p>"
        endif
    endfunction
    inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }
