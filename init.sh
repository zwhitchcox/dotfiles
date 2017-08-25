#!/usr/local/bin bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get -y install tmux git vim
git config --global user.name "Zane Hitchcox"
git config --global user.email zwhitchcox@gmail.com
git config --global core.editor vim
ssh-keygen -t rsa -b 4096 -C "zwhitchcox@gmail.com" -f ~/.ssh/id_rsa -N ""
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
echo;
read -p  "Now, copy this key to your github account and press enter continue: "
echo;
cat ~/.ssh/id_rsa.pub
echo;
git clone git@github.com:zwhitchcox/dotfiles.git
cd dotfiles
sh setup.sh
