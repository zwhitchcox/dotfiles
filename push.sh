#!/usr/local/bin bash
cp -r ~/.bashrc .
cp -r ~/.vimrc .
cp -r ~/.tmux.conf .
cp -r ~/.gitconfig .
cp -r ~/.snippets .
cp -r ~/.aliases .
git add . -A && git commit -m 'update' && git push
