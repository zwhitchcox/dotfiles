#!/bin/bash

git clone https://github.com/vim
cd vim
sudo ./configure –enable-multibyte \
            --enable-fontset \
            --enable-xim \
            --enable-gui=auto \
            --enable-luainterp=dynamic \
            --enable-pythoninterp=yes \
            --enable-rubyinterp=dynamic \
            --enable-perlinterp \
            --enable-cscope \
            --enable-sniff \
            --with-x \
            --with-compiledby=erocpil \
            --with-features=huge \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu

make
sudo make install
cd ..
rm -rf vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +PlugInstall +qa
