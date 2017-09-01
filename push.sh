cp -r ~/.bashrc .
cp -r ~/.vimrc .
cp -r ~/.tmux.conf .
cp -r ~/.gitconfig .
cp -r ~/.snippets .
git add . -A && git commit -m 'update' && git push
