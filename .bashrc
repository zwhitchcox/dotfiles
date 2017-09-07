export PATH=$PATH:/usr/sbin
export PATH=$PATH:$HOME/bin:$HOME/.npm/bin
export NVM_DIR="/home/zane/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

alias vi=vim
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
nvm use node


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

shopt -s 
alias chrome="google-chrome-stable"
alias fucking="sudo"
export PATH="$PATH:/opt/yarn-0.22.0/bin"
export EDITOR=vim
export HISTSIZE=50000
export HISTFILESIZE=100000
export NODEBASHVIM=$HOME/node-bash/vim
if [ -f ~/.dir_colors/dircolors ]
  then eval `dircolors ~/.dir_colors/dircolors`
fi
