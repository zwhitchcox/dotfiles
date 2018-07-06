#!/bin/bash
sleep 1


wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt-get update
sudo apt-get -y install tmux git cmake apt-transport-https curl ca-certificates software-properties-common google-chrome-stable xclip

xdg-mime default google-chrome-stable.desktop text/html
xdg-mime default google-chrome-stable.desktop x-scheme-handler/http
xdg-mime default google-chrome-stable.desktop x-scheme-handler/https
xdg-mime default google-chrome-stable.desktop x-scheme-handler/about

echo "What is your full name?"
read name
echo "What is your full email?"
read email
git config --global user.name "$name"
git config --global user.email "$email"
git config --global core.editor vim
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "email" -f ~/.ssh/id_rsa -N ""
fi
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
echo;
echo "Your github key has been copied to your clipboard. Paste it into your account in the new browser window. Please create an account if you don't already have one."
echo;
cat ~/.ssh/id_rsa.pub | xclip -selection c
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
