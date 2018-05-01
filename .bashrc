export PATH=$PATH:/usr/sbin
export PATH=$PATH:$HOME/bin:$HOME/.npm/bin:$HOME/.local/bin
export NVM_DIR="/home/zane/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

alias vi=vim
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~/dev"

export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.bin
export GOPATH=$HOME/go
nvm use node
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias chrome="google-chrome-stable"
alias fucking="sudo"
alias ~~="cd $HOME/dev"
export PATH="$PATH:/opt/yarn-0.22.0/bin"
export EDITOR=vim
export HISTSIZE=50000
export HISTFILESIZE=100000
export NODEBASHVIM=$HOME/node-bash/vim
if [ -f ~/.dir_colors/dircolors ]
  then eval `dircolors ~/.dir_colors/dircolors`
fi
PS1='${PWD##*/} $ '
if [[ $HOME == "$(pwd)" ]]; then cd $HOME/dev ; fi
export DOAT=92d3b3dfafa89535eca68604fd67760c785b8ceffdeb5c163d02c96462e41e04
