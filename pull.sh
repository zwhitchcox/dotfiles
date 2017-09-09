#!/bin/bash
git pull origin master
cp -rf .bashrc ~
cp -rf .vimrc ~
cp -rf .tmux.conf ~
cp -rf .gitconfig ~
cp -rf .snippets ~
cp -rf .aliases ~
cp -rf bin ~
chmod +x ~/bin/*
echo "All files copied!"
