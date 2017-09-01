#!/usr/local/bin bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
nvm install node
find . -maxdepth 1 -regextype posix-egrep -regex "\.\/\..*" ! -name .git -exec cp -t .. {} +
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +PlugInstall +qa
if [ "$HOSTTYPE" = "x86_64" ]
  then
    echo $'syntax enable\nset background=light\ncolorscheme solarized' >> ~/.vimrc
fi
