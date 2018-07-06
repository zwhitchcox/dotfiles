#!/bin/bash
sudo apt-get update
sudo apt-get -y install tmux git cmake apt-transport-https curl ca-certificates software-properties-common

git config --global user.name "Zane Hitchcox"
git config --global user.email zwhitchcox@gmail.com
git config --global core.editor vim
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "zwhitchcox@gmail.com" -f ~/.ssh/id_rsa -N ""
fi
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
echo;
echo "Now, copy this key to your github account"
echo;
cat ~/.ssh/id_rsa.pub
echo;
xdg-open https://github.com/settings/ssh/new
echo;
read -p  "Press enter continue: "
echo;
git clone git@github.com:zwhitchcox/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
cp -r .bin ~/.bin
find . -maxdepth 1 -regextype posix-egrep -regex "\.\/\..*" ! -name .git -exec cp -t .. {} +
source setup.sh
