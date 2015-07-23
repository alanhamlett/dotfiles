Alan's Dotfiles 
===============

Use my [vimrc config file](https://github.com/alanhamlett/dotfiles/blob/master/vimrc) to get a head-start with [Vim](http://www.vim.org/download.php).

Quick Install Commands
---------------------------

    git clone git://github.com/alanhamlett/dotfiles.git
    ln -sf $PWD/dotfiles/vimrc $HOME/
    git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
    vim +BundleInstall +qall

Key Features
------------

* Code folding for bracket or indention based languages
* Edit multiple files in tabs using minibufexpl plugin
* Using the [Solarized](https://github.com/altercation/solarized#features) color scheme
* Using [Vundle](https://github.com/gmarik/vundle#about) for plugin management (apt-get for Vim plugins)
* Common swp, backup, & view directories (No more ~ files left around)
* Useful defaults (spaces instead of tabs, remove trailing newlines, etc.)

Plugins Included
----------------

* [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [bling/vim-airline](https://github.com/bling/vim-airline)
* [fholgado/minibufexpl.vim](https://github.com/fholgado/minibufexpl.vim#features-overview)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive#fugitivevim)
* [sjl/gundo.vim](https://github.com/sjl/gundo.vim)
* [LargeFile](http://vim.sourceforge.net/scripts/script.php?script_id=1506)

Screenshot
----------

![VimScreenShot](https://github.com/alanhamlett/dotfiles/raw/master/images/VimScreenShot.png)

Installation
------------

### Download and install my [vimrc](https://github.com/alanhamlett/dotfiles/raw/master/vimrc) file:

    git clone git://github.com/alanhamlett/dotfiles.git
    ln -sf $PWD/dotfiles/vimrc $HOME/

### Download and install [Vundle](https://github.com/gmarik/vundle#about), the vim plugin manager:

    git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

### Install the Vim plugins using Vundle:

    vim +BundleInstall +qall

### Use a font patched for airline compatibility, like [Anonymous Pro](https://github.com/powerline/fonts/raw/master/AnonymousPro/Anonymice%20Powerline.ttf):

[Full list of fonts](https://github.com/powerline/fonts)

### Install the solarized color palette in your terminal:

[iTerm2](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized):

* Download [Solarized Dark.itermcolors](https://github.com/altercation/solarized/raw/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors).
* Open iTerm 2, open Preferences, click on the "Profiles" icon in the preferences toolbar, then select the "colors" tab.
* Click on the "load presets" and select "import...".
* Select the Solarized Dark theme file.

[Guake](https://github.com/coolwanglu/guake-colors-solarized):

    git clone git://github.com/coolwanglu/guake-colors-solarized.git
    ./guake-colors-solarized/set_dark.sh solarized

### Choose Solarized's light or dark theme in your vimrc file:

    set background=dark

More info on the official [Solarized page](https://github.com/altercation/solarized#features).
