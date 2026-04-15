#!/usr/bin/env bash

set -euo pipefail

brew install neovim ripgrep
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone git://github.com/alanhamlett/dotfiles.git
mkdir -p "$HOME/.config/nvim"
ln -sf "$PWD/dotfiles/nvim_init.lua" "$HOME/.config/nvim/init.lua"
ln -sf "$PWD/dotfiles/vimrc" "$HOME/.vimrc"
rm -f "$HOME/.zshrc" || true
ln -sf "$PWD/dotfiles/zshrc" "$HOME/.zshrc"

# First launch installs lazy.nvim and all plugins automatically
nvim --headless "+Lazy! sync" +qa
