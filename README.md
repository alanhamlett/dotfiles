Alan's Vim Configuration File
=============================

Unlesh the full potential of Vim!

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

* [Lokaltog/vim-powerline](https://github.com/Lokaltog/vim-powerline#screenshots)
* [fholgado/minibufexpl.vim](https://github.com/fholgado/minibufexpl.vim#features-overview)
* [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive#fugitivevim)
* [Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion#introduction)
* [rstacruz/sparkup](https://github.com/rstacruz/sparkup#sparkup)

Screenshot
----------

![VimScreenShot](https://github.com/alanhamlett/Alan-vimrc/raw/master/images/VimScreenShot.png)

Installation
------------

### Download and copy the [.vimrc](https://github.com/alanhamlett/Alan-vimrc/raw/master/.vimrc) file into your home directory:

    git clone git://github.com/alanhamlett/Alan-vimrc.git
    cp Alan-vimrc/.vimrc $HOME/

### Download and install [Vundle](https://github.com/gmarik/vundle#about), the package manager for Vim plugins & color schemes:

    git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

### Install the Vim plugins and the Solarized color scheme defined in the .vimrc file using vundle:

    vim +BundleInstall +qall

Use a font that's easy on your eyes like the free [Anonymous Pro](http://www.ms-studio.com/FontSales/anonymouspro.html) or Consolas:

    sudo apt-get install fonts-inconsolata

### For terminal users, install the solarized color palette for your terminal.

[iTerm2](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized):

* Download [Solarized Dark.itermcolors](https://github.com/altercation/solarized/raw/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors).
* Open iTerm 2, open Preferences, click on the "Profiles" icon in the preferences toolbar, then select the "colors" tab.
* Click on the "load presets" and select "import...".
* Select the Solarized Dark theme file.

[Guake](https://github.com/coolwanglu/guake-colors-solarized):

    git clone git://github.com/coolwanglu/guake-colors-solarized.git
    ./guake-colors-solarized/set_dark.sh solarized

### You can choose light or dark colors with solarized by editing your $HOME/.vimrc file:

    set background=light

More info on the official [Solarized page](https://github.com/altercation/solarized#features).
