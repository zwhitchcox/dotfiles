#!/usr/local/bin bash
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
find . -maxdepth 1 -regextype posix-egrep -regex "\.\/\..*" ! -name .git -exec cp -t .. {} +
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +PlugInstall +qa
if [ "$HOSTTYPE" = "x86_64" ]
  then
    echo $'syntax enable\nset background=light\ncolorscheme solarized' >> ~/.vimrc
fi
