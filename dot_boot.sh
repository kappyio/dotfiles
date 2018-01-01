#!/bin/bash 
# 1: check OS, required packages, versions, etc. install what's needed
# 2: clone personal dotfiles repo
# 3: symlink dotfiles

if [ -f ~/.dotfiles ]; then
    echo "dotfiles dir found"
else
   echo "need a dotfiles dir" 
   git clone https://github.com/vudkapz/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   git submodule add https://github.com/anishathalye/dotbot
   cp dotbot/tools/git-submodule/install .
   touch install.conf.yaml
fi


if [ -f ~/.gitconfig ]; then 
    echo "gitconfig already exists"
else
    ln -fsn ~/.dotfiles/git/.gitconfig ~/.gitconfig
fi
