#!/bin/bash
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt-get update
sudo apt-get -y install tmux git cmake apt-transport-https curl ca-certificates software-properties-common google-chrome-stable

xdg-mime default google-chrome.desktop text/html
xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https
xdg-mime default google-chrome.desktop x-scheme-handler/about

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
echo "Use Ctrl+Shift+C to copy, not Ctrl+C"
echo;
(trap '' 2 && cd ~/path/to/zork/ && frotz ZORK1.DAT)
cat ~/.ssh/id_rsa.pub
echo;
xdg-open https://github.com/settings/ssh/new
echo;
read -p  "Press enter continue: "
echo;
trap 2
git clone git@github.com:zwhitchcox/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
cp -r .bin ~/.bin
find . -maxdepth 1 -regextype posix-egrep -regex "\.\/\..*" ! -name .git -exec cp -t .. {} +
source setup.sh
