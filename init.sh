#!/bin/bash
set -xe

# 1. system update
sudo apt -y -qq update

# 2. set timezone
sudo apt -y -qq install tzdata
sudo ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
echo "Asia/Seoul" | sudo tee /etc/timezone

# 3. install essential packages
sudo apt -y -qq install \
	vim wget sudo net-tools \
	git python3

# 4. set vim
git clone "https://github.com/VundleVim/Vundle.vim.git" "$HOME/.vim/bundle/Vundle.vim"
cp "./vim/.vimrc" "$HOME/.vimrc"
git clone "https://github.com/morhetz/gruvbox.git" "$HOME/.vim/bundle/gruvbox"
vim -c 'PluginInstall' -c 'qa!'

# 5. set bash
BASH_CONFIG_DIR="$HOME/dotfiles/bash"

ln -sf "$BASH_CONFIG_DIR/.bashrc" "$HOME/.bashrc"
ln -sf "$BASH_CONFIG_DIR/.bash_prompt" "$HOME/.bash_prompt"
ln -sf "$BASH_CONFIG_DIR/.bash_aliases" "$HOME/.bash_aliases"

source "$HOME/.bashrc"
