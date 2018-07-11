export PATH=$PATH:/usr/sbin
export PATH=$PATH:$HOME/bin:$HOME/.npm/bin:$HOME/.local/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use 9.11.1 --silent

alias vi=vim
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~/dev"

export PATH=$PATH:/usr/lib/go-1.10/bin::$HOME/.bin
export GOPATH=$HOME/go
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias chrome="google-chrome-stable"
alias fucking="sudo"
alias ~~="cd $HOME/dev"
export PATH="$PATH:/opt/yarn-0.22.0/bin"
export EDITOR=vim
export HISTSIZE=50000
export HISTFILESIZE=100000
export NODEBASHVIM=$HOME/node-bash/vim

alias "ls=ls --color=auto"
if [ -f ~/.dir_colors/dircolors ]
  then eval `dircolors ~/.dir_colors/dircolors`
fi


source /etc/bash_completion.d/docker-machine-prompt.bash
PS1='${PWD##*/} $(__docker_machine_ps1 " [%s]")$ '



if [[ $HOME == "$(pwd)" ]]; then cd $HOME/dev ; fi
if [ -f ~/.secrets ]; then
  source ~/.secrets
fi
