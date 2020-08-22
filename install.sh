#!/usr/bin/env bash

set -euo pipefail

brew install vim
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone git://github.com/alanhamlett/dotfiles.git
ln -sf $PWD/dotfiles/vimrc $HOME/.vimrc
rm -f $HOME/.zshrc || true
ln -sf $PWD/dotfiles/zshrc $HOME/.zshrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
npm -g install instant-markdown-d import-js
sudo pip install flake8
ln -sf `which flake8` $HOME/.config/flake8
vim +PluginInstall +qall
brew install yarn
cd $HOME/.vim/bundle/vim-prettier; yarn install; cd $OLDPWD
