#!/usr/local/bin bash
cp -rf ~/.bashrc .
cp -rf ~/.vimrc .
cp -rf ~/.tmux.conf .
cp -rf ~/.gitconfig .
git add . -A && git commit -m 'update' && git push
